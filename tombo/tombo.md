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

### [HOME](../README.md)