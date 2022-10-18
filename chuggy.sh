#!bin/bash

wget https://raw.githubusercontent.com/HackBio-Internship/wale-home-tasks/main/DNA.fa
grep ">" DNA.fa | wc -l
grep -v ">" DNA.fa | grep -E -o "A|G|T|C" | wc -l
 grep -v ">" DNA.fa | wc | awk '{print $3-$1}'
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
sudo apt update
sudo apt install fastqc
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/ACBarrie_R1_rep.fastq.gz?raw=true -O rep.fastq.gz
gunzip ACBarrie_R1_rep.fastq.gz
mkdir Output 
fastqc ACBarrie_R1_rep.fastq -o Output
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/trimmed_reads/Baxter_R1.fastq.gz?raw=true
gunzip Baxter_R1.fastq.gz
fastqc Baxter_R1.fastq.gz -o Output
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Alsen_R2.fastq.gz?raw=true
sudo apt-get update
sudo apt-get -y install multiqc
multiqc Output
sudo apt install fastp
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R1.fastq.gz?raw=true -O Chara_R1.fastq.gz
wget https://github.com/josoga2/yt-dataset/blob/main/dataset/raw_reads/Chara_R2.fastq.gz?raw=true -O Chara_R2.fastq.gz
fastp -i Chara_R1.fastq.gz -I  Chara_R2.fastq.gz  -o R1.fastq.gz -O R2.fastq.gz
fastp -i Chara_R1.fastq.gz -I  Chara_R2.fastq.gz  -o R1.fastq.gz -O R2.fastq.gz

