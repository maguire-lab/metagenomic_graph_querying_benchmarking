# graph searching sarand data analyses and vizualization 
library(tidyverse)
library(ggpattern)

## computational resources 

# load files, add a tool column, and combine them
tr_band<-read_tsv("final_trace_bandage.tsv")
tr_band$tool<-"Bandage"
tr_bifrost<-read_tsv("final_trace_bifrost.tsv")
tr_bifrost$tool<-"Bifrost"
tr_GA<-read_tsv("final_trace_graphAligner.tsv")
tr_GA$tool<-"GraphAligner"
tr_miniG<-read_tsv("final_trace_minigraph.tsv")
tr_miniG$tool<-"Minigraph"
tr_spa<-read_tsv("final_trace_spaliner.tsv")
tr_spa$tool<-"SPAligner"
tr_path<-read_tsv("final_trace_pathracer.tsv")
tr_path$tool<-"Pathracer"

# combine 
tr_all<-rbind(tr_band, tr_bifrost, tr_GA, tr_miniG, tr_path, tr_spa)

## Tool processing, only include processes to compare directly

# separate out tag column 

tr_all<-tr_all%>%
  separate_wider_delim(tag, delim = "_", names = c("data_type", "read_type","subsample","assembler"))

# filter out any failed runs
tr_all<-tr_all%>%
  filter(status!="FAILED")

#filter out trimGraph processes that also failed (Shasta)
tr_all<-tr_all%>%
  filter(assembler!="SH" | tool!="Minigraph")


# separate out name column 
tr_all<-tr_all%>%
  separate_wider_delim(name, delim = " ", names = c("process","tag"))

# filter away mmseqs and rgi runs 

to_filt<-c("MMSEQS_DB","MMSEQS_EXTRACT_ORFS","MMSEQS_CLUSTER","RGI")

tr_all<-tr_all%>%
  filter(!process %in% to_filt)

# select relevant columns
tr_all<-tr_all%>%select(tag,data_type,read_type,assembler,process,realtime,peak_rss,tool)


# rename trimGraph to minigraph

tr_all<-tr_all%>%
  mutate(process=str_replace(process,"trimGraph","minigraph"))

# sumarize data for minigraph

tr_all$peak_rss<-as.numeric(tr_all$peak_rss)

tr_all<-tr_all%>%
  group_by(tag, tool, data_type, read_type, assembler, process)%>%
  summarise(realtime=sum(realtime),peak_rss=max(peak_rss))

# convert units of realtime and peak_RSS

tr_all<-tr_all%>%
  mutate(realtime = realtime/1000, peak_rss=peak_rss/1000000000)


# convert data_type, read_type, and assembler columns to prper names
tr_all$data_type<-gsub("HC","High Complexity",tr_all$data_type)
tr_all$data_type<-gsub("LC","Low Complexity",tr_all$data_type)
tr_all$data_type<-gsub("RZ","Real Zymbiomics",tr_all$data_type)
tr_all$data_type<-gsub("ME","Mobile Element",tr_all$data_type)

tr_all$assembler<-gsub("MH","Megahit",tr_all$assembler)
tr_all$assembler<-gsub("MS","MetaSPAdes",tr_all$assembler)
tr_all$assembler<-gsub("MF","MetaFlye",tr_all$assembler)
tr_all$assembler<-gsub("SH","Shasta",tr_all$assembler)

tr_all$read_type<-gsub("LR","Long Read",tr_all$read_type)
tr_all$read_type<-gsub("SR","Short Read",tr_all$read_type)


# all tools runtime facet
tr_all%>%
  ggplot(aes(x=tool, y=realtime, fill=tool, pattern=assembler,label=floor(realtime)))+
  geom_bar_pattern(stat = "identity", position = position_dodge(preserve = "single"), color = "black", 
                   pattern_fill = "black",
                   pattern_angle = 45,
                   pattern_density = 0.01,
                   pattern_spacing = 0.05,
                   pattern_key_scale_factor = 0.6)+
  #geom_text(position = position_dodge(0.9),size=2.5, vjust=-0.5)+
  facet_grid(read_type~data_type)+
  scale_fill_brewer(palette = "Dark2")+
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  guides(fill="none")+
  labs(x="Tool", y="Time (s)", pattern="Assembler")
  

#log runtime
tr_all%>%
  mutate(log_time = log10(realtime))%>%
  ggplot(aes(x=tool, y=log_time, fill=tool, pattern=assembler))+
  geom_bar_pattern(stat = "identity", position = position_dodge(preserve = "single"), color = "black", 
                   pattern_fill = "black",
                   pattern_angle = 45,
                   pattern_density = 0.01,
                   pattern_spacing = 0.05,
                   pattern_key_scale_factor = 0.6)+
  facet_grid(read_type~data_type)+
  scale_fill_brewer(palette = "Dark2")+
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  guides(fill="none")+
  labs(x="Tool", y="Log10 Time (s)", pattern="Assembler")

#peak RSS
tr_all%>%
  ggplot(aes(x=tool, y=peak_rss, fill=tool, pattern=assembler))+
  geom_bar_pattern(stat = "identity", position = position_dodge(preserve = "single"), color = "black", 
                   pattern_fill = "black",
                   pattern_angle = 45,
                   pattern_density = 0.01,
                   pattern_spacing = 0.05,
                   pattern_key_scale_factor = 0.6)+
  facet_grid(read_type~data_type)+
  scale_fill_brewer(palette = "Dark2")+
  theme(axis.text.x = element_text(angle = 45, hjust=1))+
  guides(fill="none")+
  labs(x="Tool", y="Peak Resident Set Size (GB)", pattern="Assembler")





















