### Tombo 
* Annotate Raw with Fastq
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/rRNA2/ivt/split_fast5/ --fastq-filenames /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq --processes 14`
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/ --fastq-filenames /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq --processes 14`
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ --fastq-filenames /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq --processes 14`
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/ --fastq-filenames /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq --processes 14`
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ --fastq-filenames /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq --processes 14`

* Resquiggle reads
    * `tombo resquiggle /home/ubuntu/rRNA2/ivt/split_fast5/ /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --processes 16 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/ /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --processes 12 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --processes 12 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/ /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --processes 12 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --processes 12 --num-most-common-errors 5 --rna --overwrite`

* Sample Compare
    * CBF5_GAL vs CBF5_GLU (Native vs psudouridine defficient) 
        * `tombo detect_modifications level_sample_compare --fast5-basedirs /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ \
              --alternate-fast5-basedirs /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/ \
              --statistics-file-basename CBF5_GAL_vs_GLU.level_compare_sample --processes 64`
    * Nop58_GAL vs Nop58_GLU (Native vs psudouridine defficient) 
        * `tombo detect_modifications level_sample_compare --fast5-basedirs /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ \
              --alternate-fast5-basedirs /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/ \
              --statistics-file-basename Nop58_GAL_vs_GLU.level_compare_sample --processes 64`
    * CBF5_GAL vs Nop58_GAL (Native vs psudouridine defficient) 
        * `tombo detect_modifications level_sample_compare --fast5-basedirs /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/  \
              --alternate-fast5-basedirs /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ \
              --statistics-file-basename CBF5_GAL_vs_Nop58_GAL.level_compare_sample --processes 64`
    * IVT vs CBF5_GAL and Nop58_GAL (IVT vs Natives) 
        * `tombo detect_modifications level_sample_compare --fast5-basedirs  /home/ubuntu/rRNA2/ivt/split_fast5/ \
              --alternate-fast5-basedirs /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ \
              --statistics-file-basename IVT_vs_CBF5_GAL_and_Nop58_GAL.level_compare_sample --processes 64`

### Re-run sample compare
* Make Fastqs
    * `bamToFastq -i 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.18S.sorted.bam -fq 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.18S.fastq`
    * `bamToFastq -i 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.sorted.bam -fq 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.fastq`

* Annotate Raw with Fastq
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_18S_full_length --fastq-filenames /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.18S.fastq --processes 8 --overwrite`
    * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_25S_full_length --fastq-filenames /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.fastq --processes 8 --overwrite`

* Resquiggle reads
    * `tombo resquiggle /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_18S_full_length /home/ubuntu/data/rrna_yeast_data/reference/yeast_25S_18S.fa --processes 8 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_25S_full_length /home/ubuntu/data/rrna_yeast_data/reference/yeast_25S_18S.fa --processes 8 --num-most-common-errors 5 --rna --overwrite`

* IVT vs Nop58_GAL (IVT vs Native)
  * `tombo detect_modifications level_sample_compare --fast5-basedirs /home/ubuntu/data/rrna_yeast_data/IVT/ivt_25S_full_length /home/ubuntu/data/rrna_yeast_data/IVT/ivt_18S_full_length --alternate-fast5-basedirs /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_25S_full_length /home/ubuntu/data/rrna_yeast_data/NOP58_GAL/Nop58_GAL_18S_full_length --statistics-file-basename IVT_vs_Nop58_GAL.level_compare_sample --processes 2`


### De Novo IVT rRNA
* Download data
  * `aws s3 sync s3://bailey-k8s/rrna_yeast_data/ rrna_yeast_data`

* Make Fastqs
  * `bamToFastq -i ivt_20191014_control.2308.full_length.25S.sorted.bam -fq ivt_20191014_control.2308.full_length.25S.fastq`
  * `bamToFastq -i ivt_20191014_control.2308.full_length.18S.sorted.bam -fq ivt_20191014_control.2308.full_length.18S.fastq`

* Annotate Raw with Fastq
  * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/rrna_yeast_data/IVT/ivt_18S_full_length --fastq-filenames /home/ubuntu/data/rrna_yeast_data/IVT/ivt_20191014_control.2308.full_length.18S.fastq --processes 64 --overwrite`
  * `tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/rrna_yeast_data/IVT/ivt_25S_full_length --fastq-filenames /home/ubuntu/data/rrna_yeast_data/IVT/ivt_20191014_control.2308.full_length.25S.fastq --processes 64 --overwrite`

* Resquiggle reads
    * `tombo resquiggle /home/ubuntu/data/rrna_yeast_data/IVT/ivt_25S_full_length /home/ubuntu/data/rrna_yeast_data/reference/yeast_25S_18S.fa --processes 64 --num-most-common-errors 5 --rna --overwrite`
    * `tombo resquiggle /home/ubuntu/data/rrna_yeast_data/IVT/ivt_18S_full_length /home/ubuntu/data/rrna_yeast_data/reference/yeast_25S_18S.fa --processes 64 --num-most-common-errors 5 --rna --overwrite`

* De-novo
  * `tombo detect_modifications de_novo --fast5-basedirs /home/ubuntu/data/rrna_yeast_data/IVT/ivt_25S_full_length /home/ubuntu/data/rrna_yeast_data/IVT/ivt_18S_full_length --statistics-file-basename ivt.rna.de_novo_detect --processes 64 --rna`


### De Novo mRNA

##### IVT
https://github.com/nanopore-wgs-consortium/NA12878/blob/master/RNA.md
https://github.com/nanopore-wgs-consortium/NA12878/blob/master/nanopore-human-transcriptome/fastq_fast5_bulk.md
* aws s3 cp s3://nanopore-human-wgs/rna/IVT/UCSC_Run1_20180129_IVT_RNA.tar.gz . && tar -xzf UCSC_Run1_20180129_IVT_RNA.tar.gz
* aws s3 cp s3://nanopore-human-wgs/rna/IVT/01_29_18_R94_12878IVT_pass.fastq .
* tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/consortium/IVT2/UCSC_Run1_20180129_IVT_RNA --fastq-filenames /home/ubuntu/data/consortium/IVT2/01_29_18_R94_12878IVT_pass.fastq --processes 4 --overwrite
* tombo resquiggle /home/ubuntu/data/consortium/IVT2/UCSC_Run1_20180129_IVT_RNA /home/ubuntu/data/consortium/gencode.v27.transcripts.fa --processes 62 --num-most-common-errors 5 --rna --overwrite
* tombo detect_modifications de_novo --fast5-basedirs /home/ubuntu/data/consortium/IVT2/UCSC_Run1_20180129_IVT_RNA --statistics-file-basename ivt.de_novo_detect --processes 64 --rna 
* tombo text_output browser_files --fast5-basedirs /home/ubuntu/data/consortium/IVT2/UCSC_Run1_20180129_IVT_RNA --statistics-filename ivt.de_novo_detect.tombo.stats --file-type coverage
* results are here s3://bailey-misc/mRNA_tombo_results/

##### Sample Compare UBC
* tombo preprocess annotate_raw_with_fastqs --fast5-basedir /home/ubuntu/data/consortium/UBC/UBC_rel5 --fastq-filenames /home/ubuntu/data/consortium/UBC/UBC_Run5_20171031_DirectRNA.pass.dedup.fastq --processes 60 --overwrite
* tombo resquiggle /home/ubuntu/data/consortium/UBC/UBC_rel5 /home/ubuntu/data/consortium/gencode.v27.transcripts.fa --processes 62 --num-most-common-errors 5 --rna --overwrite 
* tombo detect_modifications level_sample_compare --fast5-basedirs /home/ubuntu/data/consortium/IVT2/UCSC_Run1_20180129_IVT_RNA --alternate-fast5-basedirs /home/ubuntu/data/consortium/UBC/UBC_rel5 --statistics-file-basename mrna.IVT_vs_UBC.level_compare_sample --processes 64
* results are here s3://bailey-misc/mRNA_tombo_results/
### [HOME](../README.md)
