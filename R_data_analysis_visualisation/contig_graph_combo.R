## MUST BE RUN AFTER BINARY ACCURACY SCRIPTS

## SR_100 graphaligner and contigs combo 

combo_class<-classifications%>%
    select(ARO_name,ARO_accession,AMR_gene_family,
           actual_HC_classification,actual_LC_classification,actual_RZ_classification,actual_ME_classification,
           GA_HC_SR_100_MS_0.5_0.5,CON_HC_SR_100_MS_0.5_0.5,
           GA_LC_SR_100_MS_0.5_0.9,CON_LC_SR_100_MS_0.5_0.5,
           GA_RZ_SR_100_MS_0.8_0.5,CON_RZ_SR_100_MS_0.5_0.5,
           GA_ME_SR_100_MS_0.5_0.5,CON_ME_SR_100_MS_0.5_0.5
           )

combo_class<-combo_class%>%
  mutate(CONGA_HC_SR_100_MS=case_when(
    GA_HC_SR_100_MS_0.5_0.5>CON_HC_SR_100_MS_0.5_0.5 ~ GA_HC_SR_100_MS_0.5_0.5,
    CON_HC_SR_100_MS_0.5_0.5>=GA_HC_SR_100_MS_0.5_0.5 ~ CON_HC_SR_100_MS_0.5_0.5
  ))

combo_class<-combo_class%>%
  mutate(CONGA_LC_SR_100_MS=case_when(
    GA_LC_SR_100_MS_0.5_0.9>CON_LC_SR_100_MS_0.5_0.5 ~ GA_LC_SR_100_MS_0.5_0.9,
    CON_LC_SR_100_MS_0.5_0.5>=GA_LC_SR_100_MS_0.5_0.9 ~ CON_LC_SR_100_MS_0.5_0.5
  ))

combo_class<-combo_class%>%
  mutate(CONGA_RZ_SR_100_MS=case_when(
    GA_RZ_SR_100_MS_0.8_0.5>CON_RZ_SR_100_MS_0.5_0.5 ~ GA_RZ_SR_100_MS_0.8_0.5,
    CON_RZ_SR_100_MS_0.5_0.5>=GA_RZ_SR_100_MS_0.8_0.5 ~ CON_RZ_SR_100_MS_0.5_0.5
  ))

combo_class<-combo_class%>%
  mutate(CONGA_ME_SR_100_MS=case_when(
    GA_ME_SR_100_MS_0.5_0.5>CON_ME_SR_100_MS_0.5_0.5 ~ GA_ME_SR_100_MS_0.5_0.5,
    CON_ME_SR_100_MS_0.5_0.5>=GA_ME_SR_100_MS_0.5_0.5 ~ CON_ME_SR_100_MS_0.5_0.5
  ))

#calculate TPs

combo_tl<-c("GA","CON","CONGA")

for (tool in combo_tl) {
  for (data_type in c("HC","LC","RZ","ME")) {
    combo_class<-tps_function(tool,data_type,combo_class)
  }
}

# calculate precision and recall 
PR_conga<-tibble()
for (tool in combo_tl) {
  tmp<-calculate_PR(tool,combo_class)
  PR_conga<-rbind(PR_conga,tmp)
}

## add reads

top_reads<-top_PR%>%
  filter(tool=="READS" & subsample_perc==100 & read_type=="Short Read")

#plot PR for CON, reads, GA, and CONGA

## expand dat 

PR_conga<-PR_conga%>%
  separate_wider_delim(dat,"_",names = c("tool","data_type","read_type","subsample_perc","assembler","perc_ID","perc_query_coverage"),too_few = "align_start")

PR_conga<-rbind(PR_conga,top_reads%>%select(-cuttoffs,-f_score))

PR_conga$data_type<-gsub("HC","High Complexity",PR_conga$data_type)
PR_conga$data_type<-gsub("LC","Low Complexity",PR_conga$data_type)
PR_conga$data_type<-gsub("RZ","Real Zymbiomics",PR_conga$data_type)
PR_conga$data_type<-gsub("ME","Mobile Element",PR_conga$data_type)

#PR_conga$assembler<-gsub("MH","Megahit",PR_conga$assembler)
PR_conga$assembler<-gsub("MS","MetaSPAdes",PR_conga$assembler)

PR_conga$read_type<-gsub("SR","Short Read",PR_conga$read_type)

PR_conga$tool<-gsub("CONGA","RGI on Contigs and GraphAligner",PR_conga$tool)
PR_conga$tool<-gsub("GA","GraphAligner",PR_conga$tool)
PR_conga$tool<-gsub("CON","RGI on Contigs",PR_conga$tool)
PR_conga$tool<-gsub("READS","RGI-BWT",PR_conga$tool)

PR_conga%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_wrap(~data_type)+
  scale_colour_manual(values = c("#7570b3","#a6761d","red","#666666"),name="Tool")+
  labs(x="Recall",y="Precision",shape="Assembler")
  




## LR_100 graphaligner and contigs combo 

combo_class_LR<-classifications%>%
  select(ARO_name,ARO_accession,AMR_gene_family,
         actual_HC_classification,actual_LC_classification,actual_RZ_classification,actual_ME_classification,
         GA_HC_LR_100_MF_0.5_0.5,CON_HC_LR_100_MF_0.5_0.5,
         GA_LC_LR_100_MF_0.5_0.9,CON_LC_LR_100_MF_0.5_0.5,
         GA_RZ_LR_100_MF_0.8_0.5,CON_RZ_LR_100_MF_0.5_0.5,
         GA_ME_LR_100_MF_0.5_0.5,CON_ME_LR_100_MF_0.5_0.5
  )

combo_class_LR<-combo_class_LR%>%
  mutate(CONGA_HC_LR_100_MF=case_when(
    GA_HC_LR_100_MF_0.5_0.5>CON_HC_LR_100_MF_0.5_0.5 ~ GA_HC_LR_100_MF_0.5_0.5,
    CON_HC_LR_100_MF_0.5_0.5>=GA_HC_LR_100_MF_0.5_0.5 ~ CON_HC_LR_100_MF_0.5_0.5
  ))

combo_class_LR<-combo_class_LR%>%
  mutate(CONGA_LC_LR_100_MF=case_when(
    GA_LC_LR_100_MF_0.5_0.9>CON_LC_LR_100_MF_0.5_0.5 ~ GA_LC_LR_100_MF_0.5_0.9,
    CON_LC_LR_100_MF_0.5_0.5>=GA_LC_LR_100_MF_0.5_0.9 ~ CON_LC_LR_100_MF_0.5_0.5
  ))

combo_class_LR<-combo_class_LR%>%
  mutate(CONGA_RZ_LR_100_MF=case_when(
    GA_RZ_LR_100_MF_0.8_0.5>CON_RZ_LR_100_MF_0.5_0.5 ~ GA_RZ_LR_100_MF_0.8_0.5,
    CON_RZ_LR_100_MF_0.5_0.5>=GA_RZ_LR_100_MF_0.8_0.5 ~ CON_RZ_LR_100_MF_0.5_0.5
  ))

combo_class_LR<-combo_class_LR%>%
  mutate(CONGA_ME_LR_100_MF=case_when(
    GA_ME_LR_100_MF_0.5_0.5>CON_ME_LR_100_MF_0.5_0.5 ~ GA_ME_LR_100_MF_0.5_0.5,
    CON_ME_LR_100_MF_0.5_0.5>=GA_ME_LR_100_MF_0.5_0.5 ~ CON_ME_LR_100_MF_0.5_0.5
  ))

#calculate TPs

combo_tl<-c("GA","CON","CONGA")

for (tool in combo_tl) {
  for (data_type in c("HC","LC","RZ","ME")) {
    combo_class_LR<-tps_function(tool,data_type,combo_class_LR)
  }
}

# calculate precision and recall 
PR_conga_LR<-tibble()
for (tool in combo_tl) {
  tmp<-calculate_PR(tool,combo_class_LR)
  PR_conga_LR<-rbind(PR_conga_LR,tmp)
}

## add reads

top_reads<-top_PR%>%
  filter(tool=="READS" & subsample_perc==100 & read_type=="Long Read")

#plot PR for CON, reads, GA, and CONGA

## expand dat 

PR_conga_LR<-PR_conga_LR%>%
  separate_wider_delim(dat,"_",names = c("tool","data_type","read_type","subsample_perc","assembler","perc_ID","perc_query_coverage"),too_few = "align_start")

PR_conga_LR<-rbind(PR_conga_LR,top_reads%>%select(-cuttoffs,-f_score))

PR_conga_LR$data_type<-gsub("HC","High Complexity",PR_conga_LR$data_type)
PR_conga_LR$data_type<-gsub("LC","Low Complexity",PR_conga_LR$data_type)
PR_conga_LR$data_type<-gsub("RZ","Real Zymbiomics",PR_conga_LR$data_type)
PR_conga_LR$data_type<-gsub("ME","Mobile Element",PR_conga_LR$data_type)

PR_conga_LR$assembler<-gsub("MF","MetaFlye",PR_conga_LR$assembler)

PR_conga_LR$read_type<-gsub("LR","Long Read",PR_conga_LR$read_type)

PR_conga_LR$tool<-gsub("CONGA","RGI on Contigs and GraphAligner",PR_conga_LR$tool)
PR_conga_LR$tool<-gsub("GA","GraphAligner",PR_conga_LR$tool)
PR_conga_LR$tool<-gsub("CON","RGI on Contigs",PR_conga_LR$tool)
PR_conga_LR$tool<-gsub("READS","minimap2",PR_conga_LR$tool)

PR_conga_LR%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_wrap(~data_type)+
  scale_colour_manual(values = c("#7570b3","#666666","#a6761d","red"),name="Tool")+
  labs(x="Recall",y="Precision",shape="Assembler")



##combine both 

PR_combine<-rbind(PR_conga,PR_conga_LR)

PR_combine$data_type<-factor(PR_combine$data_type,levels = c("High Complexity","Mobile Element","Low Complexity","Real Zymbiomics"))



PR_combine%>%
  ggplot(aes(x=recall,y=precision,colour = tool))+
  geom_point(aes(shape=assembler),size=4)+
  facet_grid(read_type~data_type)+
  scale_colour_manual(values = c("#7570b3","#666666","#a6761d","red","#666666"),name="Tool")+
  labs(x="Recall",y="Precision",shape="Assembler")+
  scale_shape_manual(values = c(15,17,18))+
  xlim(0,1)+
  theme(text = element_text(size = 20))






