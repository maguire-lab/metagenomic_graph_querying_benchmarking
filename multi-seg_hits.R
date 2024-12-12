##number of multisegment hits per data type 

library(tidyverse)

# read in data

#minigraph
minigraph<-read_csv("final_results/minigraph_hits.csv")

## bandage
bandage<-read_csv("final_results/bandage_hits.csv")
names(bandage)[names(bandage) == "Mean hit identity"] <- 'perc_ID'
names(bandage)[names(bandage) == 'Query covered by hits'] <- 'perc_query_cov'

## graphaligner
graphaligner<-read_csv("final_results/graphaligner_hits.csv")
colnames(graphaligner)[colnames(graphaligner) == 'perc_identity'] <- 'perc_ID'

## spaliner
spaliner<-read_csv("final_results/spaliner_hits.csv")

##fix pathracer columns to be ratios

pathracer<-pathracer%>%
  mutate(perc_ID = Best_Identities/100, 
         perc_query_cov = `Percentage Length of Reference Sequence`/100)



# identify the number of multisegment hits in each tool

#bandage

bandage$path<-gsub("edge_","edge-",bandage$path)

multi_count<-c()

for (i in 1:nrow(bandage)) {
  tmp<-if_else(grepl("_",bandage[i,"path"]),1,0)
  multi_count<-c(multi_count,tmp)
  rm(tmp)
}

bandage$multi_count<-multi_count

bandage<-bandage%>%
  group_by(graph)%>%
  summarise(multi_hits=sum(multi_count))

bandage$tool<-"Bandage"

# graphaligner

graphaligner$path<-gsub('^.','',graphaligner$path)

multi_count<-c()

for (i in 1:nrow(graphaligner)) {
  tmp<-if_else(grepl(">|<",graphaligner[i,"path"]),1,0)
  multi_count<-c(multi_count,tmp)
  rm(tmp)
}

graphaligner$multi_count<-multi_count

graphaligner<-graphaligner%>%
  group_by(graph)%>%
  summarise(multi_hits=sum(multi_count))

graphaligner$tool<-"GraphAligner"


# minigraph

minigraph$path<-gsub('^.','',minigraph$path)

multi_count<-c()

for (i in 1:nrow(minigraph)) {
  tmp<-if_else(grepl(">|<",minigraph[i,"path"]),1,0)
  multi_count<-c(multi_count,tmp)
  rm(tmp)
}

minigraph$multi_count<-multi_count

minigraph<-minigraph%>%
  group_by(graph)%>%
  summarise(multi_hits=sum(multi_count))

minigraph$tool<-"Minigraph"

#spaliner

multi_count<-c()

for (i in 1:nrow(spaliner)) {
  tmp<-if_else(grepl(",",spaliner[i,"path"]),1,0)
  multi_count<-c(multi_count,tmp)
  rm(tmp)
}

spaliner$multi_count<-multi_count

spaliner<-spaliner%>%
  group_by(graph)%>%
  summarise(multi_hits=sum(multi_count))

spaliner$tool<-"SPAligner"


#combine data frames

all<-rbind(bandage,graphaligner,minigraph,spaliner)

##plot

all<-all%>%
  separate_wider_delim(graph,"_",names = c("data_type","read_type","subsam","assembler"))

all$data_type<-gsub("HC","High Complexity",all$data_type)
all$data_type<-gsub("LC","Low Complexity",all$data_type)
all$data_type<-gsub("RZ","Real Zymbiomics",all$data_type)
all$data_type<-gsub("ME","Mobile Element",all$data_type)

all$assembler<-gsub("MH","Megahit",all$assembler)
all$assembler<-gsub("MS","MetaSPAdes",all$assembler)
all$assembler<-gsub("MF","MetaFlye",all$assembler)
all$assembler<-gsub("SH","Shasta",all$assembler)

all$read_type<-gsub("LR","Long Read",all$read_type)
all$read_type<-gsub("SR","Short Read",all$read_type)

all$data_type<-factor(all$data_type,levels = c("High Complexity","Mobile Element","Low Complexity","Real Zymbiomics"))




all%>%
  filter(subsam==100)%>%
  ggplot(aes(x=data_type,y=multi_hits,fill=tool))+
  geom_bar(stat = "identity",position = "dodge")+
  facet_wrap(~assembler)+
  scale_fill_manual(values = c("#1b9e77","#7570b3","#e7298a","#e6ab02"),name="Tool")+
  labs(x="Data Type",y="Number of Multi-Segment Hits")
















