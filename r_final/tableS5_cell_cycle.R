

ap_icc  = readRDS("data/out/combined/Ap/scICC.RDS")
genes = rownames(ap_icc)
ap_icc = ap_icc %>% as_data_frame()
ap_icc$gene_id = genes
ap_icc2 = ap_icc %>% inner_join(genes_name_trans,by=c("gene_id"))
ap_icc2 = ap_icc2 %>% dplyr::select(-ICC.cc,-ICC.H2)

colnames(ap_icc2) = c("cell-cycle variance","genetic variance","cell-cycle q-value","genetic q-value","total umis","gene id","gene name")
#ap_icc2 %>% write_tsv(file="tables/s5.tsv")
openxlsx::write.xlsx(ap_icc2,"tables/s5.xlsx")