## read analyses 

# done in a separate script as there are not multiple assemblers for the long read datasets
# SR comes from rgi-bwt (kma) LR done with minimap2 followed by samtools to calculate coverage 

#Aim: produce a PR_all dataframe for the reads which can then be added to the PR_all dataframe for the graphs and contigs


library(tidyverse)

# read in data

SR<-read_tsv("reads/rgi_bwt_SR_results.tsv")
LR<-read_tsv("reads/minimap_LR_analysis.tsv")

## clean and combine data 

SR$graph<-gsub("SUBSAM","",SR$graph)
SR$graph<-gsub("_.allele_mapping_data.txt","",SR$graph)
SR$graph<-gsub("./","",SR$graph)

SR<-SR%>%
  filter(`Reference Model Type`=="protein homolog model")%>%
  select(graph,`ARO Term`,`ARO Accession`,`AMR Gene Family`,`All Mapped Reads`,`Percent Coverage`,`Length Coverage (bp)`,Depth)

LR$graph<-gsub("SUBSAM","",LR$graph)
LR$graph<-gsub(".tsv","",LR$graph)

LR<-LR%>%
  separate_wider_delim(rname,"|",names = c("name","ARO","family"))%>%
  filter(coverage>0)%>%
  select(graph,name,ARO,family,numreads,coverage,covbases,meandepth)

names(SR)[names(SR) == "ARO Term"] <- 'name'
names(SR)[names(SR) == "ARO Accession"] <- 'ARO'
names(SR)[names(SR) == "AMR Gene Family"] <- 'family'
names(SR)[names(SR) == "All Mapped Reads"] <- 'numreads'
names(SR)[names(SR) == "Percent Coverage"] <- 'coverage'
names(SR)[names(SR) == "Length Coverage (bp)"] <- 'covbases'
names(SR)[names(SR) == "Depth"] <- 'meandepth'

reads<-rbind(LR,SR)

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

## create a classification dataframe for each ARO in the CARD database

classifications<-CARD
classifications$actual_HC_classification <- if_else(classifications$ARO_accession %in% HC_baseline$ARO, 1,0)
classifications$actual_LC_classification <- if_else(classifications$ARO_accession %in% LC_baseline$ARO, 1,0)
classifications$actual_RZ_classification <- if_else(classifications$ARO_accession %in% RZ_baseline$ARO, 1,0)
classifications$actual_ME_classification <- if_else(classifications$ARO_accession %in% ME_baseline$ARO, 1,0)

## define tally gene hits function 
tally_read_hits<-function(tool,graph_type,hit_file,classification_file){
  if (tool == "READS") {
    QC<-c(10,20,30,40,50,60,70,80,90,100)
    for (j  in QC) {
      assign("column",paste(tool,graph_type,"NA",j,sep = "_"))
      hit_list<-hit_file%>%
        filter(graph == graph_type & coverage >= get("j"))%>%
        pull(ARO)
      classification_file[,column]<-if_else(classification_file$ARO_accession %in% hit_list,1,0)
    }
    return(classification_file)
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
      select(!ends_with("_TP"),-ARO_name,-ARO_accession,-AMR_gene_family,-actual_HC_classification,-actual_LC_classification,-actual_RZ_classification,-actual_ME_classification)%>%
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

graph_types<-unique(reads$graph)
tool_list<-c("READS")
hit_list<-list(reads)

for (i in 1:length(tool_list)) {
  for (graph in graph_types) {
    classifications<-tally_read_hits(tool_list[i],graph,hit_list[[i]],classifications)
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

write_csv(PR_all,"reads/pr_reads.csv")


## Non - binary read analyses


## create a classification dataframe for each ARO in the CARD database

classifications<-CARD

classifications$actual_HC_classification <- 0
for (i in 1:nrow(classifications)) {
  classifications[i,"actual_HC_classification"]<-length(grep(classifications[i,"ARO_accession"], HC_baseline$ARO))
}

classifications$actual_LC_classification <- 0
for (i in 1:nrow(classifications)) {
  classifications[i,"actual_LC_classification"]<-length(grep(classifications[i,"ARO_accession"], LC_baseline$ARO))
}

classifications$actual_RZ_classification <- 0
for (i in 1:nrow(classifications)) {
  classifications[i,"actual_RZ_classification"]<-length(grep(classifications[i,"ARO_accession"], RZ_baseline$ARO))
}  

classifications$actual_ME_classification <- 0
for (i in 1:nrow(classifications)) {
  classifications[i,"actual_ME_classification"]<-length(grep(classifications[i,"ARO_accession"], ME_baseline$ARO))
}  



## define functions

tally_read_hits<-function(tool,graph_type,hit_file,classification_file){
  if (tool == "READS") {
    QC<-c(10,20,30,40,50,60,70,80,90,100)
    for (j  in QC) {
      assign("column",paste(tool,graph_type,"NA",j,sep = "_"))
      hit_list<-hit_file%>%
        filter(graph == graph_type & coverage >= get("j"))%>%
        pull(ARO)
      for (n in 1:nrow(classification_file)) {
        classification_file[n,column] <- length(grep(classification_file[n,"ARO_accession"],hit_list))
      }
    }
    return(classification_file)
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
      select(!ends_with("_TP"),-ARO_name,-ARO_accession,-AMR_gene_family,-actual_HC_classification,-actual_LC_classification,-actual_RZ_classification,-actual_ME_classification)%>%
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

# calculate PR for reads
graph_types<-unique(reads$graph)
tool_list<-c("READS")
hit_list<-list(reads)

for (i in 1:length(tool_list)) {
  for (graph in graph_types) {
    classifications<-tally_read_hits(tool_list[i],graph,hit_list[[i]],classifications)
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













