## calculating PR curves for graph querying hits but only presence/absence 
## AT family level,change in hit function 

library(tidyverse)

#load card data, i.e. whole set 
CARD<-read_csv("../baseline/CARD.csv")
CARD<-CARD%>%
  select(ARO_name, ARO_accession, AMR_gene_family)

#load baseline rgi data for each data type

HC_baseline<-read_tsv("../baseline/baseline_AMR/HC_rgi_results_all.tsv")

# filter out anything but protein homolog model 
HC_baseline<-HC_baseline%>%
  filter(Model_type == "protein homolog model")

LC_baseline<-read_tsv("../baseline/baseline_AMR/LC_rgi_results_all.tsv")
LC_baseline<-LC_baseline%>%
  filter(Model_type == "protein homolog model")

RZ_baseline<-read_tsv("../baseline/baseline_AMR/real_rgi_results_all.tsv")
RZ_baseline<-RZ_baseline%>%
  filter(Model_type == "protein homolog model")

ME_baseline<-read_tsv("../baseline/baseline_AMR/mge_baseline.tsv")
ME_baseline<-ME_baseline%>%
  filter(Model_type == "protein homolog model")

#calculate predicted condition positive and negatives for each search algorithm and for read type

# read in data and combine

#minigraph
minigraph<-read_csv("final_results/minigraph_hits.csv")

#bifrost
bifrost<-read_csv("final_results/bifrost_hits.csv")

## bandage
bandage<-read_csv("final_results/bandage_hits.csv")
names(bandage)[names(bandage) == "Mean hit identity"] <- 'perc_ID'
names(bandage)[names(bandage) == 'Query covered by hits'] <- 'perc_query_cov'

## graphaligner
graphaligner<-read_csv("final_results/graphaligner_hits.csv")
colnames(graphaligner)[colnames(graphaligner) == 'perc_identity'] <- 'perc_ID'

## spaliner
spaliner<-read_csv("final_results/spaliner_hits.csv")

# pathracer
pathracer<-read_csv("final_results/pathracer_hits.csv")

##fix pathracer columns to be ratios

pathracer<-pathracer%>%
  mutate(perc_ID = Best_Identities/100, 
         perc_query_cov = `Percentage Length of Reference Sequence`/100)


##read in contig data 
contigs_rgi<-read_tsv("final_results/final_rgi_contig_results.tsv")
header<-c("graph", colnames(contigs_rgi))
colnames(contigs_rgi)<-header
rm(header)
contigs_rgi$graph<-gsub("_contigs_rgi_results.txt","",contigs_rgi$graph)
contigs_rgi$graph<-gsub("_rgi_results.txt","",contigs_rgi$graph)
contigs_rgi$graph<-gsub("./final_rgi_contig_results/","",contigs_rgi$graph)

##fix columns to be ratios
contigs_rgi<-contigs_rgi%>%
  filter(Model_type=="protein homolog model")%>%
  mutate(perc_ID = Best_Identities/100, 
         perc_query_cov = `Percentage Length of Reference Sequence`/100)

## read in cluster codes

cluster_codes_cols<-c("cluster","gene","ARO_accession","family")

cluster_codes<-read_csv("card_cluster_codes.csv",col_names = cluster_codes_cols)

cluster_codes$cluster<-gsub("_.*","",cluster_codes$cluster)

cluster_codes$cluster<-paste(cluster_codes$family,cluster_codes$cluster,sep = "_")

colnames(cluster_codes)[colnames(cluster_codes) == "ARO_accession"]<-"ARO"

## join cluster to classifications and hits 
HC_baseline<-left_join(HC_baseline,cluster_codes%>%select(cluster,ARO))
LC_baseline<-left_join(LC_baseline,cluster_codes%>%select(cluster,ARO))
RZ_baseline<-left_join(RZ_baseline,cluster_codes%>%select(cluster,ARO))
ME_baseline<-left_join(ME_baseline,cluster_codes%>%select(cluster,ARO))


minigraph<-left_join(minigraph,cluster_codes%>%select(cluster,ARO))
bifrost<-left_join(bifrost,cluster_codes%>%select(cluster,ARO))
bandage<-left_join(bandage,cluster_codes%>%select(cluster,ARO))
graphaligner<-left_join(graphaligner,cluster_codes%>%select(cluster,ARO))
spaliner<-left_join(spaliner,cluster_codes%>%select(cluster,ARO))
pathracer<-left_join(pathracer,cluster_codes%>%select(cluster,ARO))
contigs_rgi<-left_join(contigs_rgi,cluster_codes%>%select(cluster,ARO))


## create a classification dataframe for each ARO in the CARD database

classifications<-CARD
colnames(classifications)[colnames(classifications) == "ARO_accession"]<-"ARO"
classifications<-left_join(classifications,cluster_codes%>%select(cluster,ARO))

classifications$actual_HC_classification <- if_else(classifications$ARO %in% HC_baseline$ARO, 1,0)
classifications$actual_LC_classification <- if_else(classifications$ARO %in% LC_baseline$ARO, 1,0)
classifications$actual_RZ_classification <- if_else(classifications$ARO %in% RZ_baseline$ARO, 1,0)
classifications$actual_ME_classification <- if_else(classifications$ARO %in% ME_baseline$ARO, 1,0)

classifications<-classifications%>%
  select(-ARO,-ARO_name)%>%
  group_by(cluster)%>% 
  summarise(actual_HC_classification = if_else(sum(actual_HC_classification)>0,1,0),
            actual_LC_classification = if_else(sum(actual_LC_classification)>0,1,0),
            actual_RZ_classification = if_else(sum(actual_RZ_classification)>0,1,0),
            actual_ME_classification = if_else(sum(actual_ME_classification)>0,1,0))


## define tally gene hits function 
tally_gene_hits<-function(tool,graph_type,hit_file,classification_file){
  if (tool == "MG" | tool == "BAN" | tool == "GA" | tool == "PA" | tool == "CON") {
    ID<-c(0.5,0.6,0.7,0.8,0.9,1)
    QC<-c(0.5,0.6,0.7,0.8,0.9,1)
    for (i  in ID) {
      for (j  in QC) {
        assign("column",paste(tool,graph_type,i,j,sep = "_"))
        hit_list<-hit_file%>%
          filter(graph == graph_type & perc_ID >= get("i") & perc_query_cov >= get("j"))%>%
          pull(cluster)
        classification_file[,column]<-if_else(classification_file$cluster %in% hit_list,1,0)
      }
    }
    return(classification_file)
  }
  if (tool == "BI") {
    ID<-c(0.5,0.6,0.7,0.8,0.9,1)
    for (i  in ID) {
      assign("column",paste(tool,graph_type,i,"NA",sep = "_"))
      hit_list<-hit_file%>%
        filter(graph == graph_type & ratio_found_kmers >= get("i"))%>%
        pull(cluster)
      classification_file[,column]<-if_else(classification_file$cluster %in% hit_list,1,0)
    }
    return(classification_file)
  }
  if (tool == "SPA") {
    QC<-c(0.5,0.6,0.7,0.8,0.9,1)
    for (j  in QC) {
      assign("column",paste(tool,graph_type,"NA",j,sep = "_"))
      hit_list<-hit_file%>%
        filter(graph == graph_type & perc_query_cov >= get("j"))%>%
        pull(cluster)
      classification_file[,column]<-if_else(classification_file$cluster %in% hit_list,1,0)
    }
    return(classification_file)
  }
  if (tool == "READS") {
    ID<-c(0.5,0.6,0.7,0.8,0.9,1)
    QC<-c(0.5,0.6,0.7,0.8,0.9,1)
    for (i  in ID) {
      for (j  in QC) {
        assign("column",paste(tool,graph_type,i,j,sep = "_"))
        hit_list<-hit_file%>%
          filter(graph == graph_type & pident >= get("i") & qcovhsp >= get("j"))%>%
          group_by(sseqid)%>%
          summarise(read_number = n())%>%
          separate_wider_delim(sseqid,"|",names = c("gene_name","cluster","family"))%>%
          pull(cluster)
        classification_file[,column]<-if_else(classification_file$cluster %in% hit_list,1,0)
      }
    }
    return(classification_file)
  }
  else {
    print("Error: did not use correct tool abbreviations")
    print("MG: minigraph, BI: bifrost, BAN: bandage, GA: graphaligner, SPA: SPAligner, PA: pathracer, CON: contigs","READS: reads")
  }
}

## define true positive calculation function 
tps_function<-function(tool,data_type,classification_file){
  if (data_type == "HC") {
    classification_file<-classification_file%>%
      mutate(across(starts_with(paste(tool,data_type,sep = "_")), ~ case_when(
        actual_HC_classification > . ~ .,
        . >= actual_HC_classification ~ actual_HC_classification
      ), .names = "{.col}_TP"))
    return(classification_file)
  }
  if (data_type=="LC") {
    classification_file<-classification_file%>%
      mutate(across(starts_with(paste(tool,data_type,sep = "_")), ~ case_when(
        actual_LC_classification > . ~ .,
        . >= actual_LC_classification ~ actual_LC_classification
      ), .names = "{.col}_TP"))
    return(classification_file)
  }
  if (data_type=="RZ") {
    classification_file<-classification_file%>%
      mutate(across(starts_with(paste(tool,data_type,sep = "_")), ~ case_when(
        actual_RZ_classification > . ~ .,
        . >= actual_RZ_classification ~ actual_RZ_classification
      ), .names = "{.col}_TP"))
    return(classification_file)
  }
  if (data_type=="ME") {
    classification_file<-classification_file%>%
      mutate(across(starts_with(paste(tool,data_type,sep = "_")), ~ case_when(
        actual_ME_classification > . ~ .,
        . >= actual_ME_classification ~ actual_ME_classification
      ), .names = "{.col}_TP"))
    return(classification_file)
  }
  else{
    error_message = "Incorrect datatype (HC,LC,RZ,ME) used."
    return(error_message)
  }
}

## define precision and recall calculation function 
calculate_PR<-function(tool,classification_file){
  data_types = c("HC","LC","RZ","ME")
  PR_all<-tibble()
  for (D in data_types) {
    if (D == "HC") {
      AC_sum = sum(classification_file$actual_HC_classification)
    }
    if (D == "LC") {
      AC_sum = sum(classification_file$actual_LC_classification)
    }
    if (D == "RZ") {
      AC_sum = sum(classification_file$actual_RZ_classification)
    }
    if (D == "ME") {
      AC_sum = sum(classification_file$actual_ME_classification)
    }
    pred_pos<-classification_file%>%
      select(!ends_with("_TP"),-actual_HC_classification,-actual_LC_classification,-actual_RZ_classification,-actual_ME_classification)%>%
      select(starts_with(paste(tool,D,sep = "_")))%>%
      pivot_longer(starts_with(paste(tool,D,sep = "_")),names_to = "dat", values_to = "count")%>%
      group_by(dat)%>%
      summarise(predicted_positives = sum(count))
    tps<-classification_file%>%
      select(ends_with("_TP"))%>%
      select(starts_with(paste(tool,D,sep = "_")))%>%
      pivot_longer(ends_with("_TP"),names_to = "dat",values_to = "true_positives")%>%
      group_by(dat)%>%
      summarise(tp_sum = sum(true_positives))
    tps$dat<-gsub("_TP","",tps$dat)
    PR<-left_join(tps,pred_pos,by="dat")
    PR<-PR%>%
      mutate(recall = tp_sum/AC_sum, precision = tp_sum/predicted_positives)
    PR_all<-rbind(PR_all,PR)
  }
  return(PR_all)
}


# tally hits for each tool and graph type.

graph_types<-unique(contigs_rgi$graph)
tool_list<-c("BAN","BI","GA","MG","PA","SPA","CON")
hit_list<-list(bandage,bifrost,graphaligner,minigraph,pathracer,spaliner,contigs_rgi)

for (i in 1:length(tool_list)) {
  for (graph in graph_types) {
    classifications<-tally_gene_hits(tool_list[i],graph,hit_list[[i]],classifications)
  }
}

## calculate true positives
for (tool in tool_list) {
  for (data_type in c("HC","LC","RZ","ME")) {
    classifications<-tps_function(tool,data_type,classifications)
  }
}

# calculate precision and recall 
PR_all<-tibble()
for (tool in tool_list) {
  tmp<-calculate_PR(tool,classifications)
  PR_all<-rbind(PR_all,tmp)
}

# add PR_cluster_reads

PR_reads<-read_csv("reads/pr_cluster_reads.csv")
PR_reads$dat<-gsub("_NA_","_NA_NA_",PR_reads$dat)

PR_all<-rbind(PR_all,PR_reads)

##plots

## expand dat 

PR_all<-PR_all%>%
  separate_wider_delim(dat,"_",names = c("tool","data_type","read_type","subsample_perc","assembler","perc_ID","perc_query_coverage"),too_few = "align_start")

## plot

PR_all$cuttoffs<-paste(PR_all$perc_ID,PR_all$perc_query_coverage,sep = "_")

#minigraph fig
#PR_all%>%
#  filter(tool == "MG" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = cuttoffs))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Minigraph Presence/Absence AMR gene level Precision vs Recall" )

#bifrost fig
#PR_all%>%
#  filter(tool == "BI" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = perc_ID))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Bifrost Presence/Absence AMR gene level Precision vs Recall" )

# bandage fig
#PR_all%>%
#  filter(tool == "BAN" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = cuttoffs))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Bandage Presence/Absence AMR gene level Precision vs Recall" )

# Grapgaligner fig
#PR_all%>%
#  filter(tool == "GA" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = cuttoffs))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Graphaligner Presence/Absence AMR gene level Precision vs Recall" )

#spliner fig
#PR_all%>%
#  filter(tool == "SPA" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = perc_query_coverage))+
#  geom_jitter(aes(shape=read_type,colour=data_type),width = 0.0005)+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "SPAligner Presence/Absence AMR gene level Precision vs Recall" )

#Pathracer fig
#PR_all%>%
#  filter(tool == "PA" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = cuttoffs))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Pathracer Presence/Absence AMR gene level Precision vs Recall" )

#contigs fig
#PR_all%>%
#  filter(tool == "CON" & !is.nan(precision))%>%
#  ggplot(aes(x=recall,y=precision,label = cuttoffs))+
#  geom_point(aes(shape=read_type,colour=data_type))+
#  geom_text(vjust=1.5, size = 2,check_overlap = TRUE)+
#  facet_wrap(~data_type,scales = "free_x")+
#  labs(x="Recall",y="Precision",title = "Contigs Presence/Absence AMR gene level Precision vs Recall" )

## all together 

PR_all$tool<-factor(PR_all$tool,levels = c("BAN","BI","GA","MG","PA","SPA","CON","READS"))

#PR_all%>%
#  ggplot(aes(x=recall,y=precision))+
#  geom_point(aes(shape=read_type,colour=tool),size = 4)+
#  facet_wrap(~data_type,scales = "free_x")+
#  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs"))

PR_all$precision<-gsub("NaN",0,PR_all$precision)
PR_all$precision<-as.numeric(PR_all$precision)

#PR_all%>%
#  ggplot(aes(x=recall,y=precision))+
#  geom_point(aes(shape=read_type,colour=tool),size = 4)+
#  facet_grid(read_type~data_type,scales = "free_x")+
#  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs"))


top_PR<-PR_all%>%
  mutate(area = recall * precision)%>%
  group_by(tool,data_type,read_type,assembler,subsample_perc)%>%
  slice_max(area, n = 1)%>%
  slice(1)


# one plot for each read subsample

top_PR$data_type<-gsub("HC","High Complexity",top_PR$data_type)
top_PR$data_type<-gsub("LC","Low Complexity",top_PR$data_type)
top_PR$data_type<-gsub("RZ","Real Zymbiomics",top_PR$data_type)
top_PR$data_type<-gsub("ME","Mobile Element",top_PR$data_type)

top_PR$assembler<-gsub("MH","Megahit",top_PR$assembler)
top_PR$assembler<-gsub("MS","MetaSPAdes",top_PR$assembler)
top_PR$assembler<-gsub("MF","MetaFlye",top_PR$assembler)
top_PR$assembler<-gsub("SH","Shasta",top_PR$assembler)

top_PR$read_type<-gsub("LR","Long Read",top_PR$read_type)
top_PR$read_type<-gsub("SR","Short Read",top_PR$read_type)

top_PR$data_type<-factor(top_PR$data_type,levels = c("High Complexity","Mobile Element","Low Complexity","Real Zymbiomics"))


#25
top_PR%>%
  filter(tool!="READS" & subsample_perc == 25)%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_grid(read_type~data_type,scales = "free_x")+
  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs","Reads"))+
  scale_shape_manual(values = c(13,15,16,9))+
  labs(x= "Recall",y="Precision",shape="Assembler",title = "25%")+
  theme(text = element_text(size = 12))+
  scale_shape_manual(values = c(15,6,17,12))

#50
top_PR%>%
  filter(tool!="READS" & subsample_perc == 50)%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_grid(read_type~data_type,scales = "free_x")+
  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs","Reads"))+
  labs(x= "Recall",y="Precision",shape="Assembler",title = "50%")+
  theme(text = element_text(size = 12))+
  scale_shape_manual(values = c(15,6,17,12))

#75
top_PR%>%
  filter(tool!="READS" & subsample_perc == 75)%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_grid(read_type~data_type)+
  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs","Reads"))+
  labs(x= "Recall",y="Precision",shape="Assembler",title = "75%")+
  theme(text = element_text(size = 12))+
  scale_shape_manual(values = c(15,6,17,12))

#100
top_PR%>%
  filter(subsample_perc == 100)%>%
  filter(assembler!="Shasta" | tool!="MG")%>%
  filter(assembler!="Shasta" | tool!="PA")%>%
  filter(assembler!="Shasta" | tool!="BI" | data_type!="Low Complexity")%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_grid(read_type~data_type)+
  scale_color_brewer(type = "qual",palette = "Dark2",name = "Tool",labels=c("Bandage","Bifrost","GraphAligner","Minigraph","Pathracer","SPAligner","Contigs","Reads"))+
  labs(x= "Recall",y="Precision",shape="Assembler")+
  theme(text = element_text(size = 12))+
  scale_shape_manual(values = c(6,15,17,18,12))+
  xlim(0,1)
