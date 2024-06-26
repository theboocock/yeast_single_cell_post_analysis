source("pipeline/plate_reader_utils.R")
conditions = "data/plate_reader/gal_mutants_glu_feb2019_conditions.csv"
#gpa_validation_folder = "/media/theboocock/Data/Dropbox/Postdoc/projects/gpa_validation/"

gpa_validation_folder = "data/plate_reader/gpa_validation"
#glue("{gpa_validation_folder}/")


add_labels_laura_strains2 = function(ypd_growth){
  ypd_growth$df$ind2=as.character(ypd_growth$df$ind)
  ypd_growth$df$ind2[ypd_growth$df$ind == "416_GLU"] = "WT"
  ypd_growth$df$ind2[ypd_growth$df$ind == "417_GLU"] = "WT"
  ypd_growth$df$ind2[ypd_growth$df$ind == "420_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "421_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "422_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "423_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "424_GLU"] = "469I"
  ypd_growth$df$ind2[ypd_growth$df$ind == "425_GLU"] = "469I"
  return(ypd_growth)
}

add_labels_laura_strains = function(ypd_growth){
  ypd_growth$df$ind2=as.character(ypd_growth$df$ind)
  print(ypd_growth$df$ind2 == "1_GLU")
  ypd_growth$df$ind2[ypd_growth$df$ind == "1_GLU"] = "469I"
  ypd_growth$df$ind2[ypd_growth$df$ind == "2_GLU"] = "WT"
  ypd_growth$df$ind2[ypd_growth$df$ind == "3_GLU"] = "469I 82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "4_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "5_GLU"] = "82R"
  ypd_growth$df$ind2[ypd_growth$df$ind == "6_GLU"] = "469I 82R"
  print(ypd_growth$df$ind2)
  
  return(ypd_growth)
}



samples1 = glue("{gpa_validation_folder}/plate_leslie_july23/samples.csv")
#mutant_pheno=  "/media/theboocock/Data/Dropbox/PHDTHESIS/projects/gal_final_github_october/ext/data/gal_mutant_pheno_nov.csv" 

plate1 = glue("{gpa_validation_folder}/plate_leslie_july23/072423_Plate1.csv")
plate2 = glue("{gpa_validation_folder}/plate_leslie_july23/072423_Plate2.csv")
plate3 = glue("{gpa_validation_folder}/plate_leslie_july28/plate1.csv")
plate4 = glue("{gpa_validation_folder}/plate_leslie_july28/plate2.csv")

ypd_growth1 = add_labels_laura_strains2(process_phenotype_plates(plate1, conditions, samples1))
ypd_growth2 = add_labels_laura_strains2(process_phenotype_plates(plate2, conditions, samples1))

ypd_growth3 = add_labels_laura_strains2(process_phenotype_plates(plate3, conditions, samples1))
ypd_growth4 = add_labels_laura_strains2(process_phenotype_plates(plate4, conditions, samples1))



samples2= glue("{gpa_validation_folder}/lwm_samples.csv")

plate5 = glue("{gpa_validation_folder}/ypd_1_13.csv")
plate6 = glue("{gpa_validation_folder}/ypd_1_18.csv")
plate7 = glue("{gpa_validation_folder}/ypd_1_23_lidonly.csv")


ypd_growth5 = add_labels_laura_strains(process_phenotype_plates(plate5, conditions, samples2))
ypd_growth6 = add_labels_laura_strains(process_phenotype_plates(plate6, conditions, samples2))
ypd_growth7 = add_labels_laura_strains(process_phenotype_plates(plate7, conditions, samples2))

plate5 = ypd_growth5$df %>% filter(values > 0.07 & values < 0.085) %>% dplyr::select(ind2,values, doubling) %>%  dplyr::rename(ID=ind2)
plate5$plate = "Laura 1_13_23"
plate6 = ypd_growth6$df %>% dplyr::select(ind2,values, doubling)%>%  dplyr::rename(ID=ind2)
plate6$plate = "Laura 1_18_23"
plate7 = ypd_growth7$df %>% filter(values > 0.07 & values < 0.085)%>% dplyr::select(ind2,values, doubling)%>%  dplyr::rename(ID=ind2)
plate7$plate= "Laura 1_23_23"
plate1 = ypd_growth1$df %>% filter(values > 0.07 & values < 0.085) %>% dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
plate1$plate = "Leslie 1 7_26_23"
plate2 =  ypd_growth2$df %>% filter(values > 0.07 & values < 0.085) %>%  dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
plate2$plate = "Leslie 2 7_26_23"
plate3 = ypd_growth3$df%>%  filter(values > 0.07 & values < 0.085) %>% dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
plate3$plate = "Leslie 1 7_28_23"
plate4 = ypd_growth4$df%>%  filter(values > 0.07 & values < 0.085) %>% dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
plate4$plate = "Leslie 2 7_28_23"


#plate5 = ypd_growth5$df  %>% dplyr::select(ind2,values, doubling) %>%  dplyr::rename(ID=ind2)
#plate5$plate = "Laura 1_13_23"
#plate6 = ypd_growth6$df %>% dplyr::select(ind2,values, doubling)%>%  dplyr::rename(ID=ind2)
#plate6$plate = "Laura 1_18_23"
#plate7 = ypd_growth7$df %>% dplyr::select(ind2,values, doubling)%>%  dplyr::rename(ID=ind2)
#plate7$plate= "Laura 1_23_23"
#plate1 = ypd_growth1$df %>% dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
#plate1$plate = "Leslie 1 7_26_23"
#plate2 =  ypd_growth2$df %>%  dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
#plate2$plate = "Leslie 2 7_26_23"
#plate3 = ypd_growth3$df%>%  dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
#plate3$plate = "Leslie 1 7_28_23"
#plate4 = ypd_growth4$df%>% dplyr::select(ind2,values,doubling) %>% dplyr::rename(ID=ind2)
#plate4$plate = "Leslie 2 7_28_23"



p_m = rbind(plate1,plate2,plate3,plate4,plate5,plate6,plate7) #%>% ggplot(aes(y=))
p_m = p_m %>% filter(ID != "469I 82R")
m_resid = residuals(lm((p_m$doubling) ~ p_m$plate))
p_m$resid = m_resid + 0.4519579

p_m$strain_new = factor(p_m$ID, levels=c("WT","82R","469I"))
#mycomparsions = list(c("WT","82R"),c("82R","469I"),c("WT","469I"))#
#pa = p_m %>% mutate(plate_l = grepl("Les",plate)) %>% 
#  ggplot(aes(y=resid,x=strain_new)) + geom_boxplot() + geom_jitter(width=0.2) + theme_bw() + ylab("Doublings per hour") + xlab("Strain")  + theme(text=element_text(size=18)) +
#  stat_compare_means(comparisons = mycomparsions,method="t.test",size=8) 
#list(pairs_m=p_m,)
#m1 = (lm((p_m$doubling) ~ p_m$ID + p_m$plate))

#library(emmeans)
#em = emmeans::emmeans(m1,specs=~ID)
#pairs(em)
#p#ypd_growth1$


mating1 = read.csv("data/mating1.csv")
mating2=read.csv("data/mating2.csv")


mating1$exp = 1
mating2$exp = 2
mating_df = rbind(mating1,mating2)
s1 = unlist(lapply(str_split(mating_df$Strain," "), function(x){x[1]}))
s2 = unlist(lapply(str_split(mating_df$Strain," "), function(x){x[2]}))
blue = grepl("B",s1)
red = grepl("R",s1)

s1 = str_replace_all(s1,"R|B","")
s2 = str_replace_all(s2,"R|B","")


mating_df= mating_df%>% mutate(blue_strain = ifelse(blue,s1,s2))
mating_df=  mating_df %>% mutate(red_strain = ifelse(red,s1,s2))

mating_df$strain2 = factor(mating_df$Strain,levels=c("416B 420R","416R 420B","416B 424R","416R 424B","420B 424R","420R 424B"))

mating_df$expr = c(rep(1,12),rep(2,12),rep(3,12),rep(4,12),rep(5,12))
aa  = data.frame()
mating_df$XX = residuals(lm(mating_df$X ~ mating_df$color))
for(j in unique(mating_df$expr)){
  print(j)
  b = mating_df %>% filter(expr == j & color=="red")
  norm = mean(b$XX[which(b$red_strain == "416")])
  b$norm = b$XX - norm + 100
  b$strain = b$red_strain
  b$color2 = "red"
  aa = rbind(aa,b)
  b = mating_df %>% filter(expr == j & color=="blue")
  norm = mean(b$XX[which(b$blue_strain == "416")])
  b$norm = b$XX - norm + 100
  b$strain = b$blue_strain
  b$color2 = "blue"
  aa = rbind(aa,b)
}

aa = aa %>% mutate(strain_new = case_when(
  strain =="416" ~ "WT",
  strain == "420" ~ "82R",
  strain == "424" ~ "469I"))
aa$strain_new = factor(aa$strain_new, levels=c("WT","82R","469I"))
growth_gpa_strains = p_m
mating_efficiency_gpa1_strains = aa

