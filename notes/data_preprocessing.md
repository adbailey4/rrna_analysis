## Data Preprocessing

#### Basecalling Data
* Example log file from `http://exon.ucsc.edu/MinION_jul19/MinIONData/jason_flipflop/06112019_R941_CBF5GLU/guppy_basecaller_log-2019-06-13_23-36-07.log`
```
2019-06-13 23:36:07.054578 [guppy/message] ONT Guppy basecalling software version 3.1.5+781ed57
config file:        /opt/ont/guppy/data/rna_r9.4.1_70bps_hac.cfg
model file:         /opt/ont/guppy/data/template_rna_r9.4.1_70bps_hac.jsn
input path:         jason/06112019_R941_CBF5GLU/
save path:          ./basecalled/06112019_R941_CBF5GLU
chunk size:         1000
chunks per runner:  1000
records per file:   4000
num basecallers:    4
gpu device:         cuda:0 cuda:1 cuda:2 cuda:3
kernel path:        
runners per device: 2
```

#### Downloading Data
* CBF5 GAL 
    * Seq Summary
        * `wget http://exon.ucsc.edu/MinION_jul19/MinIONData/jason_flipflop/06102019_R941_CBF5GAL/sequencing_summary.txt`
    * Fast5
        * `wget -r -np -R "index.html*" http://exon.ucsc.edu/MinION_jul19/MinIONData/06102019_R941_CBF5GAL/`
    * Fastq
        * `wget http://exon.ucsc.edu/jason/jason_jun2019/06102019_R941_CBF5GAL_noU.fastq`
* CBF5 GLU 
    * Seq Summary
        * `wget http://exon.ucsc.edu/MinION_jul19/MinIONData/jason_flipflop/06112019_R941_CBF5GLU/sequencing_summary.txt`
    * Fast5
        * `wget -r -np -R "index.html*" wget http://exon.ucsc.edu/MinION_jul19/MinIONData/06112019_R941_CBF5GLU/`
    * Fastq
        * `wget http://exon.ucsc.edu/jason/jason_jun2019/06112019_R941_CBF5GLU_noU.fastq`
* Nop58 GAL 
    * Seq Summary
        * `wget http://exon.ucsc.edu/MinION_jul19/MinIONData/jason_flipflop/06_17_19_R941_NOP58GAL_Manny/sequencing_summary.txt`
    * Fast5
        * `wget http://exon.ucsc.edu/MinION_jul19/MinIONData/06_17_19_R941_NOP58GAL_Manny/061719_R941_NOP58GAL/`
    * Fastq
        * `wget http://exon.ucsc.edu/jason/Nop58/06_17_19_R941_NOP58GAL_Manny_noU.fastq`
* Nop58 GLU 
    * Seq Summary
        * `wget http://exon.ucsc.edu/MinION_jul19/MinIONData/jason_flipflop/06_19_19_R941_NOP58GLU_Manny/sequencing_summary.txt`
    * Fast5
        * `wget -r -np -R "index.html*" http://exon.ucsc.edu/MinION_jul19/MinIONData/06_19_19_R941_NOP58GLU_Manny/`
    * Fastq
        * `wget http://exon.ucsc.edu/jason/Nop58/06_19_19_R941_NOP58GLU_Manny_noU.fastq`
* IVT
    * Seq Summary
        * `wget http://exon.ucsc.edu/jason_oct2019/20191014_1845_MN20528_FAL23261_9a8cb226/sequencing_summary.txt`
    * Fast5
        * `wget http://exon.ucsc.edu/jason_oct2019/fast5/`
    * Fastq
        * `wget http://exon.ucsc.edu/jason_oct2019/20191014_control.fastq`

#### Split Reads
* Source: `https://github.com/nanoporetech/ont_fast5_api`
* For each set: `multi_to_single_fast5 -i fast5/ -s split_fast5s/ -t 2`
* `split_multi_fast5.py -f fast5s/ -o split_fast5s/ -j 4`

#### Indexing 
* `~/nanopolish/nanopolish index -d /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/ 06_19_19_R941_NOP58GLU_Manny_noU.fastq`
* `~/nanopolish/nanopolish index -d /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ 06_17_19_R941_NOP58GAL_Manny_noU.fastq`
* `~/nanopolish/nanopolish index -d /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ 06112019_R941_CBF5GLU_noU.fastq`
* `~/nanopolish/nanopolish index -d /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/ 06102019_R941_CBF5GAL_noU.fastq`
* `~/nanopolish/nanopolish index -d /home/ubuntu/rRNA2/ivt/split_fast5/ ivt_20191014_control.fastq`

#### Reference Sequence Search
* Final Reference Sequence
    * combined from https://www.yeastgenome.org/ and matched with other searches for the genome
    * __yeast_25S_18S.fa__
    
#### Reference Alignments and Filtering

* Initial Mapping and Filtering
    * `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > ivt_20191014_control.sorted.bam && samtools view -@ 16 -bSF 2308 ivt_20191014_control.sorted.bam > ivt_20191014_control.2308.sorted.bam`
    * `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam > 06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam`
    * `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam > 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam`
    * `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06112019_R941_CBF5GLU_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06112019_R941_CBF5GLU_noU.sorted.bam > 06112019_R941_CBF5GLU_noU.2308.sorted.bam`
    * `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06102019_R941_CBF5GAL_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06102019_R941_CBF5GAL_noU.sorted.bam > 06102019_R941_CBF5GAL_noU.2308.sorted.bam`

* Filter for full length reads
    * `samtools view -hb ivt_20191014_control.2308.sorted.bam RDN18-1:1-15 -o ivt_20191014_control.2308.full_length.18S.sorted.bam`
    * `samtools view -hb ivt_20191014_control.2308.sorted.bam RDN25-1:1-15 -o ivt_20191014_control.2308.full_length.25S.sorted.bam`
    * `samtools view -hb 06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam RDN18-1:1-15 -o 06_19_19_R941_NOP58GLU_Manny_noU.2308.full_length.18S.sorted.bam`
    * `samtools view -hb 06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam RDN25-1:1-15 -o 06_19_19_R941_NOP58GLU_Manny_noU.2308.full_length.25S.sorted.bam`
    * `samtools view -hb 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam RDN18-1:1-15 -o 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.18S.sorted.bam`
    * `samtools view -hb 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam RDN25-1:1-15 -o 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.sorted.bam`
    * `samtools view -hb 06112019_R941_CBF5GLU_noU.2308.sorted.bam RDN18-1:1-15 -o 06112019_R941_CBF5GLU_noU.2308.full_length.18S.sorted.bam`
    * `samtools view -hb 06112019_R941_CBF5GLU_noU.2308.sorted.bam RDN25-1:1-15 -o 06112019_R941_CBF5GLU_noU.2308.full_length.25S.sorted.bam`
    * `samtools view -hb 06102019_R941_CBF5GAL_noU.2308.sorted.bam RDN18-1:1-15 -o 06102019_R941_CBF5GAL_noU.2308.full_length.18S.sorted.bam`
    * `samtools view -hb 06102019_R941_CBF5GAL_noU.2308.sorted.bam RDN25-1:1-15 -o 06102019_R941_CBF5GAL_noU.2308.full_length.25S.sorted.bam`


#### Basic Sequencing Statistics
* `echo $(cat ivt_20191014_control.fastq|wc -l)/4|bc && samtools flagstat ivt_20191014_control.sorted.bam && samtools flagstat ivt_20191014_control.2308.sorted.bam`
* `echo $(cat 06_19_19_ R941_NOP58GLU_Manny_noU.fastq|wc -l)/4|bc && samtools flagstat 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam && samtools flagstat 06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam`
* `echo $(cat 06_17_19_R941_NOP58GAL_Manny_noU.fastq|wc -l)/4|bc && samtools flagstat 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam && samtools flagstat 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam`
* `echo $(cat 06112019_R941_CBF5GLU_noU.fastq|wc -l)/4|bc && samtools flagstat 06112019_R941_CBF5GLU_noU.sorted.bam && samtools flagstat 06112019_R941_CBF5GLU_noU.2308.sorted.bam`
* `echo $(cat 06102019_R941_CBF5GAL_noU.fastq|wc -l)/4|bc && samtools flagstat 06102019_R941_CBF5GAL_noU.sorted.bam && samtools flagstat 06102019_R941_CBF5GAL_noU.2308.sorted.bam`

* Filter bams by mapping quality 60, unmapped, not primary alignment, supplementary alignment reads (2308) and read length between 1000 and 3600
    * `samtools view -q 60 -@ 15 -F 2308 -h ivt_20191014_control.sorted.bam | awk '(length($10) > 1000 && length($10) < 3600) || $1 ~ /^@/' | samtools view -bS - > ivt_20191014_control.2408.60.1000.3600.sorted.bam`
    * `samtools view -q 60 -@ 15 -F 2308 -h 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam | awk '(length($10) > 1000 && length($10) < 3600) || $1 ~ /^@/' | samtools view -bS - > 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.sorted.bam`
    * `samtools view -q 60 -@ 15 -F 2308 -h 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam | awk '(length($10) > 1000 && length($10) < 3600) || $1 ~ /^@/' | samtools view -bS - > 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.sorted.bam`
    * `samtools view -q 60 -@ 15 -F 2308 -h 06112019_R941_CBF5GLU_noU.sorted.bam | awk '(length($10) > 1000 && length($10) < 3600) || $1 ~ /^@/' | samtools view -bS - > 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.sorted.bam`
    * `samtools view -q 60 -@ 15 -F 2308 -h 06102019_R941_CBF5GAL_noU.sorted.bam | awk '(length($10) > 1000 && length($10) < 3600) || $1 ~ /^@/' | samtools view -bS - > 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.sorted.bam`

* ivt_20191014_control
    * Number of Reads : 430437
    * Number Aligned : 401523
    * Number Filtered Aligned : 401340
    * Number Read Length Filtered : 254349
* 06_19_19_R941_NOP58GLU_Manny_noU
    * Number of Reads : 830503 
    * Number Aligned : 754803
    * Number Filtered Aligned : 754505
    * Number Read Length Filtered : 353482
* 06_17_19_R941_NOP58GAL_Manny_noU
    * Number of Reads : 951265
    * Number Aligned : 899374
    * Number Filtered Aligned : 898387
    * Number Read Length Filtered : 457954
* 06112019_R941_CBF5GLU_noU
    * Number of Reads : 899114
    * Number Aligned : 825271
    * Number Filtered Aligned : 824877
    * Number Read Length Filtered : 384566
* 06102019_R941_CBF5GAL_noU
    * Number of Reads : 188958
    * Number Aligned : 173782 
    * Number Filtered Aligned : 173506
    * Number Read Length Filtered : 111823

### [HOME](../README.md)