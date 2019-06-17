#assembly statistics for different k  for test data and ecoli
#read assembly stats(use test data or ecoli if you have it )
library(ggplot2)
library(dplyr)
library(tidyr)
LEUCO <- read.csv("~/proyecto/leugenome/kmerleuconostoc", sep="\t")

#make sure your table shows the k value so you can plot it 
LEUCO2 <- separate(LEUCO,n,c("name","n"),sep=":")

#plot n50 and total length as a functional of k 
ggplot(data= LEUCO2,
       aes(x= name, y= N50)) + 
  geom_point()

read


ggplot(data= LEUCO2,
       aes(name,N50)) + 
  geom_point()+
  geom_line()

#1
ggplot (LEUCO2,aes(N50,as.integer(n)))+geom_point()+
  geom_smooth(method="lm", se=FALSE)
#2
ggplot (LEUCO2,aes(name2,N50))+geom_point()

