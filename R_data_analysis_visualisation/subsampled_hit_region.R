#Script to determine the best hit per locus for the subsampled data
library(tidyverse)

# read in output from combine_subsample_data.R

minigraph_all<-read_csv("final_results/minigraph_all.csv")
bifrost_all<-read_csv("final_results/bifrost_all.csv")
bandage_all<-read_csv("final_results/bandage_all.csv")
graphaligner_all<-read_csv("final_results/graphaligner_all.csv")
spaliner_all<-read_csv("final_results/spaliner_all.csv")
pathracer_all<-read_csv("final_results/pathracer_all.csv")

### Minigraph: Calculate % identity and % query coverage 

minigraph_all<-minigraph_all%>%
  mutate(perc_ID = number_residue_matches/query_length)

minigraph_all<-minigraph_all%>%
  mutate(perc_query_cov = (query_end - query_start)/query_length)

## separate out query column 
minigraph_all<-minigraph_all%>%
  separate_wider_delim(query, "|", names = c("query_name","ARO","family"))

# filter results to 50%ID and QC

minigraph_all<-minigraph_all%>%
  filter(perc_query_cov > 0.5 & perc_ID > 0.5)

## create segments list 

minigraph_all$segs<-paste(minigraph_all$path, minigraph_all$graph, sep = "_")
segs_MG<-unique(minigraph_all$segs)

#Assign hit regions

minigraph_all$hit_region<-0
counter<-0

## for each unique segment in the minigraph results
for (i in 1:length(segs_MG)) {
  # for each instance of that segment
  for (j in grep(segs_MG[i],minigraph_all$segs)) {
    # Find that path start where a hit region hasn't been assigned, smallest value on segment, as hit regions get assigned, all non-nested segments get identified 
    PS<-minigraph_all%>%
      filter(segs == segs_MG[i] & hit_region == 0)%>%
      summarise(across(path_start,min))%>%
      pull(path_start)
    ## find the max alignment length for that PS
    aln_max<-minigraph_all%>%
      filter(segs == segs_MG[i] & hit_region == 0 & path_start == PS)%>%
      summarise(across(alignment_length,max))%>%
      pull(alignment_length)
    ## path end calulation 
    PE<-PS+aln_max
    # using segs_MG[i], PS, and PE assign these coordinates as a hit region 
    ## if variables have successfully been identified
    if (exists("PS") & exists("PE")) {
      ##add a new hit region number 
      counter<-counter+1 
      ## for each row in minigraph_all, look for hit region coordinates and assign new hit region 
      for (n in 1:nrow(minigraph_all)) {
        if (minigraph_all[n,"segs"] == segs_MG[i] & minigraph_all[n,"path_start"] >= PS & minigraph_all[n,"path_end"]<=PE & minigraph_all[n,"hit_region"] == 0) {
          minigraph_all[n,"hit_region"]<-counter
          print("assigned hit region:")
          print(counter)
        }
      }
      ## remove used coordinates 
      rm(PS)
      rm(PE)
    }
  }
  print("searched through percentage:")
  print(i/length(segs_MG) * 100)
}

## determine number of unique hit regions 

length(unique(minigraph_all$hit_region))

## Summarize data for each hit region, i.e. pick the best hit %ID>%querycov>length

minigraph_hits<-minigraph_all%>%
  group_by(hit_region)%>%
  top_n(1,perc_query_cov)%>%
  top_n(1,perc_ID)%>%
  top_n(1,alignment_length)%>%
  top_n(1,ARO)


#write out hit file

write_csv(minigraph_hits,"final_results/minigraph_hits.csv")


## Bifrost

## separate out query column 
bifrost_all<-bifrost_all%>%
  separate_wider_delim(query_name, "|", names = c("query_name","ARO","family"))

## filter out anying less than 50% ID and QC

bifrost_all<-bifrost_all%>%
  filter(ratio_found_kmers>0.5)

#best bifrost hit at each locus
## important caveat, nested hits with a short 5' end are being counted as a hit
bifrost_hits<-bifrost_all%>%
  group_by(unitig_head_kmer,unitig_tail_kmer,mapped_head_kmer)%>%
  top_n(1,ratio_found_kmers)%>%
  top_n(1,ARO)

#write out hit files

write_csv(bifrost_hits,"final_results/bifrost_hits.csv")


### BANDAGE ###

## separate out query column 
bandage_all<-bandage_all%>%
  separate_wider_delim(Query, "|", names = c("query_name","ARO","family"))

## separate out path column 

bandage_all$Path<-gsub(" \\(","|",bandage_all$Path)
bandage_all$Path<-gsub("\\) ","|",bandage_all$Path)
bandage_all$Path<-gsub("\\(","",bandage_all$Path)
bandage_all$Path<-gsub("\\)","",bandage_all$Path)
bandage_all$Path<-gsub(", ","_",bandage_all$Path)

bandage_all<-bandage_all%>%
  separate_wider_delim(Path,"|", names = c("path_start","path","path_end"), too_few = "align_start")

## remove NAs caused by missing values (Bug)

bandage_all<-na.omit(bandage_all)

## convert hit ID and QC to proportions

bandage_all$`Mean hit identity`<-gsub("%","",bandage_all$`Mean hit identity`)
bandage_all$`Query covered by hits`<-gsub("%","",bandage_all$`Query covered by hits`)

bandage_all$`Mean hit identity`<-(as.numeric(bandage_all$`Mean hit identity`)/100)
bandage_all$`Query covered by hits`<-(as.numeric(bandage_all$`Query covered by hits`)/100)

#filter out anything less than 50% ID or QC

bandage_all<-bandage_all%>%
  filter(`Mean hit identity`>0.5 & `Query covered by hits`>0.5)

## create segments list 
bandage_all$segs<-paste(bandage_all$path,bandage_all$graph,sep = "_")

segs_BAN<-unique(bandage_all$segs)

## make PS and PE numeric 
bandage_all$path_start<-as.numeric(bandage_all$path_start)
bandage_all$path_end<-as.numeric(bandage_all$path_end)

## assign hit regions this is very slow but works, tried to use the vectorized case_when but it struggles when variables are changing
## expect ~1 hr runtime for the bandage data 

bandage_all$hit_region<-0
counter<-0

## for each unique segment in the bandage results
for (i in 1:length(segs_BAN)) {
  # for each instance of that segment
  for (j in grep(segs_BAN[i],bandage_all$segs,fixed = TRUE)) {
    # Find that path start where a hit region hasn't been assigned, smallest value on segment, as hit regions get assigned, all non-nested segments get identified 
    PS<-bandage_all%>%
      filter(segs == segs_BAN[i] & hit_region == 0)%>%
      summarise(across(path_start,min))%>%
      pull(path_start)
    ## find the max alignment length for that PS
    aln_max<-bandage_all%>%
      filter(segs == segs_BAN[i] & hit_region == 0 & path_start == PS)%>%
      summarise(across(Length,max))%>%
      pull(Length)
    ## path end calulation 
    PE<-PS+aln_max
    # using segs_BAN[i], PS, and PE assign these coordinates as a hit region 
    ## if variables have successfully been identified
    if (exists("PS") & exists("PE")) {
      ##add a new git region number 
      counter<-counter+1 
      ## for each row in bandage_all, look for hit region coordinates and assign new hit region 
      for (n in 1:nrow(bandage_all)) {
        if (bandage_all[n,"segs"] == segs_BAN[i] & bandage_all[n,"path_start"] >= PS & bandage_all[n,"path_end"]<=PE & bandage_all[n,"hit_region"] == 0) {
          bandage_all[n,"hit_region"]<-counter
          print("assigned hit region:")
          print(counter)
        }
      }
      ## remove used coordinates 
      rm(PS)
      rm(PE)
    }
  }
  print("searched through percentage:")
  print(i/length(segs_BAN) * 100)
}

## determine number of unique hit regions 

length(unique(bandage_all$hit_region))

## Summarize data for each hit region, i.e. pick the best hit %ID>%querycov>length

bandage_hits<-bandage_all%>%
  group_by(hit_region)%>%
  top_n(1,`Query covered by hits`)%>%
  top_n(1,`Mean hit identity`)%>%
  top_n(1,Length)%>%
  top_n(1,ARO)

#write out

write_csv(bandage_hits,"final_results/bandage_hits.csv")

### GRAPHALIGNER ###

## fix perc_identity column 

graphaligner_all$perc_identity<-gsub("id:f:","",graphaligner_all$perc_identity)

## calculate query coverage 

graphaligner_all<-graphaligner_all%>%
  mutate(perc_query_cov = (query_end - query_start)/query_length)

## separate out query column 
graphaligner_all<-graphaligner_all%>%
  separate_wider_delim(query, "|", names = c("query_name","ARO","family"))

## filter out any hits less than 50% ID and 50% query coverage 

graphaligner_all<-graphaligner_all%>%
  filter(perc_query_cov > 0.5 & perc_identity > 0.5)


## create segments list 
graphaligner_all$segs<-paste(graphaligner_all$path,graphaligner_all$graph,sep = "_")

segs_GA<-unique(graphaligner_all$segs)

## assign hit regions this is very slow but works, tried to use the vectorized case_when but it struggles when variables are changing
## expect ~1 hr runtime for the graphaligner data 

graphaligner_all$hit_region<-0
counter<-0

## for each unique segment in the graphaligner results
for (i in 1:length(segs_GA)) {
  # for each instance of that segment
  for (j in grep(segs_GA[i],graphaligner_all$segs,fixed = TRUE)) {
    # Find that path start where a hit region hasn't been assigned, smallest value on segment, as hit regions get assigned, all non-nested segments get identified 
    PS<-graphaligner_all%>%
      filter(segs == segs_GA[i] & hit_region == 0)%>%
      summarise(across(path_start,min))%>%
      pull(path_start)
    ## find the max alignment length for that PS
    aln_max<-graphaligner_all%>%
      filter(segs == segs_GA[i] & hit_region == 0 & path_start == PS)%>%
      summarise(across(alignment_length,max))%>%
      pull(alignment_length)
    ## path end calculation 
    PE<-PS+aln_max
    # using segs_GA[i], PS, and PE assign these coordinates as a hit region 
    ## if variables have successfully been identified
    if (exists("PS") & exists("PE")) {
      ##add a new hit region number 
      counter<-counter+1 
      ## for each row in graphaligner_all, look for hit region coordinates and assign new hit region 
      for (n in 1:nrow(graphaligner_all)) {
        if (graphaligner_all[n,"segs"] == segs_GA[i] & graphaligner_all[n,"path_start"] >= PS & graphaligner_all[n,"path_end"]<=PE & graphaligner_all[n,"hit_region"] == 0) {
          graphaligner_all[n,"hit_region"]<-counter
          print("assigned hit region:")
          print(counter)
        }
      }
      ## remove used coordinates 
      rm(PS)
      rm(PE)
    }
  }
  print("searched through percentage:")
  print(i/length(segs_GA) * 100)
}

## determine number of unique hit regions 

length(unique(graphaligner_all$hit_region))

## Summarize data for each hit region, i.e. pick the best hit %ID>%querycov>length

graphaligner_hits<-graphaligner_all%>%
  group_by(hit_region)%>%
  top_n(1,perc_query_cov)%>%
  top_n(1,perc_identity)%>%
  top_n(1,alignment_length)%>%
  top_n(1,ARO)

# write out
write_csv(graphaligner_hits,"final_results/graphaligner_hits.csv")


### SPAliner ###

## separate out query column 
spaliner_all<-spaliner_all%>%
  separate_wider_delim(query, "|", names = c("query_name","ARO","family"))

## filter out any hits less than 50% query coverage 

spaliner_all<-spaliner_all%>%
  filter(perc_query_cov > 0.5)

## create segments list 
spaliner_all$segs<-paste(spaliner_all$path,spaliner_all$graph,sep = "_")

segs_SPA<-unique(spaliner_all$segs)

# Assign hit region 

spaliner_all$hit_region<-0
counter<-0

## for each unique segment in the spaliner results
for (i in 1:length(segs_SPA)) {
  # for each instance of that segment
  for (j in grep(segs_SPA[i],spaliner_all$segs,fixed = TRUE)) {
    # Find that path start where a hit region hasn't been assigned, smallest value on segment, as hit regions get assigned, all non-nested segments get identified 
    PS<-spaliner_all%>%
      filter(segs == segs_SPA[i] & hit_region == 0)%>%
      summarise(across(aln_start_seg,min))%>%
      pull(aln_start_seg)
    ## find the max alignment length for that PS
    aln_max<-spaliner_all%>%
      filter(segs == segs_SPA[i] & hit_region == 0 & aln_start_seg == PS)%>%
      summarise(across(aln_length_on_path,max))%>%
      pull(aln_length_on_path)
    ## path end calculation 
    PE<-PS+aln_max
    # using segs_SPA[i], PS, and PE assign these coordinates as a hit region 
    ## if variables have successfully been identified
    if (exists("PS") & exists("PE")) {
      ##add a new hit region number 
      counter<-counter+1 
      ## for each row in spaliner_all, look for hit region coordinates and assign new hit region 
      for (n in 1:nrow(spaliner_all)) {
        if (spaliner_all[n,"segs"] == segs_SPA[i] & spaliner_all[n,"aln_start_seg"] >= PS & spaliner_all[n,"aln_end_seg"]<=PE & spaliner_all[n,"hit_region"] == 0) {
          spaliner_all[n,"hit_region"]<-counter
          print("assigned hit region:")
          print(counter)
        }
      }
      ## remove used coordinates 
      rm(PS)
      rm(PE)
    }
  }
  print("searched through percentage:")
  print(i/length(segs_SPA) * 100)
}

## determine number of unique hit regions 

length(unique(spaliner_all$hit_region))

## Summarize data for each hit region, i.e. pick the best hit %ID>%querycov>length

spaliner_hits<-spaliner_all%>%
  group_by(hit_region)%>%
  top_n(1,perc_query_cov)%>%
  top_n(1,aln_length_on_path)%>%
  top_n(1,ARO)

##write
write_csv(spaliner_hits,"final_results/spaliner_hits.csv")

### Pathracer ###

#filter to >50% ID and QC

pathracer_hits<-pathracer_all%>%
  filter(`Percentage Length of Reference Sequence`>0.5 & Best_Identities>0.5)

## write out

write_csv(pathracer_hits,"final_results/pathracer_hits.csv")












