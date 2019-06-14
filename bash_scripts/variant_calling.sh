#raw_data_folder=~data/untrimmed_fastq1

#fastqc *fastq.gz
#fastqc ~/data/untrimmed_fastq1/*fastq.gz

#mkdir -p ~/resultsfinal/fastqc_untrimmed
#mv ~/data/

#trim
#bash ~/bash_scripts/trim_scripts_loop.sh ~/data/untrimmed_fastq

#alignment
bash ~/bash_scripts/alignment.sh ~/data/trimmed_fastq_smalla