#assembly statistics for different k  for test data and ecoli
#read assembly stats(use test data or ecoli if you have it )
library(ggplot2)
library(dplyr)
library(tidyr)
ASM <- read.csv("data/trimmed_fastq_small/sub/assembly1/allteststats", sep="\t")

#make sure your table shows the k value so you can plot it 
ASM_stats2 <- separate(ASM,n,c("name","n"),sep=":")

#plot n50 and total length as a functional of k 
ggplot(data= ASM_stats2,
       aes(x= name, y= N50)) + 
  geom_point()


ASM_stats3 <- separate(ASM,n,c("name1","n"),sep=":") %>%
  separate(name1,c("k","name1"), sep="-") %>% separate(k,c("name2","k"),sep="k")

ggplot(data= ASM_stats3,
        aes(k,N50)) + 
   geom_point()+
  geom_line()

#1
ggplot (ASM_stats2,aes(N50,as.integer(n)))+geom_point()+
  geom_smooth(method="lm", se=FALSE)
#2
ggplot (ASM_stats3,aes(name2,N50))+geom_point()

install.packages("miktex")

