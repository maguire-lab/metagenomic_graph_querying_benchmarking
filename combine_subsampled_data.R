## Script to combine results datasets for subsampled reads. 

library(tidyverse)

### read in data 

#### minigraph
minigraph_cols<-c("query", "query_length","query_start","query_end","strand","path","path_length","path_start","path_end","number_residue_matches","alignment_length","mapping_quality","type_of_aln","number_of_minimizers","chaining_score","chaining_score_of_best_secondary_chain","aprox._per_base_sequence_divergence")

## 25% subsamples

minigraph_HC_SR_25_MS<-read_tsv("final_results/raw_out/minigraph/HC_SR_25_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_25_MS$graph<-"HC_SR_25_MS"

minigraph_HC_SR_25_MH<-read_tsv("final_results/raw_out/minigraph/HC_SR_25_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_25_MH$graph<-"HC_SR_25_MH"

minigraph_HC_LR_25_MF<-read_tsv("final_results/raw_out/minigraph/HC_LR_25_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_LR_25_MF$graph<-"HC_LR_25_MF"

minigraph_LC_SR_25_MS<-read_tsv("final_results/raw_out/minigraph/LC_SR_25_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_25_MS$graph<-"LC_SR_25_MS"

minigraph_LC_SR_25_MH<-read_tsv("final_results/raw_out/minigraph/LC_SR_25_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_25_MH$graph<-"LC_SR_25_MH"

minigraph_LC_LR_25_MF<-read_tsv("final_results/raw_out/minigraph/LC_LR_25_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_LR_25_MF$graph<-"LC_LR_25_MF"

minigraph_RZ_SR_25_MS<-read_tsv("final_results/raw_out/minigraph/RZ_SR_25_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

minigraph_RZ_SR_25_MH<-read_tsv("final_results/raw_out/minigraph/RZ_SR_25_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

minigraph_RZ_LR_25_MF<-read_tsv("final_results/raw_out/minigraph/RZ_LR_25_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

minigraph_ME_SR_25_MS<-read_tsv("final_results/raw_out/minigraph/ME_SR_25_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_25_MS$graph<-"ME_SR_25_MS"

minigraph_ME_SR_25_MH<-read_tsv("final_results/raw_out/minigraph/ME_SR_25_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_25_MH$graph<-"ME_SR_25_MH"

minigraph_ME_LR_25_MF<-read_tsv("final_results/raw_out/minigraph/ME_LR_25_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_LR_25_MF$graph<-"ME_LR_25_MF"

## 50% subsamples

minigraph_HC_SR_50_MS<-read_tsv("final_results/raw_out/minigraph/HC_SR_50_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_50_MS$graph<-"HC_SR_50_MS"

minigraph_HC_SR_50_MH<-read_tsv("final_results/raw_out/minigraph/HC_SR_50_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_50_MH$graph<-"HC_SR_50_MH"

minigraph_HC_LR_50_MF<-read_tsv("final_results/raw_out/minigraph/HC_LR_50_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_LR_50_MF$graph<-"HC_LR_50_MF"

minigraph_LC_SR_50_MS<-read_tsv("final_results/raw_out/minigraph/LC_SR_50_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_50_MS$graph<-"LC_SR_50_MS"

minigraph_LC_SR_50_MH<-read_tsv("final_results/raw_out/minigraph/LC_SR_50_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_50_MH$graph<-"LC_SR_50_MH"

minigraph_LC_LR_50_MF<-read_tsv("final_results/raw_out/minigraph/LC_LR_50_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_LR_50_MF$graph<-"LC_LR_50_MF"

minigraph_RZ_SR_50_MS<-read_tsv("final_results/raw_out/minigraph/RZ_SR_50_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

minigraph_RZ_SR_50_MH<-read_tsv("final_results/raw_out/minigraph/RZ_SR_50_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

minigraph_RZ_LR_50_MF<-read_tsv("final_results/raw_out/minigraph/RZ_LR_50_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

minigraph_ME_SR_50_MS<-read_tsv("final_results/raw_out/minigraph/ME_SR_50_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_50_MS$graph<-"ME_SR_50_MS"

minigraph_ME_SR_50_MH<-read_tsv("final_results/raw_out/minigraph/ME_SR_50_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_50_MH$graph<-"ME_SR_50_MH"

minigraph_ME_LR_50_MF<-read_tsv("final_results/raw_out/minigraph/ME_LR_50_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_LR_50_MF$graph<-"ME_LR_50_MF"

## 75% subsamples

minigraph_HC_SR_75_MS<-read_tsv("final_results/raw_out/minigraph/HC_SR_75_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_75_MS$graph<-"HC_SR_75_MS"

minigraph_HC_SR_75_MH<-read_tsv("final_results/raw_out/minigraph/HC_SR_75_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_75_MH$graph<-"HC_SR_75_MH"

minigraph_HC_LR_75_MF<-read_tsv("final_results/raw_out/minigraph/HC_LR_75_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_LR_75_MF$graph<-"HC_LR_75_MF"

minigraph_LC_SR_75_MS<-read_tsv("final_results/raw_out/minigraph/LC_SR_75_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_75_MS$graph<-"LC_SR_75_MS"

minigraph_LC_SR_75_MH<-read_tsv("final_results/raw_out/minigraph/LC_SR_75_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_75_MH$graph<-"LC_SR_75_MH"

minigraph_LC_LR_75_MF<-read_tsv("final_results/raw_out/minigraph/LC_LR_75_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_LR_75_MF$graph<-"LC_LR_75_MF"

minigraph_RZ_SR_75_MS<-read_tsv("final_results/raw_out/minigraph/RZ_SR_75_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

minigraph_RZ_SR_75_MH<-read_tsv("final_results/raw_out/minigraph/RZ_SR_75_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

minigraph_RZ_LR_75_MF<-read_tsv("final_results/raw_out/minigraph/RZ_LR_75_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

minigraph_ME_SR_75_MS<-read_tsv("final_results/raw_out/minigraph/ME_SR_75_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_75_MS$graph<-"ME_SR_75_MS"

minigraph_ME_SR_75_MH<-read_tsv("final_results/raw_out/minigraph/ME_SR_75_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_75_MH$graph<-"ME_SR_75_MH"

minigraph_ME_LR_75_MF<-read_tsv("final_results/raw_out/minigraph/ME_LR_75_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_LR_75_MF$graph<-"ME_LR_75_MF"

## 100%

minigraph_HC_SR_100_MS<-read_tsv("final_results/raw_out/minigraph/HC_SR_100_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_100_MS$graph<-"HC_SR_100_MS"

minigraph_HC_SR_100_MH<-read_tsv("final_results/raw_out/minigraph/HC_SR_100_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_SR_100_MH$graph<-"HC_SR_100_MH"

minigraph_HC_LR_100_MF<-read_tsv("final_results/raw_out/minigraph/HC_LR_100_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_HC_LR_100_MF$graph<-"HC_LR_100_MF"

minigraph_LC_SR_100_MS<-read_tsv("final_results/raw_out/minigraph/LC_SR_100_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_100_MS$graph<-"LC_SR_100_MS"

minigraph_LC_SR_100_MH<-read_tsv("final_results/raw_out/minigraph/LC_SR_100_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_SR_100_MH$graph<-"LC_SR_100_MH"

minigraph_LC_LR_100_MF<-read_tsv("final_results/raw_out/minigraph/LC_LR_100_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_LC_LR_100_MF$graph<-"LC_LR_100_MF"

minigraph_RZ_SR_100_MS<-read_tsv("final_results/raw_out/minigraph/RZ_SR_100_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

minigraph_RZ_SR_100_MH<-read_tsv("final_results/raw_out/minigraph/RZ_SR_100_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

minigraph_RZ_LR_100_MF<-read_tsv("final_results/raw_out/minigraph/RZ_LR_100_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

minigraph_ME_SR_100_MS<-read_tsv("final_results/raw_out/minigraph/ME_SR_100_MS_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_100_MS$graph<-"ME_SR_100_MS"

minigraph_ME_SR_100_MH<-read_tsv("final_results/raw_out/minigraph/ME_SR_100_MH_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_SR_100_MH$graph<-"ME_SR_100_MH"

minigraph_ME_LR_100_MF<-read_tsv("final_results/raw_out/minigraph/ME_LR_100_MF_minigraph.gaf", col_names = minigraph_cols)
minigraph_ME_LR_100_MF$graph<-"ME_LR_100_MF"

## combine and read out data


minigraph_all<-rbind(
  minigraph_HC_LR_100_MF,minigraph_HC_LR_25_MF,minigraph_HC_LR_50_MF,minigraph_HC_LR_75_MF,minigraph_HC_SR_100_MH,
  minigraph_HC_SR_100_MS,minigraph_HC_SR_25_MH,minigraph_HC_SR_25_MS,minigraph_HC_SR_50_MH,minigraph_HC_SR_50_MS,
  minigraph_HC_SR_75_MH,minigraph_HC_SR_75_MS,minigraph_LC_LR_100_MF,minigraph_LC_LR_25_MF,minigraph_LC_LR_50_MF,
  minigraph_LC_LR_75_MF,minigraph_LC_SR_100_MH,minigraph_LC_SR_100_MS,minigraph_LC_SR_25_MH,minigraph_LC_SR_25_MS,
  minigraph_LC_SR_50_MH,minigraph_LC_SR_50_MS,minigraph_LC_SR_75_MH,minigraph_LC_SR_75_MS,minigraph_ME_LR_100_MF,
  minigraph_ME_LR_25_MF,minigraph_ME_LR_50_MF,minigraph_ME_LR_75_MF,minigraph_ME_SR_100_MH,minigraph_ME_SR_100_MS,
  minigraph_ME_SR_25_MH,minigraph_ME_SR_25_MS,minigraph_ME_SR_50_MH,minigraph_ME_SR_50_MS,minigraph_ME_SR_75_MH,
  minigraph_ME_SR_75_MS,minigraph_RZ_LR_100_MF,minigraph_RZ_LR_25_MF,minigraph_RZ_LR_50_MF,
  minigraph_RZ_LR_75_MF,minigraph_RZ_SR_100_MH,minigraph_RZ_SR_100_MS,minigraph_RZ_SR_25_MH,minigraph_RZ_SR_25_MS,
  minigraph_RZ_SR_50_MH,minigraph_RZ_SR_50_MS,minigraph_RZ_SR_75_MH,minigraph_RZ_SR_75_MS
)

rm(
  minigraph_HC_LR_100_MF,minigraph_HC_LR_25_MF,minigraph_HC_LR_50_MF,minigraph_HC_LR_75_MF,minigraph_HC_SR_100_MH,
  minigraph_HC_SR_100_MS,minigraph_HC_SR_25_MH,minigraph_HC_SR_25_MS,minigraph_HC_SR_50_MH,minigraph_HC_SR_50_MS,
  minigraph_HC_SR_75_MH,minigraph_HC_SR_75_MS,minigraph_LC_LR_100_MF,minigraph_LC_LR_25_MF,minigraph_LC_LR_50_MF,
  minigraph_LC_LR_75_MF,minigraph_LC_SR_100_MH,minigraph_LC_SR_100_MS,minigraph_LC_SR_25_MH,minigraph_LC_SR_25_MS,
  minigraph_LC_SR_50_MH,minigraph_LC_SR_50_MS,minigraph_LC_SR_75_MH,minigraph_LC_SR_75_MS,minigraph_ME_LR_100_MF,
  minigraph_ME_LR_25_MF,minigraph_ME_LR_50_MF,minigraph_ME_LR_75_MF,minigraph_ME_SR_100_MH,minigraph_ME_SR_100_MS,
  minigraph_ME_SR_25_MH,minigraph_ME_SR_25_MS,minigraph_ME_SR_50_MH,minigraph_ME_SR_50_MS,minigraph_ME_SR_75_MH,
  minigraph_ME_SR_75_MS,minigraph_RZ_LR_100_MF,minigraph_RZ_LR_25_MF,minigraph_RZ_LR_50_MF,
  minigraph_RZ_LR_75_MF,minigraph_RZ_SR_100_MH,minigraph_RZ_SR_100_MS,minigraph_RZ_SR_25_MH,minigraph_RZ_SR_25_MS,
  minigraph_RZ_SR_50_MH,minigraph_RZ_SR_50_MS,minigraph_RZ_SR_75_MH,minigraph_RZ_SR_75_MS
)

write_csv(minigraph_all,"final_results/minigraph_all.csv")

rm(minigraph_all)
rm(minigraph_cols)

## bifrost 

## 25

bifrost_HC_SR_25_MS<-read_tsv("final_results/raw_out/bifrost/HC_SR_25_MS_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_25_MS_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_25_MS_bifrost_unitigs.csv")
bifrost_HC_SR_25_MS<-left_join(bifrost_HC_SR_25_MS_unitigs,bifrost_HC_SR_25_MS,by = "query_name")
rm(bifrost_HC_SR_25_MS_unitigs)
bifrost_HC_SR_25_MS$graph<-"HC_SR_25_MS"

bifrost_HC_SR_25_MH<-read_tsv("final_results/raw_out/bifrost/HC_SR_25_MH_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_25_MH_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_25_MH_bifrost_unitigs.csv")
bifrost_HC_SR_25_MH<-left_join(bifrost_HC_SR_25_MH_unitigs,bifrost_HC_SR_25_MH,by = "query_name")
rm(bifrost_HC_SR_25_MH_unitigs)
bifrost_HC_SR_25_MH$graph<-"HC_SR_25_MH"

bifrost_HC_LR_25_MF<-read_tsv("final_results/raw_out/bifrost/HC_LR_25_MF_bifrost_kmer_ratio.tsv")
bifrost_HC_LR_25_MF_unitigs<-read_csv("final_results/raw_out/bifrost/HC_LR_25_MF_bifrost_unitigs.csv")
bifrost_HC_LR_25_MF<-left_join(bifrost_HC_LR_25_MF_unitigs,bifrost_HC_LR_25_MF,by = "query_name")
rm(bifrost_HC_LR_25_MF_unitigs)
bifrost_HC_LR_25_MF$graph<-"HC_LR_25_MF"

bifrost_LC_SR_25_MS<-read_tsv("final_results/raw_out/bifrost/LC_SR_25_MS_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_25_MS_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_25_MS_bifrost_unitigs.csv")
bifrost_LC_SR_25_MS<-left_join(bifrost_LC_SR_25_MS_unitigs,bifrost_LC_SR_25_MS,by = "query_name")
rm(bifrost_LC_SR_25_MS_unitigs)
bifrost_LC_SR_25_MS$graph<-"LC_SR_25_MS"

bifrost_LC_SR_25_MH<-read_tsv("final_results/raw_out/bifrost/LC_SR_25_MH_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_25_MH_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_25_MH_bifrost_unitigs.csv")
bifrost_LC_SR_25_MH<-left_join(bifrost_LC_SR_25_MH_unitigs,bifrost_LC_SR_25_MH,by = "query_name")
rm(bifrost_LC_SR_25_MH_unitigs)
bifrost_LC_SR_25_MH$graph<-"LC_SR_25_MH"

bifrost_LC_LR_25_MF<-read_tsv("final_results/raw_out/bifrost/LC_LR_25_MF_bifrost_kmer_ratio.tsv")
bifrost_LC_LR_25_MF_unitigs<-read_csv("final_results/raw_out/bifrost/LC_LR_25_MF_bifrost_unitigs.csv")
bifrost_LC_LR_25_MF<-left_join(bifrost_LC_LR_25_MF_unitigs,bifrost_LC_LR_25_MF,by = "query_name")
rm(bifrost_LC_LR_25_MF_unitigs)
bifrost_LC_LR_25_MF$graph<-"LC_LR_25_MF"

bifrost_RZ_SR_25_MS<-read_tsv("final_results/raw_out/bifrost/RZ_SR_25_MS_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_25_MS_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_25_MS_bifrost_unitigs.csv")
bifrost_RZ_SR_25_MS<-left_join(bifrost_RZ_SR_25_MS_unitigs,bifrost_RZ_SR_25_MS,by = "query_name")
rm(bifrost_RZ_SR_25_MS_unitigs)
bifrost_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

bifrost_RZ_SR_25_MH<-read_tsv("final_results/raw_out/bifrost/RZ_SR_25_MH_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_25_MH_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_25_MH_bifrost_unitigs.csv")
bifrost_RZ_SR_25_MH<-left_join(bifrost_RZ_SR_25_MH_unitigs,bifrost_RZ_SR_25_MH,by = "query_name")
rm(bifrost_RZ_SR_25_MH_unitigs)
bifrost_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

bifrost_RZ_LR_25_MF<-read_tsv("final_results/raw_out/bifrost/RZ_LR_25_MF_bifrost_kmer_ratio.tsv")
bifrost_RZ_LR_25_MF_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_LR_25_MF_bifrost_unitigs.csv")
bifrost_RZ_LR_25_MF<-left_join(bifrost_RZ_LR_25_MF_unitigs,bifrost_RZ_LR_25_MF,by = "query_name")
rm(bifrost_RZ_LR_25_MF_unitigs)
bifrost_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

bifrost_ME_SR_25_MS<-read_tsv("final_results/raw_out/bifrost/ME_SR_25_MS_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_25_MS_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_25_MS_bifrost_unitigs.csv")
bifrost_ME_SR_25_MS<-left_join(bifrost_ME_SR_25_MS_unitigs,bifrost_ME_SR_25_MS,by = "query_name")
rm(bifrost_ME_SR_25_MS_unitigs)
bifrost_ME_SR_25_MS$graph<-"ME_SR_25_MS"

bifrost_ME_SR_25_MH<-read_tsv("final_results/raw_out/bifrost/ME_SR_25_MH_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_25_MH_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_25_MH_bifrost_unitigs.csv")
bifrost_ME_SR_25_MH<-left_join(bifrost_ME_SR_25_MH_unitigs,bifrost_ME_SR_25_MH,by = "query_name")
rm(bifrost_ME_SR_25_MH_unitigs)
bifrost_ME_SR_25_MH$graph<-"ME_SR_25_MH"

bifrost_ME_LR_25_MF<-read_tsv("final_results/raw_out/bifrost/ME_LR_25_MF_bifrost_kmer_ratio.tsv")
bifrost_ME_LR_25_MF_unitigs<-read_csv("final_results/raw_out/bifrost/ME_LR_25_MF_bifrost_unitigs.csv")
bifrost_ME_LR_25_MF<-left_join(bifrost_ME_LR_25_MF_unitigs,bifrost_ME_LR_25_MF,by = "query_name")
rm(bifrost_ME_LR_25_MF_unitigs)
bifrost_ME_LR_25_MF$graph<-"ME_LR_25_MF"

## 50

bifrost_HC_SR_50_MS<-read_tsv("final_results/raw_out/bifrost/HC_SR_50_MS_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_50_MS_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_50_MS_bifrost_unitigs.csv")
bifrost_HC_SR_50_MS<-left_join(bifrost_HC_SR_50_MS_unitigs,bifrost_HC_SR_50_MS,by = "query_name")
rm(bifrost_HC_SR_50_MS_unitigs)
bifrost_HC_SR_50_MS$graph<-"HC_SR_50_MS"

bifrost_HC_SR_50_MH<-read_tsv("final_results/raw_out/bifrost/HC_SR_50_MH_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_50_MH_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_50_MH_bifrost_unitigs.csv")
bifrost_HC_SR_50_MH<-left_join(bifrost_HC_SR_50_MH_unitigs,bifrost_HC_SR_50_MH,by = "query_name")
rm(bifrost_HC_SR_50_MH_unitigs)
bifrost_HC_SR_50_MH$graph<-"HC_SR_50_MH"

bifrost_HC_LR_50_MF<-read_tsv("final_results/raw_out/bifrost/HC_LR_50_MF_bifrost_kmer_ratio.tsv")
bifrost_HC_LR_50_MF_unitigs<-read_csv("final_results/raw_out/bifrost/HC_LR_50_MF_bifrost_unitigs.csv")
bifrost_HC_LR_50_MF<-left_join(bifrost_HC_LR_50_MF_unitigs,bifrost_HC_LR_50_MF,by = "query_name")
rm(bifrost_HC_LR_50_MF_unitigs)
bifrost_HC_LR_50_MF$graph<-"HC_LR_50_MF"

bifrost_LC_SR_50_MS<-read_tsv("final_results/raw_out/bifrost/LC_SR_50_MS_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_50_MS_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_50_MS_bifrost_unitigs.csv")
bifrost_LC_SR_50_MS<-left_join(bifrost_LC_SR_50_MS_unitigs,bifrost_LC_SR_50_MS,by = "query_name")
rm(bifrost_LC_SR_50_MS_unitigs)
bifrost_LC_SR_50_MS$graph<-"LC_SR_50_MS"

bifrost_LC_SR_50_MH<-read_tsv("final_results/raw_out/bifrost/LC_SR_50_MH_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_50_MH_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_50_MH_bifrost_unitigs.csv")
bifrost_LC_SR_50_MH<-left_join(bifrost_LC_SR_50_MH_unitigs,bifrost_LC_SR_50_MH,by = "query_name")
rm(bifrost_LC_SR_50_MH_unitigs)
bifrost_LC_SR_50_MH$graph<-"LC_SR_50_MH"

bifrost_LC_LR_50_MF<-read_tsv("final_results/raw_out/bifrost/LC_LR_50_MF_bifrost_kmer_ratio.tsv")
bifrost_LC_LR_50_MF_unitigs<-read_csv("final_results/raw_out/bifrost/LC_LR_50_MF_bifrost_unitigs.csv")
bifrost_LC_LR_50_MF<-left_join(bifrost_LC_LR_50_MF_unitigs,bifrost_LC_LR_50_MF,by = "query_name")
rm(bifrost_LC_LR_50_MF_unitigs)
bifrost_LC_LR_50_MF$graph<-"LC_LR_50_MF"

bifrost_RZ_SR_50_MS<-read_tsv("final_results/raw_out/bifrost/RZ_SR_50_MS_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_50_MS_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_50_MS_bifrost_unitigs.csv")
bifrost_RZ_SR_50_MS<-left_join(bifrost_RZ_SR_50_MS_unitigs,bifrost_RZ_SR_50_MS,by = "query_name")
rm(bifrost_RZ_SR_50_MS_unitigs)
bifrost_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

bifrost_RZ_SR_50_MH<-read_tsv("final_results/raw_out/bifrost/RZ_SR_50_MH_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_50_MH_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_50_MH_bifrost_unitigs.csv")
bifrost_RZ_SR_50_MH<-left_join(bifrost_RZ_SR_50_MH_unitigs,bifrost_RZ_SR_50_MH,by = "query_name")
rm(bifrost_RZ_SR_50_MH_unitigs)
bifrost_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

bifrost_RZ_LR_50_MF<-read_tsv("final_results/raw_out/bifrost/RZ_LR_50_MF_bifrost_kmer_ratio.tsv")
bifrost_RZ_LR_50_MF_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_LR_50_MF_bifrost_unitigs.csv")
bifrost_RZ_LR_50_MF<-left_join(bifrost_RZ_LR_50_MF_unitigs,bifrost_RZ_LR_50_MF,by = "query_name")
rm(bifrost_RZ_LR_50_MF_unitigs)
bifrost_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

bifrost_ME_SR_50_MS<-read_tsv("final_results/raw_out/bifrost/ME_SR_50_MS_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_50_MS_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_50_MS_bifrost_unitigs.csv")
bifrost_ME_SR_50_MS<-left_join(bifrost_ME_SR_50_MS_unitigs,bifrost_ME_SR_50_MS,by = "query_name")
rm(bifrost_ME_SR_50_MS_unitigs)
bifrost_ME_SR_50_MS$graph<-"ME_SR_50_MS"

bifrost_ME_SR_50_MH<-read_tsv("final_results/raw_out/bifrost/ME_SR_50_MH_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_50_MH_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_50_MH_bifrost_unitigs.csv")
bifrost_ME_SR_50_MH<-left_join(bifrost_ME_SR_50_MH_unitigs,bifrost_ME_SR_50_MH,by = "query_name")
rm(bifrost_ME_SR_50_MH_unitigs)
bifrost_ME_SR_50_MH$graph<-"ME_SR_50_MH"

bifrost_ME_LR_50_MF<-read_tsv("final_results/raw_out/bifrost/ME_LR_50_MF_bifrost_kmer_ratio.tsv")
bifrost_ME_LR_50_MF_unitigs<-read_csv("final_results/raw_out/bifrost/ME_LR_50_MF_bifrost_unitigs.csv")
bifrost_ME_LR_50_MF<-left_join(bifrost_ME_LR_50_MF_unitigs,bifrost_ME_LR_50_MF,by = "query_name")
rm(bifrost_ME_LR_50_MF_unitigs)
bifrost_ME_LR_50_MF$graph<-"ME_LR_50_MF"

## 75

bifrost_HC_SR_75_MS<-read_tsv("final_results/raw_out/bifrost/HC_SR_75_MS_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_75_MS_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_75_MS_bifrost_unitigs.csv")
bifrost_HC_SR_75_MS<-left_join(bifrost_HC_SR_75_MS_unitigs,bifrost_HC_SR_75_MS,by = "query_name")
rm(bifrost_HC_SR_75_MS_unitigs)
bifrost_HC_SR_75_MS$graph<-"HC_SR_75_MS"

bifrost_HC_SR_75_MH<-read_tsv("final_results/raw_out/bifrost/HC_SR_75_MH_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_75_MH_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_75_MH_bifrost_unitigs.csv")
bifrost_HC_SR_75_MH<-left_join(bifrost_HC_SR_75_MH_unitigs,bifrost_HC_SR_75_MH,by = "query_name")
rm(bifrost_HC_SR_75_MH_unitigs)
bifrost_HC_SR_75_MH$graph<-"HC_SR_75_MH"

bifrost_HC_LR_75_MF<-read_tsv("final_results/raw_out/bifrost/HC_LR_75_MF_bifrost_kmer_ratio.tsv")
bifrost_HC_LR_75_MF_unitigs<-read_csv("final_results/raw_out/bifrost/HC_LR_75_MF_bifrost_unitigs.csv")
bifrost_HC_LR_75_MF<-left_join(bifrost_HC_LR_75_MF_unitigs,bifrost_HC_LR_75_MF,by = "query_name")
rm(bifrost_HC_LR_75_MF_unitigs)
bifrost_HC_LR_75_MF$graph<-"HC_LR_75_MF"

bifrost_LC_SR_75_MS<-read_tsv("final_results/raw_out/bifrost/LC_SR_75_MS_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_75_MS_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_75_MS_bifrost_unitigs.csv")
bifrost_LC_SR_75_MS<-left_join(bifrost_LC_SR_75_MS_unitigs,bifrost_LC_SR_75_MS,by = "query_name")
rm(bifrost_LC_SR_75_MS_unitigs)
bifrost_LC_SR_75_MS$graph<-"LC_SR_75_MS"

bifrost_LC_SR_75_MH<-read_tsv("final_results/raw_out/bifrost/LC_SR_75_MH_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_75_MH_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_75_MH_bifrost_unitigs.csv")
bifrost_LC_SR_75_MH<-left_join(bifrost_LC_SR_75_MH_unitigs,bifrost_LC_SR_75_MH,by = "query_name")
rm(bifrost_LC_SR_75_MH_unitigs)
bifrost_LC_SR_75_MH$graph<-"LC_SR_75_MH"

bifrost_LC_LR_75_MF<-read_tsv("final_results/raw_out/bifrost/LC_LR_75_MF_bifrost_kmer_ratio.tsv")
bifrost_LC_LR_75_MF_unitigs<-read_csv("final_results/raw_out/bifrost/LC_LR_75_MF_bifrost_unitigs.csv")
bifrost_LC_LR_75_MF<-left_join(bifrost_LC_LR_75_MF_unitigs,bifrost_LC_LR_75_MF,by = "query_name")
rm(bifrost_LC_LR_75_MF_unitigs)
bifrost_LC_LR_75_MF$graph<-"LC_LR_75_MF"

bifrost_RZ_SR_75_MS<-read_tsv("final_results/raw_out/bifrost/RZ_SR_75_MS_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_75_MS_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_75_MS_bifrost_unitigs.csv")
bifrost_RZ_SR_75_MS<-left_join(bifrost_RZ_SR_75_MS_unitigs,bifrost_RZ_SR_75_MS,by = "query_name")
rm(bifrost_RZ_SR_75_MS_unitigs)
bifrost_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

bifrost_RZ_SR_75_MH<-read_tsv("final_results/raw_out/bifrost/RZ_SR_75_MH_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_75_MH_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_75_MH_bifrost_unitigs.csv")
bifrost_RZ_SR_75_MH<-left_join(bifrost_RZ_SR_75_MH_unitigs,bifrost_RZ_SR_75_MH,by = "query_name")
rm(bifrost_RZ_SR_75_MH_unitigs)
bifrost_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

bifrost_RZ_LR_75_MF<-read_tsv("final_results/raw_out/bifrost/RZ_LR_75_MF_bifrost_kmer_ratio.tsv")
bifrost_RZ_LR_75_MF_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_LR_75_MF_bifrost_unitigs.csv")
bifrost_RZ_LR_75_MF<-left_join(bifrost_RZ_LR_75_MF_unitigs,bifrost_RZ_LR_75_MF,by = "query_name")
rm(bifrost_RZ_LR_75_MF_unitigs)
bifrost_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

bifrost_ME_SR_75_MS<-read_tsv("final_results/raw_out/bifrost/ME_SR_75_MS_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_75_MS_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_75_MS_bifrost_unitigs.csv")
bifrost_ME_SR_75_MS<-left_join(bifrost_ME_SR_75_MS_unitigs,bifrost_ME_SR_75_MS,by = "query_name")
rm(bifrost_ME_SR_75_MS_unitigs)
bifrost_ME_SR_75_MS$graph<-"ME_SR_75_MS"

bifrost_ME_SR_75_MH<-read_tsv("final_results/raw_out/bifrost/ME_SR_75_MH_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_75_MH_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_75_MH_bifrost_unitigs.csv")
bifrost_ME_SR_75_MH<-left_join(bifrost_ME_SR_75_MH_unitigs,bifrost_ME_SR_75_MH,by = "query_name")
rm(bifrost_ME_SR_75_MH_unitigs)
bifrost_ME_SR_75_MH$graph<-"ME_SR_75_MH"

bifrost_ME_LR_75_MF<-read_tsv("final_results/raw_out/bifrost/ME_LR_75_MF_bifrost_kmer_ratio.tsv")
bifrost_ME_LR_75_MF_unitigs<-read_csv("final_results/raw_out/bifrost/ME_LR_75_MF_bifrost_unitigs.csv")
bifrost_ME_LR_75_MF<-left_join(bifrost_ME_LR_75_MF_unitigs,bifrost_ME_LR_75_MF,by = "query_name")
rm(bifrost_ME_LR_75_MF_unitigs)
bifrost_ME_LR_75_MF$graph<-"ME_LR_75_MF"

## 100%

bifrost_HC_SR_100_MS<-read_tsv("final_results/raw_out/bifrost/HC_SR_100_MS_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_100_MS_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_100_MS_bifrost_unitigs.csv")
bifrost_HC_SR_100_MS<-left_join(bifrost_HC_SR_100_MS_unitigs,bifrost_HC_SR_100_MS,by = "query_name")
rm(bifrost_HC_SR_100_MS_unitigs)
bifrost_HC_SR_100_MS$graph<-"HC_SR_100_MS"

bifrost_HC_SR_100_MH<-read_tsv("final_results/raw_out/bifrost/HC_SR_100_MH_bifrost_kmer_ratio.tsv")
bifrost_HC_SR_100_MH_unitigs<-read_csv("final_results/raw_out/bifrost/HC_SR_100_MH_bifrost_unitigs.csv")
bifrost_HC_SR_100_MH<-left_join(bifrost_HC_SR_100_MH_unitigs,bifrost_HC_SR_100_MH,by = "query_name")
rm(bifrost_HC_SR_100_MH_unitigs)
bifrost_HC_SR_100_MH$graph<-"HC_SR_100_MH"

bifrost_HC_LR_100_MF<-read_tsv("final_results/raw_out/bifrost/HC_LR_100_MF_bifrost_kmer_ratio.tsv")
bifrost_HC_LR_100_MF_unitigs<-read_csv("final_results/raw_out/bifrost/HC_LR_100_MF_bifrost_unitigs.csv")
bifrost_HC_LR_100_MF<-left_join(bifrost_HC_LR_100_MF_unitigs,bifrost_HC_LR_100_MF,by = "query_name")
rm(bifrost_HC_LR_100_MF_unitigs)
bifrost_HC_LR_100_MF$graph<-"HC_LR_100_MF"

bifrost_LC_SR_100_MS<-read_tsv("final_results/raw_out/bifrost/LC_SR_100_MS_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_100_MS_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_100_MS_bifrost_unitigs.csv")
bifrost_LC_SR_100_MS<-left_join(bifrost_LC_SR_100_MS_unitigs,bifrost_LC_SR_100_MS,by = "query_name")
rm(bifrost_LC_SR_100_MS_unitigs)
bifrost_LC_SR_100_MS$graph<-"LC_SR_100_MS"

bifrost_LC_SR_100_MH<-read_tsv("final_results/raw_out/bifrost/LC_SR_100_MH_bifrost_kmer_ratio.tsv")
bifrost_LC_SR_100_MH_unitigs<-read_csv("final_results/raw_out/bifrost/LC_SR_100_MH_bifrost_unitigs.csv")
bifrost_LC_SR_100_MH<-left_join(bifrost_LC_SR_100_MH_unitigs,bifrost_LC_SR_100_MH,by = "query_name")
rm(bifrost_LC_SR_100_MH_unitigs)
bifrost_LC_SR_100_MH$graph<-"LC_SR_100_MH"

bifrost_LC_LR_100_MF<-read_tsv("final_results/raw_out/bifrost/LC_LR_100_MF_bifrost_kmer_ratio.tsv")
bifrost_LC_LR_100_MF_unitigs<-read_csv("final_results/raw_out/bifrost/LC_LR_100_MF_bifrost_unitigs.csv")
bifrost_LC_LR_100_MF<-left_join(bifrost_LC_LR_100_MF_unitigs,bifrost_LC_LR_100_MF,by = "query_name")
rm(bifrost_LC_LR_100_MF_unitigs)
bifrost_LC_LR_100_MF$graph<-"LC_LR_100_MF"

bifrost_RZ_SR_100_MS<-read_tsv("final_results/raw_out/bifrost/RZ_SR_100_MS_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_100_MS_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_100_MS_bifrost_unitigs.csv")
bifrost_RZ_SR_100_MS<-left_join(bifrost_RZ_SR_100_MS_unitigs,bifrost_RZ_SR_100_MS,by = "query_name")
rm(bifrost_RZ_SR_100_MS_unitigs)
bifrost_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

bifrost_RZ_SR_100_MH<-read_tsv("final_results/raw_out/bifrost/RZ_SR_100_MH_bifrost_kmer_ratio.tsv")
bifrost_RZ_SR_100_MH_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_SR_100_MH_bifrost_unitigs.csv")
bifrost_RZ_SR_100_MH<-left_join(bifrost_RZ_SR_100_MH_unitigs,bifrost_RZ_SR_100_MH,by = "query_name")
rm(bifrost_RZ_SR_100_MH_unitigs)
bifrost_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

bifrost_RZ_LR_100_MF<-read_tsv("final_results/raw_out/bifrost/RZ_LR_100_MF_bifrost_kmer_ratio.tsv")
bifrost_RZ_LR_100_MF_unitigs<-read_csv("final_results/raw_out/bifrost/RZ_LR_100_MF_bifrost_unitigs.csv")
bifrost_RZ_LR_100_MF<-left_join(bifrost_RZ_LR_100_MF_unitigs,bifrost_RZ_LR_100_MF,by = "query_name")
rm(bifrost_RZ_LR_100_MF_unitigs)
bifrost_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

bifrost_ME_SR_100_MS<-read_tsv("final_results/raw_out/bifrost/ME_SR_100_MS_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_100_MS_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_100_MS_bifrost_unitigs.csv")
bifrost_ME_SR_100_MS<-left_join(bifrost_ME_SR_100_MS_unitigs,bifrost_ME_SR_100_MS,by = "query_name")
rm(bifrost_ME_SR_100_MS_unitigs)
bifrost_ME_SR_100_MS$graph<-"ME_SR_100_MS"

bifrost_ME_SR_100_MH<-read_tsv("final_results/raw_out/bifrost/ME_SR_100_MH_bifrost_kmer_ratio.tsv")
bifrost_ME_SR_100_MH_unitigs<-read_csv("final_results/raw_out/bifrost/ME_SR_100_MH_bifrost_unitigs.csv")
bifrost_ME_SR_100_MH<-left_join(bifrost_ME_SR_100_MH_unitigs,bifrost_ME_SR_100_MH,by = "query_name")
rm(bifrost_ME_SR_100_MH_unitigs)
bifrost_ME_SR_100_MH$graph<-"ME_SR_100_MH"

bifrost_ME_LR_100_MF<-read_tsv("final_results/raw_out/bifrost/ME_LR_100_MF_bifrost_kmer_ratio.tsv")
bifrost_ME_LR_100_MF_unitigs<-read_csv("final_results/raw_out/bifrost/ME_LR_100_MF_bifrost_unitigs.csv")
bifrost_ME_LR_100_MF<-left_join(bifrost_ME_LR_100_MF_unitigs,bifrost_ME_LR_100_MF,by = "query_name")
rm(bifrost_ME_LR_100_MF_unitigs)
bifrost_ME_LR_100_MF$graph<-"ME_LR_100_MF"

## combine and read out data

bifrost_all<-rbind(
  bifrost_HC_LR_100_MF,bifrost_HC_LR_25_MF,bifrost_HC_LR_50_MF,bifrost_HC_LR_75_MF,bifrost_HC_SR_100_MH,
  bifrost_HC_SR_100_MS,bifrost_HC_SR_25_MH,bifrost_HC_SR_25_MS,bifrost_HC_SR_50_MH,bifrost_HC_SR_50_MS,
  bifrost_HC_SR_75_MH,bifrost_HC_SR_75_MS,bifrost_LC_LR_100_MF,bifrost_LC_LR_25_MF,bifrost_LC_LR_50_MF,
  bifrost_LC_LR_75_MF,bifrost_LC_SR_100_MH,bifrost_LC_SR_100_MS,bifrost_LC_SR_25_MH,bifrost_LC_SR_25_MS,
  bifrost_LC_SR_50_MH,bifrost_LC_SR_50_MS,bifrost_LC_SR_75_MH,bifrost_LC_SR_75_MS,bifrost_ME_LR_100_MF,
  bifrost_ME_LR_25_MF,bifrost_ME_LR_50_MF,bifrost_ME_LR_75_MF,
  bifrost_ME_SR_100_MH,bifrost_ME_SR_100_MS,bifrost_ME_SR_25_MH,bifrost_ME_SR_25_MS,bifrost_ME_SR_50_MH,bifrost_ME_SR_50_MS,
  bifrost_ME_SR_75_MH,bifrost_ME_SR_75_MS,bifrost_RZ_LR_100_MF,bifrost_RZ_LR_25_MF,bifrost_RZ_LR_50_MF,
  bifrost_RZ_LR_75_MF,bifrost_RZ_SR_100_MH,bifrost_RZ_SR_100_MS,bifrost_RZ_SR_25_MH,bifrost_RZ_SR_25_MS,
  bifrost_RZ_SR_50_MH,bifrost_RZ_SR_50_MS,bifrost_RZ_SR_75_MH,bifrost_RZ_SR_75_MS
)

rm(
  bifrost_HC_LR_100_MF,bifrost_HC_LR_25_MF,bifrost_HC_LR_50_MF,bifrost_HC_LR_75_MF,bifrost_HC_SR_100_MH,
  bifrost_HC_SR_100_MS,bifrost_HC_SR_25_MH,bifrost_HC_SR_25_MS,bifrost_HC_SR_50_MH,bifrost_HC_SR_50_MS,
  bifrost_HC_SR_75_MH,bifrost_HC_SR_75_MS,bifrost_LC_LR_100_MF,bifrost_LC_LR_25_MF,bifrost_LC_LR_50_MF,
  bifrost_LC_LR_75_MF,bifrost_LC_SR_100_MH,bifrost_LC_SR_100_MS,bifrost_LC_SR_25_MH,bifrost_LC_SR_25_MS,
  bifrost_LC_SR_50_MH,bifrost_LC_SR_50_MS,bifrost_LC_SR_75_MH,bifrost_LC_SR_75_MS,bifrost_ME_LR_100_MF,
  bifrost_ME_LR_25_MF,bifrost_ME_LR_50_MF,bifrost_ME_LR_75_MF,
  bifrost_ME_SR_100_MH,bifrost_ME_SR_100_MS,bifrost_ME_SR_25_MH,bifrost_ME_SR_25_MS,bifrost_ME_SR_50_MH,bifrost_ME_SR_50_MS,
  bifrost_ME_SR_75_MH,bifrost_ME_SR_75_MS,bifrost_RZ_LR_100_MF,bifrost_RZ_LR_25_MF,bifrost_RZ_LR_50_MF,
  bifrost_RZ_LR_75_MF,bifrost_RZ_SR_100_MH,bifrost_RZ_SR_100_MS,bifrost_RZ_SR_25_MH,bifrost_RZ_SR_25_MS,
  bifrost_RZ_SR_50_MH,bifrost_RZ_SR_50_MS,bifrost_RZ_SR_75_MH,bifrost_RZ_SR_75_MS
)

write_csv(bifrost_all,"final_results/bifrost_all.csv")

rm(bifrost_all)

### bandage 

bandage_HC_SR_25_MS<-read_tsv("final_results/raw_out/bandage/HC_SR_25_MS_bandage.tsv")
bandage_HC_SR_25_MS$graph<-"HC_SR_25_MS"

bandage_HC_SR_25_MH<-read_tsv("final_results/raw_out/bandage/HC_SR_25_MH_bandage.tsv")
bandage_HC_SR_25_MH$graph<-"HC_SR_25_MH"

bandage_HC_LR_25_MF<-read_tsv("final_results/raw_out/bandage/HC_LR_25_MF_bandage.tsv")
bandage_HC_LR_25_MF$graph<-"HC_LR_25_MF"

bandage_HC_LR_25_SH<-read_tsv("final_results/raw_out/bandage/HC_LR_25_SH_bandage.tsv")
bandage_HC_LR_25_SH$graph<-"HC_LR_25_SH"

bandage_LC_SR_25_MS<-read_tsv("final_results/raw_out/bandage/LC_SR_25_MS_bandage.tsv")
bandage_LC_SR_25_MS$graph<-"LC_SR_25_MS"

bandage_LC_SR_25_MH<-read_tsv("final_results/raw_out/bandage/LC_SR_25_MH_bandage.tsv")
bandage_LC_SR_25_MH$graph<-"LC_SR_25_MH"

bandage_LC_LR_25_MF<-read_tsv("final_results/raw_out/bandage/LC_LR_25_MF_bandage.tsv")
bandage_LC_LR_25_MF$graph<-"LC_LR_25_MF"

bandage_LC_LR_25_SH<-read_tsv("final_results/raw_out/bandage/LC_LR_25_SH_bandage.tsv")
bandage_LC_LR_25_SH$graph<-"LC_LR_25_SH"

bandage_RZ_SR_25_MS<-read_tsv("final_results/raw_out/bandage/RZ_SR_25_MS_bandage.tsv")
bandage_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

bandage_RZ_SR_25_MH<-read_tsv("final_results/raw_out/bandage/RZ_SR_25_MH_bandage.tsv")
bandage_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

bandage_RZ_LR_25_MF<-read_tsv("final_results/raw_out/bandage/RZ_LR_25_MF_bandage.tsv")
bandage_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

bandage_RZ_LR_25_SH<-read_tsv("final_results/raw_out/bandage/RZ_LR_25_SH_bandage.tsv")
bandage_RZ_LR_25_SH$graph<-"RZ_LR_25_SH"

bandage_ME_SR_25_MS<-read_tsv("final_results/raw_out/bandage/ME_SR_25_MS_bandage.tsv")
bandage_ME_SR_25_MS$graph<-"ME_SR_25_MS" 

bandage_ME_SR_25_MH<-read_tsv("final_results/raw_out/bandage/ME_SR_25_MH_bandage.tsv")
bandage_ME_SR_25_MH$graph<-"ME_SR_25_MH"

bandage_ME_LR_25_MF<-read_tsv("final_results/raw_out/bandage/ME_LR_25_MF_bandage.tsv")
bandage_ME_LR_25_MF$graph<-"ME_LR_25_MF"

bandage_ME_LR_25_SH<-read_tsv("final_results/raw_out/bandage/ME_LR_25_SH_bandage.tsv")
bandage_ME_LR_25_SH$graph<-"ME_LR_25_SH"

## 50% subsamples

bandage_HC_SR_50_MS<-read_tsv("final_results/raw_out/bandage/HC_SR_50_MS_bandage.tsv")
bandage_HC_SR_50_MS$graph<-"HC_SR_50_MS"

bandage_HC_SR_50_MH<-read_tsv("final_results/raw_out/bandage/HC_SR_50_MH_bandage.tsv")
bandage_HC_SR_50_MH$graph<-"HC_SR_50_MH"

bandage_HC_LR_50_MF<-read_tsv("final_results/raw_out/bandage/HC_LR_50_MF_bandage.tsv")
bandage_HC_LR_50_MF$graph<-"HC_LR_50_MF"

bandage_HC_LR_50_SH<-read_tsv("final_results/raw_out/bandage/HC_LR_50_SH_bandage.tsv")
bandage_HC_LR_50_SH$graph<-"HC_LR_50_SH"

bandage_LC_SR_50_MS<-read_tsv("final_results/raw_out/bandage/LC_SR_50_MS_bandage.tsv")
bandage_LC_SR_50_MS$graph<-"LC_SR_50_MS"

bandage_LC_SR_50_MH<-read_tsv("final_results/raw_out/bandage/LC_SR_50_MH_bandage.tsv")
bandage_LC_SR_50_MH$graph<-"LC_SR_50_MH"

bandage_LC_LR_50_MF<-read_tsv("final_results/raw_out/bandage/LC_LR_50_MF_bandage.tsv")
bandage_LC_LR_50_MF$graph<-"LC_LR_50_MF"

bandage_LC_LR_50_SH<-read_tsv("final_results/raw_out/bandage/LC_LR_50_SH_bandage.tsv")
bandage_LC_LR_50_SH$graph<-"LC_LR_50_SH"

bandage_RZ_SR_50_MS<-read_tsv("final_results/raw_out/bandage/RZ_SR_50_MS_bandage.tsv")
bandage_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

bandage_RZ_SR_50_MH<-read_tsv("final_results/raw_out/bandage/RZ_SR_50_MH_bandage.tsv")
bandage_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

bandage_RZ_LR_50_MF<-read_tsv("final_results/raw_out/bandage/RZ_LR_50_MF_bandage.tsv")
bandage_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

bandage_RZ_LR_50_SH<-read_tsv("final_results/raw_out/bandage/RZ_LR_50_SH_bandage.tsv")
bandage_RZ_LR_50_SH$graph<-"RZ_LR_50_SH"

bandage_ME_SR_50_MS<-read_tsv("final_results/raw_out/bandage/ME_SR_50_MS_bandage.tsv")
bandage_ME_SR_50_MS$graph<-"ME_SR_50_MS"

bandage_ME_SR_50_MH<-read_tsv("final_results/raw_out/bandage/ME_SR_50_MH_bandage.tsv")
bandage_ME_SR_50_MH$graph<-"ME_SR_50_MH"

bandage_ME_LR_50_MF<-read_tsv("final_results/raw_out/bandage/ME_LR_50_MF_bandage.tsv")
bandage_ME_LR_50_MF$graph<-"ME_LR_50_MF"

bandage_ME_LR_50_SH<-read_tsv("final_results/raw_out/bandage/ME_LR_50_SH_bandage.tsv")
bandage_ME_LR_50_SH$graph<-"ME_LR_50_SH"

## 75% subsamples

bandage_HC_SR_75_MS<-read_tsv("final_results/raw_out/bandage/HC_SR_75_MS_bandage.tsv")
bandage_HC_SR_75_MS$graph<-"HC_SR_75_MS"

bandage_HC_SR_75_MH<-read_tsv("final_results/raw_out/bandage/HC_SR_75_MH_bandage.tsv")
bandage_HC_SR_75_MH$graph<-"HC_SR_75_MH"

bandage_HC_LR_75_MF<-read_tsv("final_results/raw_out/bandage/HC_LR_75_MF_bandage.tsv")
bandage_HC_LR_75_MF$graph<-"HC_LR_75_MF"

bandage_HC_LR_75_SH<-read_tsv("final_results/raw_out/bandage/HC_LR_75_SH_bandage.tsv")
bandage_HC_LR_75_SH$graph<-"HC_LR_75_SH"

bandage_LC_SR_75_MS<-read_tsv("final_results/raw_out/bandage/LC_SR_75_MS_bandage.tsv")
bandage_LC_SR_75_MS$graph<-"LC_SR_75_MS"

bandage_LC_SR_75_MH<-read_tsv("final_results/raw_out/bandage/LC_SR_75_MH_bandage.tsv")
bandage_LC_SR_75_MH$graph<-"LC_SR_75_MH"

bandage_LC_LR_75_MF<-read_tsv("final_results/raw_out/bandage/LC_LR_75_MF_bandage.tsv")
bandage_LC_LR_75_MF$graph<-"LC_LR_75_MF"

bandage_LC_LR_75_SH<-read_tsv("final_results/raw_out/bandage/LC_LR_75_SH_bandage.tsv")
bandage_LC_LR_75_SH$graph<-"LC_LR_75_SH"

bandage_RZ_SR_75_MS<-read_tsv("final_results/raw_out/bandage/RZ_SR_75_MS_bandage.tsv")
bandage_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

bandage_RZ_SR_75_MH<-read_tsv("final_results/raw_out/bandage/RZ_SR_75_MH_bandage.tsv")
bandage_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

bandage_RZ_LR_75_MF<-read_tsv("final_results/raw_out/bandage/RZ_LR_75_MF_bandage.tsv")
bandage_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

bandage_RZ_LR_75_SH<-read_tsv("final_results/raw_out/bandage/RZ_LR_75_SH_bandage.tsv")
bandage_RZ_LR_75_SH$graph<-"RZ_LR_75_SH"

bandage_ME_SR_75_MS<-read_tsv("final_results/raw_out/bandage/ME_SR_75_MS_bandage.tsv")
bandage_ME_SR_75_MS$graph<-"ME_SR_75_MS"

bandage_ME_SR_75_MH<-read_tsv("final_results/raw_out/bandage/ME_SR_75_MH_bandage.tsv")
bandage_ME_SR_75_MH$graph<-"ME_SR_75_MH"

bandage_ME_LR_75_MF<-read_tsv("final_results/raw_out/bandage/ME_LR_75_MF_bandage.tsv")
bandage_ME_LR_75_MF$graph<-"ME_LR_75_MF"

bandage_ME_LR_75_SH<-read_tsv("final_results/raw_out/bandage/ME_LR_75_SH_bandage.tsv")
bandage_ME_LR_75_SH$graph<-"ME_LR_75_SH"

## 100%

bandage_HC_SR_100_MS<-read_tsv("final_results/raw_out/bandage/HC_SR_100_MS_bandage.tsv")
bandage_HC_SR_100_MS$graph<-"HC_SR_100_MS"

bandage_HC_SR_100_MH<-read_tsv("final_results/raw_out/bandage/HC_SR_100_MH_bandage.tsv")
bandage_HC_SR_100_MH$graph<-"HC_SR_100_MH"

bandage_HC_LR_100_MF<-read_tsv("final_results/raw_out/bandage/HC_LR_100_MF_bandage.tsv")
bandage_HC_LR_100_MF$graph<-"HC_LR_100_MF"

bandage_HC_LR_100_SH<-read_tsv("final_results/raw_out/bandage/HC_LR_100_SH_bandage.tsv")
bandage_HC_LR_100_SH$graph<-"HC_LR_100_SH"

bandage_LC_SR_100_MS<-read_tsv("final_results/raw_out/bandage/LC_SR_100_MS_bandage.tsv")
bandage_LC_SR_100_MS$graph<-"LC_SR_100_MS"

bandage_LC_SR_100_MH<-read_tsv("final_results/raw_out/bandage/LC_SR_100_MH_bandage.tsv")
bandage_LC_SR_100_MH$graph<-"LC_SR_100_MH"

bandage_LC_LR_100_MF<-read_tsv("final_results/raw_out/bandage/LC_LR_100_MF_bandage.tsv")
bandage_LC_LR_100_MF$graph<-"LC_LR_100_MF"

bandage_LC_LR_100_SH<-read_tsv("final_results/raw_out/bandage/LC_LR_100_SH_bandage.tsv")
bandage_LC_LR_100_SH$graph<-"LC_LR_100_SH"

bandage_RZ_SR_100_MS<-read_tsv("final_results/raw_out/bandage/RZ_SR_100_MS_bandage.tsv")
bandage_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

bandage_RZ_SR_100_MH<-read_tsv("final_results/raw_out/bandage/RZ_SR_100_MH_bandage.tsv")
bandage_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

bandage_RZ_LR_100_MF<-read_tsv("final_results/raw_out/bandage/RZ_LR_100_MF_bandage.tsv")
bandage_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

bandage_RZ_LR_100_SH<-read_tsv("final_results/raw_out/bandage/RZ_LR_100_SH_bandage.tsv")
bandage_RZ_LR_100_SH$graph<-"RZ_LR_100_SH"

bandage_ME_SR_100_MS<-read_tsv("final_results/raw_out/bandage/ME_SR_100_MS_bandage.tsv")
bandage_ME_SR_100_MS$graph<-"ME_SR_100_MS" 

bandage_ME_SR_100_MH<-read_tsv("final_results/raw_out/bandage/ME_SR_100_MH_bandage.tsv")
bandage_ME_SR_100_MH$graph<-"ME_SR_100_MH"

bandage_ME_LR_100_MF<-read_tsv("final_results/raw_out/bandage/ME_LR_100_MF_bandage.tsv")
bandage_ME_LR_100_MF$graph<-"ME_LR_100_MF"

bandage_ME_LR_100_SH<-read_tsv("final_results/raw_out/bandage/ME_LR_100_SH_bandage.tsv")
bandage_ME_LR_100_SH$graph<-"ME_LR_100_SH"

## combine and read out data


bandage_all<-rbind(
  bandage_HC_LR_100_MF,bandage_HC_LR_100_SH,bandage_HC_LR_25_MF,bandage_HC_LR_25_SH,bandage_HC_LR_50_MF,bandage_HC_LR_50_SH,bandage_HC_LR_75_MF,bandage_HC_LR_75_SH,bandage_HC_SR_100_MH,
  bandage_HC_SR_100_MS,bandage_HC_SR_25_MH,bandage_HC_SR_25_MS,bandage_HC_SR_50_MH,bandage_HC_SR_50_MS,
  bandage_HC_SR_75_MH,bandage_HC_SR_75_MS,bandage_LC_LR_100_MF,bandage_LC_LR_100_SH,bandage_LC_LR_25_MF,bandage_LC_LR_25_SH,bandage_LC_LR_50_MF,bandage_LC_LR_50_SH,
  bandage_LC_LR_75_MF,bandage_LC_LR_75_SH,bandage_LC_SR_100_MH,bandage_LC_SR_100_MS,bandage_LC_SR_25_MH,bandage_LC_SR_25_MS,
  bandage_LC_SR_50_MH,bandage_LC_SR_50_MS,bandage_LC_SR_75_MH,bandage_LC_SR_75_MS,bandage_ME_LR_100_MF,bandage_ME_LR_100_SH,
  bandage_ME_LR_25_MF,bandage_ME_LR_25_SH,bandage_ME_LR_50_MF,bandage_ME_LR_50_SH,bandage_ME_LR_75_MF,bandage_ME_LR_75_SH,
  bandage_ME_SR_100_MH,bandage_ME_SR_100_MS,bandage_ME_SR_25_MH,bandage_ME_SR_25_MS,bandage_ME_SR_50_MH,bandage_ME_SR_50_MS,
  bandage_ME_SR_75_MH,bandage_ME_SR_75_MS,bandage_RZ_LR_100_MF,bandage_RZ_LR_100_SH,bandage_RZ_LR_25_MF,bandage_RZ_LR_25_SH,bandage_RZ_LR_50_MF,bandage_RZ_LR_50_SH,
  bandage_RZ_LR_75_MF,bandage_RZ_LR_75_SH,bandage_RZ_SR_100_MH,bandage_RZ_SR_100_MS,bandage_RZ_SR_25_MH,bandage_RZ_SR_25_MS,
  bandage_RZ_SR_50_MH,bandage_RZ_SR_50_MS,bandage_RZ_SR_75_MH,bandage_RZ_SR_75_MS
)

rm(
  bandage_HC_LR_100_MF,bandage_HC_LR_100_SH,bandage_HC_LR_25_MF,bandage_HC_LR_25_SH,bandage_HC_LR_50_MF,bandage_HC_LR_50_SH,bandage_HC_LR_75_MF,bandage_HC_LR_75_SH,bandage_HC_SR_100_MH,
  bandage_HC_SR_100_MS,bandage_HC_SR_25_MH,bandage_HC_SR_25_MS,bandage_HC_SR_50_MH,bandage_HC_SR_50_MS,
  bandage_HC_SR_75_MH,bandage_HC_SR_75_MS,bandage_LC_LR_100_MF,bandage_LC_LR_100_SH,bandage_LC_LR_25_MF,bandage_LC_LR_25_SH,bandage_LC_LR_50_MF,bandage_LC_LR_50_SH,
  bandage_LC_LR_75_MF,bandage_LC_LR_75_SH,bandage_LC_SR_100_MH,bandage_LC_SR_100_MS,bandage_LC_SR_25_MH,bandage_LC_SR_25_MS,
  bandage_LC_SR_50_MH,bandage_LC_SR_50_MS,bandage_LC_SR_75_MH,bandage_LC_SR_75_MS,bandage_ME_LR_100_MF,bandage_ME_LR_100_SH,
  bandage_ME_LR_25_MF,bandage_ME_LR_25_SH,bandage_ME_LR_50_MF,bandage_ME_LR_50_SH,bandage_ME_LR_75_MF,bandage_ME_LR_75_SH,
  bandage_ME_SR_100_MH,bandage_ME_SR_100_MS,bandage_ME_SR_25_MH,bandage_ME_SR_25_MS,bandage_ME_SR_50_MH,bandage_ME_SR_50_MS,
  bandage_ME_SR_75_MH,bandage_ME_SR_75_MS,bandage_RZ_LR_100_MF,bandage_RZ_LR_100_SH,bandage_RZ_LR_25_MF,bandage_RZ_LR_25_SH,bandage_RZ_LR_50_MF,bandage_RZ_LR_50_SH,
  bandage_RZ_LR_75_MF,bandage_RZ_LR_75_SH,bandage_RZ_SR_100_MH,bandage_RZ_SR_100_MS,bandage_RZ_SR_25_MH,bandage_RZ_SR_25_MS,
  bandage_RZ_SR_50_MH,bandage_RZ_SR_50_MS,bandage_RZ_SR_75_MH,bandage_RZ_SR_75_MS
)

write_csv(bandage_all,"final_results/bandage_all.csv")

rm(bandage_all)

## graphaligner

graphaligner_cols<-c("query", "query_length","query_start","query_end","strand","path","path_length","path_start","path_end","number_residue_matches","alignment_length","mapping_quality","snps_and_indels","alignment_score","divergence","perc_identity","cigar")

## 25% subsamples

graphaligner_HC_SR_25_MS<-read_tsv("final_results/raw_out/graphaligner/HC_SR_25_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_25_MS$graph<-"HC_SR_25_MS"

graphaligner_HC_SR_25_MH<-read_tsv("final_results/raw_out/graphaligner/HC_SR_25_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_25_MH$graph<-"HC_SR_25_MH"

graphaligner_HC_LR_25_MF<-read_tsv("final_results/raw_out/graphaligner/HC_LR_25_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_25_MF$graph<-"HC_LR_25_MF"

graphaligner_HC_LR_25_SH<-read_tsv("final_results/raw_out/graphaligner/HC_LR_25_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_25_SH$graph<-"HC_LR_25_SH"

graphaligner_LC_SR_25_MS<-read_tsv("final_results/raw_out/graphaligner/LC_SR_25_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_25_MS$graph<-"LC_SR_25_MS"

graphaligner_LC_SR_25_MH<-read_tsv("final_results/raw_out/graphaligner/LC_SR_25_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_25_MH$graph<-"LC_SR_25_MH"

graphaligner_LC_LR_25_MF<-read_tsv("final_results/raw_out/graphaligner/LC_LR_25_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_25_MF$graph<-"LC_LR_25_MF"

graphaligner_LC_LR_25_SH<-read_tsv("final_results/raw_out/graphaligner/LC_LR_25_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_25_SH$graph<-"LC_LR_25_SH"

graphaligner_RZ_SR_25_MS<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_25_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

graphaligner_RZ_SR_25_MH<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_25_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

graphaligner_RZ_LR_25_MF<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_25_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

graphaligner_RZ_LR_25_SH<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_25_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_25_SH$graph<-"RZ_LR_25_SH"

graphaligner_ME_SR_25_MS<-read_tsv("final_results/raw_out/graphaligner/ME_SR_25_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_25_MS$graph<-"ME_SR_25_MS" 

graphaligner_ME_SR_25_MH<-read_tsv("final_results/raw_out/graphaligner/ME_SR_25_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_25_MH$graph<-"ME_SR_25_MH"

graphaligner_ME_LR_25_MF<-read_tsv("final_results/raw_out/graphaligner/ME_LR_25_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_25_MF$graph<-"ME_LR_25_MF"

graphaligner_ME_LR_25_SH<-read_tsv("final_results/raw_out/graphaligner/ME_LR_25_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_25_SH$graph<-"ME_LR_25_SH"

## 50% subsamples

graphaligner_HC_SR_50_MS<-read_tsv("final_results/raw_out/graphaligner/HC_SR_50_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_50_MS$graph<-"HC_SR_50_MS"

graphaligner_HC_SR_50_MH<-read_tsv("final_results/raw_out/graphaligner/HC_SR_50_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_50_MH$graph<-"HC_SR_50_MH"

graphaligner_HC_LR_50_MF<-read_tsv("final_results/raw_out/graphaligner/HC_LR_50_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_50_MF$graph<-"HC_LR_50_MF"

graphaligner_HC_LR_50_SH<-read_tsv("final_results/raw_out/graphaligner/HC_LR_50_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_50_SH$graph<-"HC_LR_50_SH"

graphaligner_LC_SR_50_MS<-read_tsv("final_results/raw_out/graphaligner/LC_SR_50_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_50_MS$graph<-"LC_SR_50_MS"

graphaligner_LC_SR_50_MH<-read_tsv("final_results/raw_out/graphaligner/LC_SR_50_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_50_MH$graph<-"LC_SR_50_MH"

graphaligner_LC_LR_50_MF<-read_tsv("final_results/raw_out/graphaligner/LC_LR_50_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_50_MF$graph<-"LC_LR_50_MF"

graphaligner_LC_LR_50_SH<-read_tsv("final_results/raw_out/graphaligner/LC_LR_50_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_50_SH$graph<-"LC_LR_50_SH"

graphaligner_RZ_SR_50_MS<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_50_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

graphaligner_RZ_SR_50_MH<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_50_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

graphaligner_RZ_LR_50_MF<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_50_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

graphaligner_RZ_LR_50_SH<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_50_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_50_SH$graph<-"RZ_LR_50_SH"

graphaligner_ME_SR_50_MS<-read_tsv("final_results/raw_out/graphaligner/ME_SR_50_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_50_MS$graph<-"ME_SR_50_MS" 

graphaligner_ME_SR_50_MH<-read_tsv("final_results/raw_out/graphaligner/ME_SR_50_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_50_MH$graph<-"ME_SR_50_MH"

graphaligner_ME_LR_50_MF<-read_tsv("final_results/raw_out/graphaligner/ME_LR_50_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_50_MF$graph<-"ME_LR_50_MF"

graphaligner_ME_LR_50_SH<-read_tsv("final_results/raw_out/graphaligner/ME_LR_50_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_50_SH$graph<-"ME_LR_50_SH"

## 75% subsamples

graphaligner_HC_SR_75_MS<-read_tsv("final_results/raw_out/graphaligner/HC_SR_75_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_75_MS$graph<-"HC_SR_75_MS"

graphaligner_HC_SR_75_MH<-read_tsv("final_results/raw_out/graphaligner/HC_SR_75_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_75_MH$graph<-"HC_SR_75_MH"

graphaligner_HC_LR_75_MF<-read_tsv("final_results/raw_out/graphaligner/HC_LR_75_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_75_MF$graph<-"HC_LR_75_MF"

graphaligner_HC_LR_75_SH<-read_tsv("final_results/raw_out/graphaligner/HC_LR_75_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_75_SH$graph<-"HC_LR_75_SH"

graphaligner_LC_SR_75_MS<-read_tsv("final_results/raw_out/graphaligner/LC_SR_75_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_75_MS$graph<-"LC_SR_75_MS"

graphaligner_LC_SR_75_MH<-read_tsv("final_results/raw_out/graphaligner/LC_SR_75_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_75_MH$graph<-"LC_SR_75_MH"

graphaligner_LC_LR_75_MF<-read_tsv("final_results/raw_out/graphaligner/LC_LR_75_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_75_MF$graph<-"LC_LR_75_MF"

graphaligner_LC_LR_75_SH<-read_tsv("final_results/raw_out/graphaligner/LC_LR_75_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_75_SH$graph<-"LC_LR_75_SH"

graphaligner_RZ_SR_75_MS<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_75_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

graphaligner_RZ_SR_75_MH<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_75_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

graphaligner_RZ_LR_75_MF<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_75_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

graphaligner_RZ_LR_75_SH<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_75_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_75_SH$graph<-"RZ_LR_75_SH"

graphaligner_ME_SR_75_MS<-read_tsv("final_results/raw_out/graphaligner/ME_SR_75_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_75_MS$graph<-"ME_SR_75_MS"

graphaligner_ME_SR_75_MH<-read_tsv("final_results/raw_out/graphaligner/ME_SR_75_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_75_MH$graph<-"ME_SR_75_MH"

graphaligner_ME_LR_75_MF<-read_tsv("final_results/raw_out/graphaligner/ME_LR_75_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_75_MF$graph<-"ME_LR_75_MF"

graphaligner_ME_LR_75_SH<-read_tsv("final_results/raw_out/graphaligner/ME_LR_75_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_75_SH$graph<-"ME_LR_75_SH"

## 100%

graphaligner_HC_SR_100_MS<-read_tsv("final_results/raw_out/graphaligner/HC_SR_100_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_100_MS$graph<-"HC_SR_100_MS"

graphaligner_HC_SR_100_MH<-read_tsv("final_results/raw_out/graphaligner/HC_SR_100_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_SR_100_MH$graph<-"HC_SR_100_MH"

graphaligner_HC_LR_100_MF<-read_tsv("final_results/raw_out/graphaligner/HC_LR_100_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_100_MF$graph<-"HC_LR_100_MF"

graphaligner_HC_LR_100_SH<-read_tsv("final_results/raw_out/graphaligner/HC_LR_100_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_HC_LR_100_SH$graph<-"HC_LR_100_SH"

graphaligner_LC_SR_100_MS<-read_tsv("final_results/raw_out/graphaligner/LC_SR_100_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_100_MS$graph<-"LC_SR_100_MS"

graphaligner_LC_SR_100_MH<-read_tsv("final_results/raw_out/graphaligner/LC_SR_100_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_SR_100_MH$graph<-"LC_SR_100_MH"

graphaligner_LC_LR_100_MF<-read_tsv("final_results/raw_out/graphaligner/LC_LR_100_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_100_MF$graph<-"LC_LR_100_MF"

graphaligner_LC_LR_100_SH<-read_tsv("final_results/raw_out/graphaligner/LC_LR_100_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_LC_LR_100_SH$graph<-"LC_LR_100_SH"

graphaligner_RZ_SR_100_MS<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_100_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

graphaligner_RZ_SR_100_MH<-read_tsv("final_results/raw_out/graphaligner/RZ_SR_100_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

graphaligner_RZ_LR_100_MF<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_100_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

graphaligner_RZ_LR_100_SH<-read_tsv("final_results/raw_out/graphaligner/RZ_LR_100_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_RZ_LR_100_SH$graph<-"RZ_LR_100_SH"

graphaligner_ME_SR_100_MS<-read_tsv("final_results/raw_out/graphaligner/ME_SR_100_MS_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_100_MS$graph<-"ME_SR_100_MS"

graphaligner_ME_SR_100_MH<-read_tsv("final_results/raw_out/graphaligner/ME_SR_100_MH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_SR_100_MH$graph<-"ME_SR_100_MH"

graphaligner_ME_LR_100_MF<-read_tsv("final_results/raw_out/graphaligner/ME_LR_100_MF_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_100_MF$graph<-"ME_LR_100_MF"

graphaligner_ME_LR_100_SH<-read_tsv("final_results/raw_out/graphaligner/ME_LR_100_SH_GA_.gaf", col_names = graphaligner_cols)
graphaligner_ME_LR_100_SH$graph<-"ME_LR_100_SH"

## combine and read out data

graphaligner_all<-rbind(
  graphaligner_HC_LR_100_MF,graphaligner_HC_LR_100_SH,graphaligner_HC_LR_25_MF,graphaligner_HC_LR_25_SH,graphaligner_HC_LR_50_MF,graphaligner_HC_LR_50_SH,graphaligner_HC_LR_75_MF,graphaligner_HC_LR_75_SH,graphaligner_HC_SR_100_MH,
  graphaligner_HC_SR_100_MS,graphaligner_HC_SR_25_MH,graphaligner_HC_SR_25_MS,graphaligner_HC_SR_50_MH,graphaligner_HC_SR_50_MS,
  graphaligner_HC_SR_75_MH,graphaligner_HC_SR_75_MS,graphaligner_LC_LR_100_MF,graphaligner_LC_LR_100_SH,graphaligner_LC_LR_25_MF,graphaligner_LC_LR_25_SH,graphaligner_LC_LR_50_MF,graphaligner_LC_LR_50_SH,
  graphaligner_LC_LR_75_MF,graphaligner_LC_LR_75_SH,graphaligner_LC_SR_100_MH,graphaligner_LC_SR_100_MS,graphaligner_LC_SR_25_MH,graphaligner_LC_SR_25_MS,
  graphaligner_LC_SR_50_MH,graphaligner_LC_SR_50_MS,graphaligner_LC_SR_75_MH,graphaligner_LC_SR_75_MS,graphaligner_ME_LR_100_MF,graphaligner_ME_LR_100_SH,
  graphaligner_ME_LR_25_MF,graphaligner_ME_LR_25_SH,graphaligner_ME_LR_50_MF,graphaligner_ME_LR_50_SH,graphaligner_ME_LR_75_MF,graphaligner_ME_LR_75_SH,
  graphaligner_ME_SR_100_MH,graphaligner_ME_SR_100_MS,graphaligner_ME_SR_25_MH,graphaligner_ME_SR_25_MS,
  graphaligner_ME_SR_50_MH,graphaligner_ME_SR_50_MS,graphaligner_ME_SR_75_MH,graphaligner_ME_SR_75_MS,
  graphaligner_RZ_LR_100_MF,graphaligner_RZ_LR_100_SH,graphaligner_RZ_LR_25_MF,graphaligner_RZ_LR_25_SH,graphaligner_RZ_LR_50_MF,graphaligner_RZ_LR_50_SH,
  graphaligner_RZ_LR_75_MF,graphaligner_RZ_LR_75_SH,graphaligner_RZ_SR_100_MH,graphaligner_RZ_SR_100_MS,graphaligner_RZ_SR_25_MH,graphaligner_RZ_SR_25_MS,
  graphaligner_RZ_SR_50_MH,graphaligner_RZ_SR_50_MS,graphaligner_RZ_SR_75_MH,graphaligner_RZ_SR_75_MS
)

rm(
  graphaligner_HC_LR_100_MF,graphaligner_HC_LR_100_SH,graphaligner_HC_LR_25_MF,graphaligner_HC_LR_25_SH,graphaligner_HC_LR_50_MF,graphaligner_HC_LR_50_SH,graphaligner_HC_LR_75_MF,graphaligner_HC_LR_75_SH,graphaligner_HC_SR_100_MH,
  graphaligner_HC_SR_100_MS,graphaligner_HC_SR_25_MH,graphaligner_HC_SR_25_MS,graphaligner_HC_SR_50_MH,graphaligner_HC_SR_50_MS,
  graphaligner_HC_SR_75_MH,graphaligner_HC_SR_75_MS,graphaligner_LC_LR_100_MF,graphaligner_LC_LR_100_SH,graphaligner_LC_LR_25_MF,graphaligner_LC_LR_25_SH,graphaligner_LC_LR_50_MF,graphaligner_LC_LR_50_SH,
  graphaligner_LC_LR_75_MF,graphaligner_LC_LR_75_SH,graphaligner_LC_SR_100_MH,graphaligner_LC_SR_100_MS,graphaligner_LC_SR_25_MH,graphaligner_LC_SR_25_MS,
  graphaligner_LC_SR_50_MH,graphaligner_LC_SR_50_MS,graphaligner_LC_SR_75_MH,graphaligner_LC_SR_75_MS,graphaligner_ME_LR_100_MF,graphaligner_ME_LR_100_SH,
  graphaligner_ME_LR_25_MF,graphaligner_ME_LR_25_SH,graphaligner_ME_LR_50_MF,graphaligner_ME_LR_50_SH,graphaligner_ME_LR_75_MF,graphaligner_ME_LR_75_SH,
  graphaligner_ME_SR_100_MH,graphaligner_ME_SR_100_MS,graphaligner_ME_SR_25_MH,graphaligner_ME_SR_25_MS,
  graphaligner_ME_SR_50_MH,graphaligner_ME_SR_50_MS,graphaligner_ME_SR_75_MH,graphaligner_ME_SR_75_MS,
  graphaligner_RZ_LR_100_MF,graphaligner_RZ_LR_100_SH,graphaligner_RZ_LR_25_MF,graphaligner_RZ_LR_25_SH,graphaligner_RZ_LR_50_MF,graphaligner_RZ_LR_50_SH,
  graphaligner_RZ_LR_75_MF,graphaligner_RZ_LR_75_SH,graphaligner_RZ_SR_100_MH,graphaligner_RZ_SR_100_MS,graphaligner_RZ_SR_25_MH,graphaligner_RZ_SR_25_MS,
  graphaligner_RZ_SR_50_MH,graphaligner_RZ_SR_50_MS,graphaligner_RZ_SR_75_MH,graphaligner_RZ_SR_75_MS
)

write_csv(graphaligner_all,"final_results/graphaligner_all.csv")

rm(graphaligner_all)
rm(graphaligner_cols)

## pathracer

## 25% subsamples

pathracer_HC_SR_25_MS<-read_tsv("final_results/raw_out/pathracer/HC_SR_25_MS.txt")
pathracer_HC_SR_25_MS$graph<-"HC_SR_25_MS"

pathracer_HC_SR_25_MH<-read_tsv("final_results/raw_out/pathracer/HC_SR_25_MH.txt")
pathracer_HC_SR_25_MH$graph<-"HC_SR_25_MH"

pathracer_HC_LR_25_MF<-read_tsv("final_results/raw_out/pathracer/HC_LR_25_MF.txt")
pathracer_HC_LR_25_MF$graph<-"HC_LR_25_MF"

pathracer_LC_SR_25_MS<-read_tsv("final_results/raw_out/pathracer/LC_SR_25_MS.txt")
pathracer_LC_SR_25_MS$graph<-"LC_SR_25_MS"

pathracer_LC_SR_25_MH<-read_tsv("final_results/raw_out/pathracer/LC_SR_25_MH.txt")
pathracer_LC_SR_25_MH$graph<-"LC_SR_25_MH"

pathracer_LC_LR_25_MF<-read_tsv("final_results/raw_out/pathracer/LC_LR_25_MF.txt")
pathracer_LC_LR_25_MF$graph<-"LC_LR_25_MF"

pathracer_RZ_SR_25_MS<-read_tsv("final_results/raw_out/pathracer/RZ_SR_25_MS.txt")
pathracer_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

pathracer_RZ_SR_25_MH<-read_tsv("final_results/raw_out/pathracer/RZ_SR_25_MH.txt")
pathracer_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

pathracer_RZ_LR_25_MF<-read_tsv("final_results/raw_out/pathracer/RZ_LR_25_MF.txt")
pathracer_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

pathracer_ME_SR_25_MS<-read_tsv("final_results/raw_out/pathracer/ME_SR_25_MS.txt")
pathracer_ME_SR_25_MS$graph<-"ME_SR_25_MS"

pathracer_ME_SR_25_MH<-read_tsv("final_results/raw_out/pathracer/ME_SR_25_MH.txt")
pathracer_ME_SR_25_MH$graph<-"ME_SR_25_MH"

pathracer_ME_LR_25_MF<-read_tsv("final_results/raw_out/pathracer/ME_LR_25_MF.txt")
pathracer_ME_LR_25_MF$graph<-"ME_LR_25_MF"

## 50% subsamples

pathracer_HC_SR_50_MS<-read_tsv("final_results/raw_out/pathracer/HC_SR_50_MS.txt")
pathracer_HC_SR_50_MS$graph<-"HC_SR_50_MS"

pathracer_HC_SR_50_MH<-read_tsv("final_results/raw_out/pathracer/HC_SR_50_MH.txt")
pathracer_HC_SR_50_MH$graph<-"HC_SR_50_MH"

pathracer_HC_LR_50_MF<-read_tsv("final_results/raw_out/pathracer/HC_LR_50_MF.txt")
pathracer_HC_LR_50_MF$graph<-"HC_LR_50_MF"

pathracer_LC_SR_50_MS<-read_tsv("final_results/raw_out/pathracer/LC_SR_50_MS.txt")
pathracer_LC_SR_50_MS$graph<-"LC_SR_50_MS"

pathracer_LC_SR_50_MH<-read_tsv("final_results/raw_out/pathracer/LC_SR_50_MH.txt")
pathracer_LC_SR_50_MH$graph<-"LC_SR_50_MH"

pathracer_LC_LR_50_MF<-read_tsv("final_results/raw_out/pathracer/LC_LR_50_MF.txt")
pathracer_LC_LR_50_MF$graph<-"LC_LR_50_MF"

pathracer_RZ_SR_50_MS<-read_tsv("final_results/raw_out/pathracer/RZ_SR_50_MS.txt")
pathracer_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

pathracer_RZ_SR_50_MH<-read_tsv("final_results/raw_out/pathracer/RZ_SR_50_MH.txt")
pathracer_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

pathracer_RZ_LR_50_MF<-read_tsv("final_results/raw_out/pathracer/RZ_LR_50_MF.txt")
pathracer_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

pathracer_ME_SR_50_MS<-read_tsv("final_results/raw_out/pathracer/ME_SR_50_MS.txt")
pathracer_ME_SR_50_MS$graph<-"ME_SR_50_MS"

pathracer_ME_SR_50_MH<-read_tsv("final_results/raw_out/pathracer/ME_SR_50_MH.txt")
pathracer_ME_SR_50_MH$graph<-"ME_SR_50_MH"

pathracer_ME_LR_50_MF<-read_tsv("final_results/raw_out/pathracer/ME_LR_50_MF.txt")
pathracer_ME_LR_50_MF$graph<-"ME_LR_50_MF"

## 75% subsamples

pathracer_HC_SR_75_MS<-read_tsv("final_results/raw_out/pathracer/HC_SR_75_MS.txt")
pathracer_HC_SR_75_MS$graph<-"HC_SR_75_MS"

pathracer_HC_SR_75_MH<-read_tsv("final_results/raw_out/pathracer/HC_SR_75_MH.txt")
pathracer_HC_SR_75_MH$graph<-"HC_SR_75_MH"

pathracer_HC_LR_75_MF<-read_tsv("final_results/raw_out/pathracer/HC_LR_75_MF.txt")
pathracer_HC_LR_75_MF$graph<-"HC_LR_75_MF"

pathracer_LC_SR_75_MS<-read_tsv("final_results/raw_out/pathracer/LC_SR_75_MS.txt")
pathracer_LC_SR_75_MS$graph<-"LC_SR_75_MS"

pathracer_LC_SR_75_MH<-read_tsv("final_results/raw_out/pathracer/LC_SR_75_MH.txt")
pathracer_LC_SR_75_MH$graph<-"LC_SR_75_MH"

pathracer_LC_LR_75_MF<-read_tsv("final_results/raw_out/pathracer/LC_LR_75_MF.txt")
pathracer_LC_LR_75_MF$graph<-"LC_LR_75_MF"

pathracer_RZ_SR_75_MS<-read_tsv("final_results/raw_out/pathracer/RZ_SR_75_MS.txt")
pathracer_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

pathracer_RZ_SR_75_MH<-read_tsv("final_results/raw_out/pathracer/RZ_SR_75_MH.txt")
pathracer_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

pathracer_RZ_LR_75_MF<-read_tsv("final_results/raw_out/pathracer/RZ_LR_75_MF.txt")
pathracer_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

pathracer_ME_SR_75_MS<-read_tsv("final_results/raw_out/pathracer/ME_SR_75_MS.txt")
pathracer_ME_SR_75_MS$graph<-"ME_SR_75_MS"

pathracer_ME_SR_75_MH<-read_tsv("final_results/raw_out/pathracer/ME_SR_75_MH.txt")
pathracer_ME_SR_75_MH$graph<-"ME_SR_75_MH"

pathracer_ME_LR_75_MF<-read_tsv("final_results/raw_out/pathracer/ME_LR_75_MF.txt")
pathracer_ME_LR_75_MF$graph<-"ME_LR_75_MF"

## 100%

pathracer_HC_SR_100_MS<-read_tsv("final_results/raw_out/pathracer/HC_SR_100_MS.txt")
pathracer_HC_SR_100_MS$graph<-"HC_SR_100_MS"

pathracer_HC_SR_100_MH<-read_tsv("final_results/raw_out/pathracer/HC_SR_100_MH.txt")
pathracer_HC_SR_100_MH$graph<-"HC_SR_100_MH"

pathracer_HC_LR_100_MF<-read_tsv("final_results/raw_out/pathracer/HC_LR_100_MF.txt")
pathracer_HC_LR_100_MF$graph<-"HC_LR_100_MF"

pathracer_LC_SR_100_MS<-read_tsv("final_results/raw_out/pathracer/LC_SR_100_MS.txt")
pathracer_LC_SR_100_MS$graph<-"LC_SR_100_MS"

pathracer_LC_SR_100_MH<-read_tsv("final_results/raw_out/pathracer/LC_SR_100_MH.txt")
pathracer_LC_SR_100_MH$graph<-"LC_SR_100_MH"

pathracer_LC_LR_100_MF<-read_tsv("final_results/raw_out/pathracer/LC_LR_100_MF.txt")
pathracer_LC_LR_100_MF$graph<-"LC_LR_100_MF"

pathracer_RZ_SR_100_MS<-read_tsv("final_results/raw_out/pathracer/RZ_SR_100_MS.txt")
pathracer_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

pathracer_RZ_SR_100_MH<-read_tsv("final_results/raw_out/pathracer/RZ_SR_100_MH.txt")
pathracer_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

pathracer_RZ_LR_100_MF<-read_tsv("final_results/raw_out/pathracer/RZ_LR_100_MF.txt")
pathracer_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

pathracer_ME_SR_100_MS<-read_tsv("final_results/raw_out/pathracer/ME_SR_100_MS.txt")
pathracer_ME_SR_100_MS$graph<-"ME_SR_100_MS"

pathracer_ME_SR_100_MH<-read_tsv("final_results/raw_out/pathracer/ME_SR_100_MH.txt")
pathracer_ME_SR_100_MH$graph<-"ME_SR_100_MH"

pathracer_ME_LR_100_MF<-read_tsv("final_results/raw_out/pathracer/ME_LR_100_MF.txt")
pathracer_ME_LR_100_MF$graph<-"ME_LR_100_MF"

## combine and read out data


pathracer_all<-rbind(
  pathracer_HC_LR_100_MF,pathracer_HC_LR_25_MF,pathracer_HC_LR_50_MF,pathracer_HC_LR_75_MF,pathracer_HC_SR_100_MH,
  pathracer_HC_SR_100_MS,pathracer_HC_SR_25_MH,pathracer_HC_SR_25_MS,pathracer_HC_SR_50_MH,pathracer_HC_SR_50_MS,
  pathracer_HC_SR_75_MH,pathracer_HC_SR_75_MS,pathracer_LC_LR_100_MF,pathracer_LC_LR_25_MF,pathracer_LC_LR_50_MF,
  pathracer_LC_LR_75_MF,pathracer_LC_SR_100_MH,pathracer_LC_SR_100_MS,pathracer_LC_SR_25_MH,pathracer_LC_SR_25_MS,
  pathracer_LC_SR_50_MH,pathracer_LC_SR_50_MS,pathracer_LC_SR_75_MH,pathracer_LC_SR_75_MS,pathracer_ME_LR_100_MF,
  pathracer_ME_LR_25_MF,pathracer_ME_LR_50_MF,pathracer_ME_LR_75_MF,
  pathracer_ME_SR_100_MH,pathracer_ME_SR_100_MS,pathracer_ME_SR_25_MH,pathracer_ME_SR_25_MS,
  pathracer_ME_SR_50_MH,pathracer_ME_SR_50_MS,pathracer_ME_SR_75_MH,pathracer_ME_SR_75_MS,
  pathracer_RZ_LR_100_MF,pathracer_RZ_LR_25_MF,pathracer_RZ_LR_50_MF,
  pathracer_RZ_LR_75_MF,pathracer_RZ_SR_100_MH,pathracer_RZ_SR_100_MS,pathracer_RZ_SR_25_MH,pathracer_RZ_SR_25_MS,
  pathracer_RZ_SR_50_MH,pathracer_RZ_SR_50_MS,pathracer_RZ_SR_75_MH,pathracer_RZ_SR_75_MS
)

rm(
  pathracer_HC_LR_100_MF,pathracer_HC_LR_25_MF,pathracer_HC_LR_50_MF,pathracer_HC_LR_75_MF,pathracer_HC_SR_100_MH,
  pathracer_HC_SR_100_MS,pathracer_HC_SR_25_MH,pathracer_HC_SR_25_MS,pathracer_HC_SR_50_MH,pathracer_HC_SR_50_MS,
  pathracer_HC_SR_75_MH,pathracer_HC_SR_75_MS,pathracer_LC_LR_100_MF,pathracer_LC_LR_25_MF,pathracer_LC_LR_50_MF,
  pathracer_LC_LR_75_MF,pathracer_LC_SR_100_MH,pathracer_LC_SR_100_MS,pathracer_LC_SR_25_MH,pathracer_LC_SR_25_MS,
  pathracer_LC_SR_50_MH,pathracer_LC_SR_50_MS,pathracer_LC_SR_75_MH,pathracer_LC_SR_75_MS,pathracer_ME_LR_100_MF,
  pathracer_ME_LR_25_MF,pathracer_ME_LR_50_MF,pathracer_ME_LR_75_MF,
  pathracer_ME_SR_100_MH,pathracer_ME_SR_100_MS,pathracer_ME_SR_25_MH,pathracer_ME_SR_25_MS,
  pathracer_ME_SR_50_MH,pathracer_ME_SR_50_MS,pathracer_ME_SR_75_MH,pathracer_ME_SR_75_MS,
  pathracer_RZ_LR_100_MF,pathracer_RZ_LR_25_MF,pathracer_RZ_LR_50_MF,
  pathracer_RZ_LR_75_MF,pathracer_RZ_SR_100_MH,pathracer_RZ_SR_100_MS,pathracer_RZ_SR_25_MH,pathracer_RZ_SR_25_MS,
  pathracer_RZ_SR_50_MH,pathracer_RZ_SR_50_MS,pathracer_RZ_SR_75_MH,pathracer_RZ_SR_75_MS
)

write_csv(pathracer_all,"final_results/pathracer_all.csv")

rm(pathracer_all)

## SPAligner (will have bugs)

spaliner_cols<-c("query","aln_start_query","aln_end_query","aln_start_seg","aln_end_seg","query_length","path","aln_length_on_path","aligned_seqeunce")

## 25% subsamples

spaliner_HC_SR_25_MS<-read_tsv("final_results/raw_out/spaligner/HC_SR_25_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_25_MS$graph<-"HC_SR_25_MS"

spaliner_HC_SR_25_MH<-read_tsv("final_results/raw_out/spaligner/HC_SR_25_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_25_MH$graph<-"HC_SR_25_MH"

spaliner_HC_LR_25_MF<-read_tsv("final_results/raw_out/spaligner/HC_LR_25_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_25_MF$graph<-"HC_LR_25_MF"

spaliner_HC_LR_25_SH<-read_tsv("final_results/raw_out/spaligner/HC_LR_25_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_25_SH$graph<-"HC_LR_25_SH"

spaliner_LC_SR_25_MS<-read_tsv("final_results/raw_out/spaligner/LC_SR_25_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_25_MS$graph<-"LC_SR_25_MS"

spaliner_LC_SR_25_MH<-read_tsv("final_results/raw_out/spaligner/LC_SR_25_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_25_MH$graph<-"LC_SR_25_MH"

spaliner_LC_LR_25_MF<-read_tsv("final_results/raw_out/spaligner/LC_LR_25_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_25_MF$graph<-"LC_LR_25_MF"

spaliner_LC_LR_25_SH<-read_tsv("final_results/raw_out/spaligner/LC_LR_25_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_25_SH$graph<-"LC_LR_25_SH"

spaliner_RZ_SR_25_MS<-read_tsv("final_results/raw_out/spaligner/RZ_SR_25_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_25_MS$graph<-"RZ_SR_25_MS"

spaliner_RZ_SR_25_MH<-read_tsv("final_results/raw_out/spaligner/RZ_SR_25_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_25_MH$graph<-"RZ_SR_25_MH"

spaliner_RZ_LR_25_MF<-read_tsv("final_results/raw_out/spaligner/RZ_LR_25_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_25_MF$graph<-"RZ_LR_25_MF"

spaliner_RZ_LR_25_SH<-read_tsv("final_results/raw_out/spaligner/RZ_LR_25_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_25_SH$graph<-"RZ_LR_25_SH"

spaliner_ME_SR_25_MS<-read_tsv("final_results/raw_out/spaligner/ME_SR_25_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_25_MS$graph<-"ME_SR_25_MS"

spaliner_ME_SR_25_MH<-read_tsv("final_results/raw_out/spaligner/ME_SR_25_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_25_MH$graph<-"ME_SR_25_MH"

spaliner_ME_LR_25_MF<-read_tsv("final_results/raw_out/spaligner/ME_LR_25_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_25_MF$graph<-"ME_LR_25_MF"

spaliner_ME_LR_25_SH<-read_tsv("final_results/raw_out/spaligner/ME_LR_25_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_25_SH$graph<-"ME_LR_25_SH"

## 50% subsamples

spaliner_HC_SR_50_MS<-read_tsv("final_results/raw_out/spaligner/HC_SR_50_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_50_MS$graph<-"HC_SR_50_MS"

spaliner_HC_SR_50_MH<-read_tsv("final_results/raw_out/spaligner/HC_SR_50_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_50_MH$graph<-"HC_SR_50_MH"

spaliner_HC_LR_50_MF<-read_tsv("final_results/raw_out/spaligner/HC_LR_50_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_50_MF$graph<-"HC_LR_50_MF"

spaliner_HC_LR_50_SH<-read_tsv("final_results/raw_out/spaligner/HC_LR_50_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_50_SH$graph<-"HC_LR_50_SH"

spaliner_LC_SR_50_MS<-read_tsv("final_results/raw_out/spaligner/LC_SR_50_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_50_MS$graph<-"LC_SR_50_MS"

spaliner_LC_SR_50_MH<-read_tsv("final_results/raw_out/spaligner/LC_SR_50_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_50_MH$graph<-"LC_SR_50_MH"

spaliner_LC_LR_50_MF<-read_tsv("final_results/raw_out/spaligner/LC_LR_50_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_50_MF$graph<-"LC_LR_50_MF"

spaliner_LC_LR_50_SH<-read_tsv("final_results/raw_out/spaligner/LC_LR_50_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_50_SH$graph<-"LC_LR_50_SH"

spaliner_RZ_SR_50_MS<-read_tsv("final_results/raw_out/spaligner/RZ_SR_50_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_50_MS$graph<-"RZ_SR_50_MS"

spaliner_RZ_SR_50_MH<-read_tsv("final_results/raw_out/spaligner/RZ_SR_50_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_50_MH$graph<-"RZ_SR_50_MH"

spaliner_RZ_LR_50_MF<-read_tsv("final_results/raw_out/spaligner/RZ_LR_50_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_50_MF$graph<-"RZ_LR_50_MF"

spaliner_RZ_LR_50_SH<-read_tsv("final_results/raw_out/spaligner/RZ_LR_50_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_50_SH$graph<-"RZ_LR_50_SH"

spaliner_ME_SR_50_MS<-read_tsv("final_results/raw_out/spaligner/ME_SR_50_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_50_MS$graph<-"ME_SR_50_MS"

spaliner_ME_SR_50_MH<-read_tsv("final_results/raw_out/spaligner/ME_SR_50_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_50_MH$graph<-"ME_SR_50_MH"

spaliner_ME_LR_50_MF<-read_tsv("final_results/raw_out/spaligner/ME_LR_50_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_50_MF$graph<-"ME_LR_50_MF"

spaliner_ME_LR_50_SH<-read_tsv("final_results/raw_out/spaligner/ME_LR_50_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_50_SH$graph<-"ME_LR_50_SH"

## 75% subsamples

spaliner_HC_SR_75_MS<-read_tsv("final_results/raw_out/spaligner/HC_SR_75_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_75_MS$graph<-"HC_SR_75_MS"

spaliner_HC_SR_75_MH<-read_tsv("final_results/raw_out/spaligner/HC_SR_75_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_75_MH$graph<-"HC_SR_75_MH"

spaliner_HC_LR_75_MF<-read_tsv("final_results/raw_out/spaligner/HC_LR_75_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_75_MF$graph<-"HC_LR_75_MF"

spaliner_HC_LR_75_SH<-read_tsv("final_results/raw_out/spaligner/HC_LR_75_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_75_SH$graph<-"HC_LR_75_SH"

spaliner_LC_SR_75_MS<-read_tsv("final_results/raw_out/spaligner/LC_SR_75_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_75_MS$graph<-"LC_SR_75_MS"

spaliner_LC_SR_75_MH<-read_tsv("final_results/raw_out/spaligner/LC_SR_75_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_75_MH$graph<-"LC_SR_75_MH"

spaliner_LC_LR_75_MF<-read_tsv("final_results/raw_out/spaligner/LC_LR_75_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_75_MF$graph<-"LC_LR_75_MF"

spaliner_LC_LR_75_SH<-read_tsv("final_results/raw_out/spaligner/LC_LR_75_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_75_SH$graph<-"LC_LR_75_SH"

spaliner_RZ_SR_75_MS<-read_tsv("final_results/raw_out/spaligner/RZ_SR_75_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_75_MS$graph<-"RZ_SR_75_MS"

spaliner_RZ_SR_75_MH<-read_tsv("final_results/raw_out/spaligner/RZ_SR_75_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_75_MH$graph<-"RZ_SR_75_MH"

spaliner_RZ_LR_75_MF<-read_tsv("final_results/raw_out/spaligner/RZ_LR_75_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_75_MF$graph<-"RZ_LR_75_MF"

spaliner_RZ_LR_75_SH<-read_tsv("final_results/raw_out/spaligner/RZ_LR_75_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_75_SH$graph<-"RZ_LR_75_SH"

spaliner_ME_SR_75_MS<-read_tsv("final_results/raw_out/spaligner/ME_SR_75_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_75_MS$graph<-"ME_SR_75_MS"

spaliner_ME_SR_75_MH<-read_tsv("final_results/raw_out/spaligner/ME_SR_75_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_75_MH$graph<-"ME_SR_75_MH"

spaliner_ME_LR_75_MF<-read_tsv("final_results/raw_out/spaligner/ME_LR_75_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_75_MF$graph<-"ME_LR_75_MF"

spaliner_ME_LR_75_SH<-read_tsv("final_results/raw_out/spaligner/ME_LR_75_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_75_SH$graph<-"ME_LR_75_SH"

## 100%

spaliner_HC_SR_100_MS<-read_tsv("final_results/raw_out/spaligner/HC_SR_100_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_100_MS$graph<-"HC_SR_100_MS"

spaliner_HC_SR_100_MH<-read_tsv("final_results/raw_out/spaligner/HC_SR_100_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_SR_100_MH$graph<-"HC_SR_100_MH"

spaliner_HC_LR_100_MF<-read_tsv("final_results/raw_out/spaligner/HC_LR_100_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_100_MF$graph<-"HC_LR_100_MF"

spaliner_HC_LR_100_SH<-read_tsv("final_results/raw_out/spaligner/HC_LR_100_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_HC_LR_100_SH$graph<-"HC_LR_100_SH"

spaliner_LC_SR_100_MS<-read_tsv("final_results/raw_out/spaligner/LC_SR_100_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_100_MS$graph<-"LC_SR_100_MS"

spaliner_LC_SR_100_MH<-read_tsv("final_results/raw_out/spaligner/LC_SR_100_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_SR_100_MH$graph<-"LC_SR_100_MH"

spaliner_LC_LR_100_MF<-read_tsv("final_results/raw_out/spaligner/LC_LR_100_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_100_MF$graph<-"LC_LR_100_MF"

spaliner_LC_LR_100_SH<-read_tsv("final_results/raw_out/spaligner/LC_LR_100_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_LC_LR_100_SH$graph<-"LC_LR_100_SH"

spaliner_RZ_SR_100_MS<-read_tsv("final_results/raw_out/spaligner/RZ_SR_100_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_100_MS$graph<-"RZ_SR_100_MS"

spaliner_RZ_SR_100_MH<-read_tsv("final_results/raw_out/spaligner/RZ_SR_100_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_SR_100_MH$graph<-"RZ_SR_100_MH"

spaliner_RZ_LR_100_MF<-read_tsv("final_results/raw_out/spaligner/RZ_LR_100_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_100_MF$graph<-"RZ_LR_100_MF"

spaliner_RZ_LR_100_SH<-read_tsv("final_results/raw_out/spaligner/RZ_LR_100_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_RZ_LR_100_SH$graph<-"RZ_LR_100_SH"

spaliner_ME_SR_100_MS<-read_tsv("final_results/raw_out/spaligner/ME_SR_100_MS_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_100_MS$graph<-"ME_SR_100_MS"

spaliner_ME_SR_100_MH<-read_tsv("final_results/raw_out/spaligner/ME_SR_100_MH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_SR_100_MH$graph<-"ME_SR_100_MH"

spaliner_ME_LR_100_MF<-read_tsv("final_results/raw_out/spaligner/ME_LR_100_MF_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_100_MF$graph<-"ME_LR_100_MF"

spaliner_ME_LR_100_SH<-read_tsv("final_results/raw_out/spaligner/ME_LR_100_SH_spaliner.tsv", col_names = spaliner_cols)
spaliner_ME_LR_100_SH$graph<-"ME_LR_100_SH"

## combine and read out data
## NOTE order matters greatly for bug fixes below


spaliner_all<-rbind(
  spaliner_HC_LR_100_MF,spaliner_HC_LR_25_MF,spaliner_HC_LR_50_MF,spaliner_HC_LR_75_MF,spaliner_HC_SR_100_MH,
  spaliner_HC_SR_100_MS,spaliner_HC_SR_25_MH,spaliner_HC_SR_25_MS,spaliner_HC_SR_50_MH,spaliner_HC_SR_50_MS,
  spaliner_HC_SR_75_MH,spaliner_HC_SR_75_MS,spaliner_LC_LR_100_MF,spaliner_LC_LR_25_MF,spaliner_LC_LR_50_MF,
  spaliner_LC_LR_75_MF,spaliner_LC_SR_100_MH,spaliner_LC_SR_100_MS,spaliner_LC_SR_25_MH,spaliner_LC_SR_25_MS,
  spaliner_LC_SR_50_MH,spaliner_LC_SR_50_MS,spaliner_LC_SR_75_MH,spaliner_LC_SR_75_MS,spaliner_ME_LR_100_MF,
  spaliner_ME_LR_25_MF,spaliner_ME_LR_50_MF,spaliner_ME_LR_75_MF,spaliner_ME_SR_100_MH,spaliner_ME_SR_25_MH,
  spaliner_ME_SR_50_MH,spaliner_ME_SR_75_MH,spaliner_RZ_LR_100_MF,spaliner_RZ_LR_25_MF,spaliner_RZ_LR_50_MF,
  spaliner_RZ_LR_75_MF,spaliner_RZ_SR_100_MH,spaliner_RZ_SR_100_MS,spaliner_RZ_SR_25_MH,spaliner_RZ_SR_25_MS,
  spaliner_RZ_SR_50_MH,spaliner_RZ_SR_50_MS,spaliner_RZ_SR_75_MH,spaliner_RZ_SR_75_MS,spaliner_HC_LR_100_SH,spaliner_HC_LR_25_SH,
  spaliner_HC_LR_50_SH,spaliner_HC_LR_75_SH,spaliner_LC_LR_100_SH,spaliner_LC_LR_25_SH,spaliner_LC_LR_50_SH,spaliner_LC_LR_75_SH,
  spaliner_RZ_LR_100_SH,spaliner_RZ_LR_25_SH,spaliner_RZ_LR_50_SH,spaliner_RZ_LR_75_SH,spaliner_ME_LR_100_SH,spaliner_ME_LR_25_SH,
  spaliner_ME_LR_50_SH,spaliner_ME_LR_75_SH,spaliner_ME_SR_100_MS,spaliner_ME_SR_25_MS,spaliner_ME_SR_50_MS,spaliner_ME_SR_75_MS
)

rm(
  spaliner_HC_LR_100_MF,spaliner_HC_LR_25_MF,spaliner_HC_LR_50_MF,spaliner_HC_LR_75_MF,spaliner_HC_SR_100_MH,
  spaliner_HC_SR_100_MS,spaliner_HC_SR_25_MH,spaliner_HC_SR_25_MS,spaliner_HC_SR_50_MH,spaliner_HC_SR_50_MS,
  spaliner_HC_SR_75_MH,spaliner_HC_SR_75_MS,spaliner_LC_LR_100_MF,spaliner_LC_LR_25_MF,spaliner_LC_LR_50_MF,
  spaliner_LC_LR_75_MF,spaliner_LC_SR_100_MH,spaliner_LC_SR_100_MS,spaliner_LC_SR_25_MH,spaliner_LC_SR_25_MS,
  spaliner_LC_SR_50_MH,spaliner_LC_SR_50_MS,spaliner_LC_SR_75_MH,spaliner_LC_SR_75_MS,spaliner_ME_LR_100_MF,
  spaliner_ME_LR_25_MF,spaliner_ME_LR_50_MF,spaliner_ME_LR_75_MF,spaliner_ME_SR_100_MH,spaliner_ME_SR_25_MH,
  spaliner_ME_SR_50_MH,spaliner_ME_SR_75_MH,spaliner_RZ_LR_100_MF,spaliner_RZ_LR_25_MF,spaliner_RZ_LR_50_MF,
  spaliner_RZ_LR_75_MF,spaliner_RZ_SR_100_MH,spaliner_RZ_SR_100_MS,spaliner_RZ_SR_25_MH,spaliner_RZ_SR_25_MS,
  spaliner_RZ_SR_50_MH,spaliner_RZ_SR_50_MS,spaliner_RZ_SR_75_MH,spaliner_RZ_SR_75_MS,spaliner_HC_LR_100_SH,spaliner_HC_LR_25_SH,
  spaliner_HC_LR_50_SH,spaliner_HC_LR_75_SH,spaliner_LC_LR_100_SH,spaliner_LC_LR_25_SH,spaliner_LC_LR_50_SH,spaliner_LC_LR_75_SH,
  spaliner_RZ_LR_100_SH,spaliner_RZ_LR_25_SH,spaliner_RZ_LR_50_SH,spaliner_RZ_LR_75_SH,spaliner_ME_LR_100_SH,spaliner_ME_LR_25_SH,
  spaliner_ME_LR_50_SH,spaliner_ME_LR_75_SH,spaliner_ME_SR_100_MS,spaliner_ME_SR_25_MS,spaliner_ME_SR_50_MS,spaliner_ME_SR_75_MS
)

## bug fix attempts before writing out 

## calculate %QC
## remove data after columns in aln_start_query and aln_start_seg

spaliner_all$aln_start_query<-as.numeric(gsub("\\,.*","",spaliner_all$aln_start_query))
spaliner_all$aln_start_seg<-as.numeric(gsub("\\,.*","",spaliner_all$aln_start_seg))

spaliner_all<-spaliner_all%>%
  mutate(perc_query_cov = (aln_end_query - aln_start_query)/query_length)


## fix alignment length
#replace ; with , in alignment length on path

spaliner_all$aln_length_on_path<-gsub(";",",",spaliner_all$aln_length_on_path)

bugs<-spaliner_all%>%
  filter(str_detect(path,',') & str_detect(aln_length_on_path,',',negate = T))

#fix bugs, add commas in bugs$aln_length_on_path 

bugs[1,7]
bugs[1,8]
spaliner_all[grep(bugs[1,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"380,345"

bugs[2,7]
bugs[2,8]
spaliner_all[grep(bugs[2,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"740,326"

bugs[3,7]
bugs[3,8]
spaliner_all[grep(bugs[3,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"209,362"

bugs[4,7]
bugs[4,8]
spaliner_all[grep(bugs[4,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"965,984"

bugs[5,7]
bugs[5,8]
spaliner_all[grep(bugs[5,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"966,982"

bugs[6,7]
bugs[6,8]
spaliner_all[grep(bugs[6,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"966,981"

bugs[7,7]
bugs[7,8]
spaliner_all[grep(bugs[7,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"966,981"

bugs[8,7]
bugs[8,8]
spaliner_all[grep(bugs[8,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"207,3088"

bugs[9,7]
bugs[9,8]
spaliner_all[grep(bugs[9,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"867,997"

bugs[10,7]
bugs[10,8]
spaliner_all[grep(bugs[10,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"868,995"

bugs[11,7]
bugs[11,8]
spaliner_all[grep(bugs[11,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"868,994"

bugs[12,7]
bugs[12,8]
spaliner_all[grep(bugs[12,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"868,994"

bugs[13,7]
bugs[13,8]
spaliner_all[grep(bugs[13,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"502,248,568"

bugs[14,7]
bugs[14,8]
spaliner_all[grep(bugs[14,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"619,230,375,92,552"

bugs[15,7]
bugs[15,8]
spaliner_all[grep(bugs[15,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"213,212,2559"

bugs[16,7]
bugs[16,8]
spaliner_all[grep(bugs[16,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"452,1039"

bugs[17,7]
bugs[17,8]
spaliner_all[grep(bugs[17,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"977,300"

bugs[18,7]
bugs[18,8]
spaliner_all[grep(bugs[18,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"761,101"

bugs[19,7]
bugs[19,8]
spaliner_all[grep(bugs[19,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"144,1281"

bugs[20,7]
bugs[20,8]
spaliner_all[grep(bugs[20,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"343,394"

bugs[21,7]
bugs[21,8]
spaliner_all[grep(bugs[21,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"343,464"

bugs[22,7]
bugs[22,8]
spaliner_all[grep(bugs[22,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"620,104"

bugs[23,7]
bugs[23,8]
spaliner_all[grep(bugs[23,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"208,522,269,287,139"

bugs[24,7]
bugs[24,8]
spaliner_all[grep(bugs[24,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"115,948"

bugs[25,7]
bugs[25,8]
spaliner_all[grep(bugs[25,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"796,31"

bugs[26,7]
bugs[26,8]
spaliner_all[grep(bugs[26,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"591,520,104,70"

bugs[27,7]
bugs[27,8]
spaliner_all[grep(bugs[27,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"931,844,91"

bugs[28,7]
bugs[28,8]
spaliner_all[grep(bugs[28,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"1467,2102"

bugs[29,7]
bugs[29,8]
spaliner_all[grep(bugs[29,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"133,3678"

bugs[30,7]
bugs[30,8]
spaliner_all[grep(bugs[30,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"551,281"

bugs[31,7]
bugs[31,8]
spaliner_all[grep(bugs[31,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"114,948"

bugs[32,7]
bugs[32,8]
spaliner_all[grep(bugs[32,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"518,117,220,216"

bugs[33,7]
bugs[33,8]
spaliner_all[grep(bugs[33,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"609,228,101,230"

bugs[34,7]
bugs[34,8]
spaliner_all[grep(bugs[34,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"98,714"

bugs[35,7]
bugs[35,8]
spaliner_all[grep(bugs[35,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"540,402,141,479,94,600"

bugs[36,7]
bugs[36,8]
spaliner_all[grep(bugs[36,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"183,130,120,693,140,352"

bugs[37,7]
bugs[37,8]
spaliner_all[grep(bugs[37,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"624,175"

bugs[38,7]
bugs[38,8]
spaliner_all[grep(bugs[38,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"270,1272"

bugs[39,7]
bugs[39,8]
spaliner_all[grep(bugs[39,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"590,259"

bugs[40,7]
bugs[40,8]
spaliner_all[grep(bugs[40,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"366,328,43,273"

bugs[41,7]
bugs[41,8]
spaliner_all[grep(bugs[41,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"572,417,538"

bugs[42,7]
bugs[42,8]
spaliner_all[grep(bugs[42,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"142,3380,1401"

bugs[43,7]
bugs[43,8]
spaliner_all[grep(bugs[43,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"160,126,965"

bugs[44,7]
bugs[44,8]
spaliner_all[grep(bugs[44,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"132,1102,272"

bugs[45,7]
bugs[45,8]
spaliner_all[grep(bugs[45,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"276,963"

bugs[46,7]
bugs[46,8]
spaliner_all[grep(bugs[46,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"663,415,307,307,75"

bugs[47,7]
bugs[47,8]
spaliner_all[grep(bugs[47,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"815,911,424,73"

bugs[48,7]
bugs[48,8]
spaliner_all[grep(bugs[48,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"818,499"

bugs[49,7]
bugs[49,8]
spaliner_all[grep(bugs[49,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"721,217"

bugs[50,7]
bugs[50,8]
spaliner_all[grep(bugs[50,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"508,621,282"

bugs[51,7]
bugs[51,8]
spaliner_all[grep(bugs[51,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"129,61,11,605"

bugs[52,7]
bugs[52,8]
spaliner_all[grep(bugs[52,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"199,36,86"

bugs[53,7]
bugs[53,8]
spaliner_all[grep(bugs[53,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"186,1131"

bugs[54,7]
bugs[54,8]
spaliner_all[grep(bugs[54,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"186,1131"

bugs[55,7]
bugs[55,8]
spaliner_all[grep(bugs[55,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"226646,767643"

bugs[56,7]
bugs[56,8]
spaliner_all[grep(bugs[56,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"253,959"

bugs[57,7]
bugs[57,8]
spaliner_all[grep(bugs[57,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"737,58,432"

bugs[58,7]
bugs[58,8]
spaliner_all[grep(bugs[58,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"146,76,13,32"

bugs[59,7]
bugs[59,8]
spaliner_all[grep(bugs[59,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"263,22,78"

bugs[60,7]
bugs[60,8]
spaliner_all[grep(bugs[60,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"173,688,1270"

bugs[61,7]
bugs[61,8]
spaliner_all[grep(bugs[61,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"183,313,349,591,21,46"

bugs[62,7]
bugs[62,8]
spaliner_all[grep(bugs[62,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"267,428,49"

bugs[63,7]
bugs[63,8]
spaliner_all[grep(bugs[63,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"173,688,1365"

bugs[64,7]
bugs[64,8]
spaliner_all[grep(bugs[64,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"242,972,235,103,86"

bugs[65,7]
bugs[65,8]
spaliner_all[grep(bugs[65,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"273,610,365"

bugs[66,7]
bugs[66,8]
spaliner_all[grep(bugs[66,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"856,282,206"

bugs[67,7]
bugs[67,8]
spaliner_all[grep(bugs[67,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"222,257"

bugs[68,7]
bugs[68,8]
spaliner_all[grep(bugs[68,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"202,527,105"

bugs[69,7]
bugs[69,8]
spaliner_all[grep(bugs[69,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"253,959"

bugs[70,7]
bugs[70,8]
spaliner_all[grep(bugs[70,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"116,1261"

bugs[71,7]
bugs[71,8]
spaliner_all[grep(bugs[71,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"146,76,13,32"

bugs[72,7]
bugs[72,8]
spaliner_all[grep(bugs[72,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"1161,261"

bugs[73,7]
bugs[73,8]
spaliner_all[grep(bugs[73,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"102,937,353"

bugs[74,7]
bugs[74,8]
spaliner_all[grep(bugs[74,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"727,556,82"

bugs[75,7]
bugs[75,8]
spaliner_all[grep(bugs[75,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"85,601,295"

bugs[76,7]
bugs[76,8]
spaliner_all[grep(bugs[76,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"596,714,91"

bugs[77,7]
bugs[77,8]
spaliner_all[grep(bugs[77,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"872,122,239"

bugs[78,7]
bugs[78,8]
spaliner_all[grep(bugs[78,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"453,279,95"

bugs[79,7]
bugs[79,8]
spaliner_all[grep(bugs[79,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"862,162,233"

bugs[80,7]
bugs[80,8]
spaliner_all[grep(bugs[80,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"200,515,1130"

bugs[81,7]
bugs[81,8]
spaliner_all[grep(bugs[81,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"228,40,349"

bugs[82,7]
bugs[82,8]
spaliner_all[grep(bugs[82,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"307,217,100"

bugs[83,7]
bugs[83,8]
spaliner_all[grep(bugs[83,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"242,972,235,103,86"

bugs[84,7]
bugs[84,8]
spaliner_all[grep(bugs[84,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"448,272,261,103,65"

bugs[85,7]
bugs[85,8]
spaliner_all[grep(bugs[85,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"183,313,349,27,37"

bugs[86,7]
bugs[86,8]
spaliner_all[grep(bugs[86,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"168,702,94,28,49"

bugs[87,7]
bugs[87,8]
spaliner_all[grep(bugs[87,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"841,37,409"

bugs[88,7]
bugs[88,8]
spaliner_all[grep(bugs[88,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"856,282,206"

bugs[89,7]
bugs[89,8]
spaliner_all[grep(bugs[89,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"222,268"

bugs[90,7]
bugs[90,8]
spaliner_all[grep(bugs[90,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"253,959"

bugs[91,7]
bugs[91,8]
spaliner_all[grep(bugs[91,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"146,76,13,32"

bugs[92,7]
bugs[92,8]
spaliner_all[grep(bugs[92,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"277,478,85"

bugs[93,7]
bugs[93,8]
spaliner_all[grep(bugs[93,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"258,581,673"

bugs[94,7]
bugs[94,8]
spaliner_all[grep(bugs[94,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"129,929,121"

bugs[95,7]
bugs[95,8]
spaliner_all[grep(bugs[95,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"116,93,895"

bugs[96,7]
bugs[96,8]
spaliner_all[grep(bugs[96,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"211,654,908"

bugs[97,7]
bugs[97,8]
spaliner_all[grep(bugs[97,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"727,556,82"

bugs[98,7]
bugs[98,8]
spaliner_all[grep(bugs[98,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"872,122,239"

bugs[99,7]
bugs[99,8]
spaliner_all[grep(bugs[99,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"263,22,78"

bugs[100,7]
bugs[100,8]
spaliner_all[grep(bugs[100,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"200,515,1130"

bugs[101,7]
bugs[101,8]
spaliner_all[grep(bugs[101,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"173,688,1270"

bugs[102,7]
bugs[102,8]
spaliner_all[grep(bugs[102,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"173,688,1365"

bugs[103,7]
bugs[103,8]
spaliner_all[grep(bugs[103,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"242,959,133,919,610,400"

bugs[104,7]
bugs[104,8]
spaliner_all[grep(bugs[104,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"273,610,365"

bugs[105,7]
bugs[105,8]
spaliner_all[grep(bugs[105,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"841,37,409"

bugs[106,7]
bugs[106,8]
spaliner_all[grep(bugs[106,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"32,149,77"

bugs[107,7]
bugs[107,8]
spaliner_all[grep(bugs[107,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"259,715,262,82,206"

bugs[108,7]
bugs[108,8]
spaliner_all[grep(bugs[108,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"183,313,349,27,37"

bugs[109,7]
bugs[109,8]
spaliner_all[grep(bugs[109,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"267,42,849"

bugs[110,7]
bugs[110,8]
spaliner_all[grep(bugs[110,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"100,69,302"

bugs[111,7]
bugs[111,8]
spaliner_all[grep(bugs[111,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"222,257"

bugs[112,7]
bugs[112,8]
spaliner_all[grep(bugs[112,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"202,527,105"

bugs[113,7]
bugs[113,8]
spaliner_all[grep(bugs[113,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"860,366,34,50"

bugs[114,7]
bugs[114,8]
spaliner_all[grep(bugs[114,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"174,1495"

bugs[115,7]
bugs[115,8]
spaliner_all[grep(bugs[115,8],spaliner_all$aln_length_on_path),"aln_length_on_path"]<-"525,668"

#check for remainders 
spaliner_all%>%
  filter(str_detect(path,',') & str_detect(aln_length_on_path,',',negate = T))%>%
  nrow()

#sum each cell with multiple entries
for (i in grep(",",spaliner_all$aln_length_on_path)) {
  X<-as.numeric(as.vector(str_split(spaliner_all[i,8],",")[[1]]))%>%sum()
  spaliner_all[i,8]<-as.character(X)
}

spaliner_all$aln_length_on_path<-as.numeric(spaliner_all$aln_length_on_path)

## fix bugs in aln_end_seg column 

spaliner_bugs<-spaliner_all%>%
  filter(perc_query_cov>1)

spaliner_bugs<-spaliner_bugs%>%
  mutate(aln_end_seg = aln_length_on_path+aln_start_seg)

spaliner_all<-spaliner_all%>%
  filter(perc_query_cov<=1)%>%
  rbind(spaliner_bugs)

## write out spaliner

write_csv(spaliner_all,"final_results/spaliner_all.csv")

























