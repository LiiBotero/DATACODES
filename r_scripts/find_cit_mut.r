#load variant data for all individuals
install.packages("tidyr")
install.packages("ggplot2")
#if you ddnt do this use ~/r_data/combined_tidy_vcf.csv

VCF<- read.csv("r_data/combined_tidy_vcf.csv")
#load information about ecoli/ strains (data_info)
#put together variant information and citrate information
#count the number of mutations for each sample and know which is cit+

#contar ls mutaciones en VCF

ecoli_count <-ecoli %>% count(run, cit)
summary(ecoli_count)
dim(ecoli_count)
head(ecoli_count)

Mapping <- left_join(VCF,ecoli, by = c("sample_id" = "run"))
cit_mut <- Mapping %>% count(sample_id,cit)
summary(cit_mut)
dim(cit_mut)
head(cit_mut)

