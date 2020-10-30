# Ares Lab rRNA

# 18S and 25S rRNA Yeast Data
RNA was extracted from yeast cells either expressing (GAL) or depleted (GLU) of the pseudouridylase Cbf5, or 2’-O-methylase Nop58
* CBF5 GAL – expressing CBF5 and should contain pseudo Us
* CBF5 GLU – depleted of Cbf5 and should be depleted of pseudo Us
* Nop58 GAL – expressing Nop58 and should contain 2’-O-methyls
* Nop58 GLU – depleted of Nop58 and should be depleted of 2’-O-methyls
* IVT - no modifications 
* Notes from Jason Talkish
    * Sequencing adaptors were designed to hybridize to the 3’ ends of 18S and 25S ribosomal RNAs and direct RNA seq libraries were produced.
    * I also produced a fifth control sample of in vitro transcribed 18S and 25S ribosomal RNAs that should be completely missing modifications
    * Libraries were sequenced on the MinION using R9.4.1 chemistry
    * Basecalling was done by Miten using Guppy/FlipFlop
    * Reads were mapped with MiniMap2 either to the SacCer3 genome which contains two repeats of the rRNA genes, or to a custom genome containing just a single copy of rRNA (37S.fa.txt)

# Analysis
CBF5 GAL = Native
CBF5 GLU = no psi
Nop58 GAL = Native
Nop58 GLU = no 2’-O-methyls
ivt = no mods
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
* Data from Jason (SacCer3)
    * "3) a .bed file of annotated pseudo U and 2’O-me sites (if you are interested) based on this online database http://www.sysu.edu.cn/ however it looks like it is no longer available. 4) a genome file containing only a single copy of the yeast 37S rRNA locus." 
    * 20Me yeast bed
        * [2O_methyl_yeast.bed.bed](ares_rRNA/reference/search2O_methyl_yeast.bed)
    * PseudoU yeast bed
        * [pseduo_u_yeast.bed](ares_rRNA/reference/searchpseduo_u_yeast.bed)
    * 37S 
        * [37S.fa](ares_rRNA/reference/search37S.fa)

* Good Info
    * https://www.yeastgenome.org/locus/S000006482
    
* References
    * 18S - 1800bp
        * www.yeastgenome.org
            * RDN18-1 Location: Chromosome XII 455933..457732
                * [ares_rRNA/reference/searchS288C_RDN18-1_RDN18-1_genomic.fa](https://www.yeastgenome.org/locus/S000006482/sequence) 
        * http://fungi.ensembl.org/
            * Chromosome XII: 455,933-457,732
            * Chromosome XII: 465,070-466,869
        * https://rnacentral.org/rna/URS00005F2C2D/559292
            * [ares_rRNA/reference/search18S_rRNA_yeast.fa](https://rnacentral.org/rna/URS00005F2C2D/559292)
        * https://genome.ucsc.edu/
            * chrXII:455933-457732
            * chrXII:465070-466869
            * [ares_rRNA/reference/searchyeast_ref.fa](https://hgdownload.soe.ucsc.edu/goldenPath/sacCer3/chromosomes/)
    * 25S - 3396bp
        * https://www.yeastgenome.org/locus/S000006484
            * chrXII:455181..451786    
            * ares_rRNA/reference/searchS288C_RDN25-1_RDN25-1_genomic.fa
        * https://genome.ucsc.edu/
            * chrXII:451786-455181
            * chrXII:460923-464318
        * https://rnacentral.org/rna/URS00005F2C2D/559292
            * XII	451,786-455,181
            * XII	460,923-464,318
            * [ares_rRNA/reference/search25S_rRNA_yeast.fa](https://rnacentral.org/rna/URS000061F377/559292)

* Final Reference Sequence
    * __ares_rRNA/reference/yeast_25S_18S.fa__
    
#### Reference Alignments
* `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > ivt_20191014_control.sorted.bam && samtools view -@ 16 -bSF 2308 ivt_20191014_control.sorted.bam > ivt_20191014_control.2308.sorted.bam`
* `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06_19_19_R941_NOP58GLU_Manny_noU.sorted.bam > 06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam`
* `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06_17_19_R941_NOP58GAL_Manny_noU.sorted.bam > 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam`
* `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06112019_R941_CBF5GLU_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06112019_R941_CBF5GLU_noU.sorted.bam > 06112019_R941_CBF5GLU_noU.2308.sorted.bam`
* `minimap2 --MD -t 16 -ax map-ont /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > 06102019_R941_CBF5GAL_noU.sorted.bam && samtools view -@ 16 -bSF 2308 06102019_R941_CBF5GAL_noU.sorted.bam > 06102019_R941_CBF5GAL_noU.2308.sorted.bam`


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

#### Generate QC reports
* First need to create sequencing summary files
    * `Fast5_to_seq_summary -f /home/ubuntu/rRNA2/ivt/split_fast5/ --seq_summary_fn /home/ubuntu/rRNA2/ivt/split_fast5/ivt_20191014_control_sequencing_summary.txt --threads 16`
    * `Fast5_to_seq_summary -f /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/ --seq_summary_fn /home/ubuntu/rRNA2/Nop58_GLU/split_fast5/06_19_19_R941_NOP58GLU_Manny_noU_sequencing_summary.txt --threads 16`
    * `Fast5_to_seq_summary -f /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/ --seq_summary_fn /home/ubuntu/rRNA2/Nop58_GAL/split_fast5/06_17_19_R941_NOP58GAL_Manny_noU_sequencing_summary.txt --threads 16`
    * `Fast5_to_seq_summary -f /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/ --seq_summary_fn /home/ubuntu/rRNA2/CBF5_GLU/split_fast5/06102019_R941_CBF5GAL_noU_sequencing_summary.txt --threads 16`
    * `Fast5_to_seq_summary -f /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/ --seq_summary_fn /home/ubuntu/rRNA2/CBF5_GAL/split_fast5/06112019_R941_CBF5GLU_noU_sequencing_summary.txt --threads 16`

* `pycoQC -f /home/ubuntu/rRNA2/Nop58_GLU/sequencing_summary.txt -a /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.2308.sorted.bam -o /home/ubuntu/rRNA2/pycoqc/06_19_19_R941_NOP58GLU_Manny_noU.html`
* `pycoQC -f /home/ubuntu/rRNA2/Nop58_GAL/sequencing_summary.txt -a /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam -o /home/ubuntu/rRNA2/pycoqc/06_17_19_R941_NOP58GAL_Manny_noU.html`
* `pycoQC -f /home/ubuntu/rRNA2/CBF5_GAL/sequencing_summary.txt -a /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.2308.sorted.bam -o /home/ubuntu/rRNA2/pycoqc/06102019_R941_CBF5GAL_noU.html`
* `pycoQC -f /home/ubuntu/rRNA2/CBF5_GLU/sequencing_summary.txt -a /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.2308.sorted.bam -o /home/ubuntu/rRNA2/pycoqc/06112019_R941_CBF5GLU_noU.html`
* `pycoQC -f /home/ubuntu/rRNA2/ivt/sequencing_summary.txt -a /home/ubuntu/rRNA2/fastq/ivt_20191014_control.2308.sorted.bam -o /home/ubuntu/rRNA2/pycoqc/ivt_20191014_control.html`
* Results
    * `pycoQC/ivt_20191014_control.html`
    * `pycoQC/06_19_19_R941_NOP58GLU_Manny_noU.html`
    * `pycoQC/06_17_19_R941_NOP58GAL_Manny_noU.html`
    * `pycoQC/06102019_R941_CBF5GAL_noU.html`
    * `pycoQC/06112019_R941_CBF5GLU_noU.html`

#### 18S and 25S rRNA Modification Sites
https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0173940
https://academic.oup.com/nar/article-lookup/doi/10.1093/nar/gkw564

#### Nucleotide Encodings
* Nucleotide Encodings can now be done via a tsv model file

| Character | Nucleotide         |
|:---------:|--------------------|
| A         | Adenine            |
| T         | Thymine/Uracil     |
| G         | Guanine            |
| C         | Cytosine           |
|---------|--------------------|
|  a       | 2’-O-Methyladenosine   |
|  b       | 2’-O-Methylcytidine   |
|  c       | 2’-O-Methylguanosine   |
|  d       | 2'-O-methyluridine   |
|  e       | 5-Methylcytosine   |
|  f       | N1-Methyladenosine   |
|  g       | N1-methyl-N3-aminocarboxypropyl_pseudouridine |
|  h       | N3-Methyluridine   |
|  i       | N4-Acetylcytidine   |
|  j       | n6,n6-dimethyladenosine   |
|  k       | 7-Methylguanosine   |
|  l       | Pseudouridine   |
|  m       | 2'-O-methylated_pseudouridine |


| Ambig Character | Other Characters |
|:---------:|--------------------|
| B         |Aa |
| D         |Cb |
| E         |Gc |
| F         |Td |
| H         |Ce |
| I         |Af |
| J         |Tg |
| K         |Th |
| L         |Ci |
| M         |Aj |
| O         |Gk |
| P         |Tl |
| Q         |Tmd |
| R         |md |


* Mod ambig character model is at `reference/mod_variants.model`

* All mod positions and corresponding branches `mod_files/yeast_18S_25S_mods.positions`
    * produced in `ares_rRNA/notebooks/16S_preprocessing_yeast_rRNA.ipynb`
* Native `mod_files/native_yeast_18S_25S_mods.positions`
* IVT `mod_files/ivt_yeast_18S_25S_mods.positions`
* pseduoU knockdown `mod_files/pseduou_knockdown_native_yeast_18S_25S_mods.positions`
* 2'-O methyl knock down - `mod_files/omethyl_knockdown_native_yeast_18S_25S_mods.positions`

#### Kmer model creation
* Kmer model is `ares_rRNA/models/rna_r94_5mer_ACGTabcdefghijklm.model`
    * produced in `ares_rRNA/notebooks/16S_preprocessing_yeast_rRNA.ipynb`
* Noise Kmer model is `ares_rRNA/models/rna_r94_5mer_ACGTabcdefghijklm_noise.model`
    * produced in `ares_rRNA/notebooks/16S_preprocessing_yeast_rRNA.ipynb`


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


## SignalAlign

* Split Bams
    * `split_bams.py -b /home/ubuntu/rRNA2/fastq/ivt_20191014_control.2408.60.1000.3600.sorted.bam -o split_ivt_20191014_control --prefix ivt_20191014_control.2408.60.1000.3600. --num_reads 4000`
    * `split_bams.py -b /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.sorted.bam -o split_06_19_19_R941_NOP58GLU_Manny_noU --prefix 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600. --num_reads 4000`
    * `split_bams.py -b /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.sorted.bam -o split_06_17_19_R941_NOP58GAL_Manny_noU --prefix 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600. --num_reads 4000`
    * `split_bams.py -b /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.2408.60.1000.3600.sorted.bam -o split_06112019_R941_CBF5GLU_noU --prefix 06112019_R941_CBF5GLU_noU.2408.60.1000.3600. --num_reads 4000`
    * `split_bams.py -b /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.2408.60.1000.3600.sorted.bam -o split_06102019_R941_CBF5GAL_noU --prefix 06102019_R941_CBF5GAL_noU.2408.60.1000.3600. --num_reads 4000`

* Test/ Validation split
    * test on BAM #0
    * validate on BAM #1
        
### Supervised Training
* IVT vs Native (NOP58GAL)
    * testing on NOP58GLU, CBF5_GAL, CBF5_GLU, IVT, NOP58GAL (BAM #1)
    * aggregate data for all tests
        * `embed_main sa2bed -o /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/variant_calls/ivt.bed -c BDEFHIJKLMOPQR -t 32 -d /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/tempFiles_alignment/ivt -a /home/ubuntu/rRNA2/reference/mod_variants.model --rna --overwrite`
        * `embed_main sa2bed -o /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/variant_calls/native_cbf5_gal.bed -c BDEFHIJKLMOPQR -t 32 -d /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/tempFiles_alignment/native_cbf5_gal -a /home/ubuntu/rRNA2/reference/mod_variants.model --rna --overwrite`
        * `embed_main sa2bed -o /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/variant_calls/native_nop58_gal.bed -c BDEFHIJKLMOPQR -t 32 -d /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/tempFiles_alignment/native_nop58_gal -a /home/ubuntu/rRNA2/reference/mod_variants.model --rna --overwrite`
        * `embed_main sa2bed -o /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/variant_calls/no_methyl_nop58_glu.bed -c BDEFHIJKLMOPQR -t 32 -d /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/tempFiles_alignment/no_methyl_nop58_glu -a /home/ubuntu/rRNA2/reference/mod_variants.model --rna --overwrite`
        * `embed_main sa2bed -o /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/variant_calls/no_pseduo_u_cbf5_glu.bed -c BDEFHIJKLMOPQR -t 32 -d /home/ubuntu/rRNA2/sa_workspace/supervised/ivt_native/variant_call_testing/round6/tempFiles_alignment/no_pseduo_u_cbf5_glu -a /home/ubuntu/rRNA2/reference/mod_variants.model --rna --overwrite`

* Mod only testing
embed_main sa2bed -d /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/tempFiles_alignment/ivt/ -a /home/ubuntu/rRNA2/reference/mod_variants.model -o /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/variant_calls/ivt.bed -c BDEFHIJKLMOPQR --rna --overwrite -t 96 && embed_main sa2bed -d /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/tempFiles_alignment/native_cbf5_gal/ -a /home/ubuntu/rRNA2/reference/mod_variants.model -o /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/variant_calls/native_cbf5_gal.bed -c BDEFHIJKLMOPQR --rna --overwrite -t 96 && embed_main sa2bed -d /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/tempFiles_alignment/native_nop58_gal/ -a /home/ubuntu/rRNA2/reference/mod_variants.model -o /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/variant_calls/native_nop58_gal.bed -c BDEFHIJKLMOPQR --rna --overwrite -t 96 && embed_main sa2bed -d /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/tempFiles_alignment/no_methyl_nop58_glu/ -a /home/ubuntu/rRNA2/reference/mod_variants.model -o /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/variant_calls/no_methyl_nop58_glu.bed -c BDEFHIJKLMOPQR --rna --overwrite -t 96 && embed_main sa2bed -d /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/tempFiles_alignment/no_pseduo_u_cbf5_glu/ -a /home/ubuntu/rRNA2/reference/mod_variants.model -o /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_variant_calling/round9/variant_calls/no_pseduo_u_cbf5_glu.bed -c BDEFHIJKLMOPQR --rna --overwrite -t 96


* Make small data set in order to debug and check alignments
split_bams.py -b 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.1.bam -o split_cbfgal/ --num_reads 10 --prefix cbfgal
split_bams.py -b 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.1.bam -o split_cbfglu/ --num_reads 10 --prefix cbfglu
split_bams.py -b 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.1.bam -o split_nopgal/ --num_reads 10 --prefix nopgal
split_bams.py -b 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.1.bam -o split_nopglu/ --num_reads 10 --prefix nopglu
split_bams.py -b ivt_20191014_control.2408.60.1000.3600.1.bam -o split_ivt/ --num_reads 10 --prefix ivt

### SignalAlign Mod Only Nopgal
51901.057417946 seconds 
50107.65113999201

## Nanocompore

* Merge bams for more coverage
    * samtools merge ivt_20191014_control.2408.60.1000.3600.10.19.bam ivt_20191014_control.2408.60.1000.3600.1*.bam
    * samtools merge 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.10.19.bam 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.1*.bam
    * samtools merge 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.10.19.bam 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.1*.bam
    * samtools merge 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.10.19.bam 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.1*.bam
    * samtools merge 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.10.19.bam 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.1*.bam

* Run eventalign
    * nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq --bam /home/ubuntu/rRNA2/fastq/split_ivt_20191014_control/ivt_20191014_control.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/ivt_20191014_control.ea_reads.tsv
    * nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06_19_19_R941_NOP58GLU_Manny_noU/06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_19_19_R941_NOP58GLU_Manny_noU.ea_reads.tsv
    * nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06_17_19_R941_NOP58GAL_Manny_noU/06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_17_19_R941_NOP58GAL_Manny_noU.ea_reads.tsv
    * nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06112019_R941_CBF5GLU_noU/06112019_R941_CBF5GLU_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06112019_R941_CBF5GLU_noU.ea_reads.tsv
    * nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06102019_R941_CBF5GAL_noU/06102019_R941_CBF5GAL_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06102019_R941_CBF5GAL_noU.ea_reads.tsv

* Collapse Reads
* NanopolishComp Eventalign_collapse -t 64 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_17_19_R941_NOP58GAL_Manny_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU
* NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_19_19_R941_NOP58GLU_Manny_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_19_19_R941_NOP58GLU_Manny_noU
* NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06112019_R941_CBF5GLU_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06112019_R941_CBF5GLU_noU
* NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06102019_R941_CBF5GAL_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06102019_R941_CBF5GAL_noU
* NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/ivt_20191014_control.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/ivt_20191014_control


* nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/ivt_20191014_control/out_eventalign_collapse.tsv --label1 native --label2 control --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/NOP58GAL_vs_ivt -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite
* nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06102019_R941_CBF5GAL_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06112019_R941_CBF5GLU_noU/out_eventalign_collapse.tsv --label1 native --label2 pseudou_knockdown --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/CBF5GAL_vs_CBF5GLU -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite
* nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_19_19_R941_NOP58GLU_Manny_noU/out_eventalign_collapse.tsv --label1 native --label2 methyl2_knockdown --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/NOP58GAL_vs_NOP58GLU -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite



# TODOS
* call peaks with nanocompore (1 day)
    * Re run with more data
    
* What is going on with peaking of distributions?
    * TODO    
        * Train transitions
            * what is happening with the math here?
            * read the code again
            * also may want to read about the training hmms again (1/2 day - 1 day)
        * pre-alignment
            * Am I overwriting event tables? 
                * No but if I do there does not seem to be a big difference
            * What happens if I update event tables ever iteration?
                * Nothing as I can see right now
            * What does the pre-alignment even do?
        * data
            * Will more data help? - yes
                #### Need more 25S reads
            * Confirm I get the same number of hits for each iteration
        * scaling
            * Does scaling occur based on modified reference?
            * it should NOT! 
    * Done
        * use MEAN and SD instead of median and mad 
        * Train transitions
    * Math errors?
        *     double density = (1 / self->model.var) * get_nanopore_kmer_density(self->hdpModel, x_i, normedMean);
        *     double l_density = log((1 / self->model.var)) + emissions_signal_logGaussPdf(eventMean, levelMean, levelStdDev);

* test_em_training.py (1 week)
    * Inputs
        * models
        * training config
        * positions file
    
    
* Notes from Distribution inspection
    * Find bimodals (TAGTA, CTGbC)
    *     
        
 
### Setup Local data
* get all ids from bam
    * `samtools view cbfgal0.bam | awk '{print $1}' > ../cbfgal0_readids.txt`
    * `samtools view cbfglu0.bam | awk '{print $1}' > ../cbfglu0_readids.txt`
    * `samtools view ivt0.bam | awk '{print $1}' > ../ivt0_readids.txt`
    * `samtools view nopgal0.bam | awk '{print $1}' > ../nopgal0_readids.txt`
    * `samtools view nopglu0.bam | awk '{print $1}' > ../nopglu0_readids.txt`

* get overlapping ids into new readdb
    * `grep -f cbfgal0_readids.txt /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq.index.readdb > cbfgal.index.readdb`
    * `grep -f cbfglu0_readids.txt /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq.index.readdb > cbfglu.index.readdb`
    * `grep -f nopgal0_readids.txt /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq.index.readdb > nopgal.index.readdb`
    * `grep -f nopglu0_readids.txt /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq.index.readdb > nopglu.index.readdb`
    * `grep -f ivt0_readids.txt /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq.index.readdb > ivt.index.readdb`

* copy files
    * `awk '{print $2}' cbfgal.index.readdb | xargs -I{} cp {} ~/rRNA2/small_test_data/fast5s/cbfgal`
    * `awk '{print $2}' cbfglu.index.readdb | xargs -I{} cp {} ~/rRNA2/small_test_data/fast5s/cbfglu`
    * `awk '{print $2}' nopgal.index.readdb | xargs -I{} cp {} ~/rRNA2/small_test_data/fast5s/nopgal`
    * `awk '{print $2}' nopglu.index.readdb | xargs -I{} cp {} ~/rRNA2/small_test_data/fast5s/nopglu`
    * `awk '{print $2}' ivt.index.readdb | xargs -I{} cp {} ~/rRNA2/small_test_data/fast5s/ivt`

* Re align for nanopolish index reads
    * minimap2 --MD -t 16 -ax map-ont /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfgal.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > cbfgal.sorted.bam
    * minimap2 --MD -t 16 -ax map-ont /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfglu.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > cbfglu.sorted.bam
    * minimap2 --MD -t 16 -ax map-ont /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/ivt.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > ivt.sorted.bam
    * minimap2 --MD -t 16 -ax map-ont /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopgal.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > nopgal.sorted.bam
    * minimap2 --MD -t 16 -ax map-ont /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa /Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopglu.fastq | samtools view -@ 16 -bS - | samtools sort -@ 16 - > nopglu.sorted.bam

* Run eventalign
embed_main eventalign --scale-events --signal-index --print-read-names --threads=8 --genome=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa --bam=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfgal.sorted.bam --reads=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfgal.fastq > cbfgal_eventalign.tsv
embed_main eventalign --scale-events --signal-index --print-read-names --threads=8 --genome=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa --bam=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfglu.sorted.bam --reads=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/cbfglu.fastq > cbfglu_eventalign.tsv 
embed_main eventalign --scale-events --signal-index --print-read-names --threads=8 --genome=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa --bam=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/ivt.sorted.bam --reads=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/ivt.fastq > ivt_eventalign.tsv
embed_main eventalign --scale-events --signal-index --print-read-names --threads=8 --genome=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa --bam=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopgal.sorted.bam --reads=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopgal.fastq > nopgal_eventalign.tsv
embed_main eventalign --scale-events --signal-index --print-read-names --threads=8 --genome=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/reference/yeast_25S_18S.fa --bam=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopglu.sorted.bam --reads=/Users/andrewbailey/CLionProjects/personal/projects/ares_rRNA/small_local_sample/fastq_nanopolish/nopglu.fastq > nopglu_eventalign.tsv

cbfgal
cbfglu
ivt
nopgal
nopglu


## Per position plotting
### .event table generation for per position plotting
embed_main split_by_position --alignment_files /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_ivt_vs_nopgal/tempFiles_trainModels/native_nop58_gal --output /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_ivt_vs_nopgal/tempFiles_trainModels/native_nop58_gal.event --reference /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --threads 4 --rna --alphabet ACGTabcdefghijklm
embed_main kmer_distributions --event_file /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_ivt_vs_nopgal/tempFiles_trainModels/native_nop58_gal.event --positions_file /home/ubuntu/rRNA2/reference/ivt_yeast_18S_25S_mods.positions --output /home/ubuntu/rRNA2/sa_workspace/supervised/more_data_ivt_native/mod_only_ivt_vs_nopgal/tempFiles_trainModels/position_histograms --reference /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --ambig_model /home/ubuntu/rRNA2/reference/mod_variants.model
python /home/ubuntu/rRNA2/plot_per_position_kmer_distributions.py --config /home/ubuntu/rRNA2/per_position_kmer_plotting.config.json

python /home/ubuntu/rRNA2/run_embed_plot_wrapper.py --config /home/ubuntu/rRNA2/run_embed_plot_wrapper.config.json


## 07/03/20
* In order to determine if iterative training actually improves results for the training dataset I am going to train 
on a subsample of data (500) reads for several rounds (30) and test if accuracy increases. First we are going to only
use a completely supervised approach with only the native training reads. This round of experiments is going to test 
if an increase in probability threshold gives better results. Better is described as an increase in accuracy of the 
model predictions during inference. In order to determine the effectiveness of this method for various subsections of 
modified nucleotide positions we will be partitioning the data by several factors. 
    * Percent modified
    * proximity to other modified nucelotides
    * Modification identity
    * Duplicate kmer hits

#### Subsample reads
split_bams.py -b ivt_20191014_control.2408.60.1000.3600.2.bam -o /home/ubuntu/rRNA2/fastq/split_ivt_20191014_control/split_500 --num_reads 500 --prefix ivt


### Re run everything
#### 0 prob, 500 files
* Train
    * trainModels run --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal/rrna_trainModels_config.json

* Test
    * [Copy model files bash helper](#Copy-model-files-bash-helper)
    * python /home/ubuntu/rRNA2/re_run_signalalign.py --dir /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal/training_models --output_dir /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal/testing --base_model /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal/re_runSignalAlign_testing_config.json --variants BDEFHIJKLMOPQR --rna

* Plot Distributions
    * [Generate iterations helper](#Generate-iterations-helper) 
    * python /home/ubuntu/rRNA2/run_embed_plot_wrapper.py -c /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal/run_embed_plot_wrapper2.config.json
    * Time: 0.0 days 2.0 hr 42.0 min 5.0 sec
    
* Plot accuracy over time
    * [Run plot_mulitple_variant_accuracy.py many times](#Re run plot_multiple_variant_accuracy) 
    * [Get all variant calls to single directory](Get all variant calls to single directory)
    * ![](less_data_testing_07_03_20/zero_prob/small_data_0_prob.png)
    

#### 0.00 prob, 500 files
/home/ubuntu/rRNA2/train_test_accuracy_wrapper.py --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_00_prob/train_test_accuracy_wrapper.config.json

#### 0.25 prob, 500 files
/home/ubuntu/rRNA2/train_test_accuracy_wrapper.py --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_25_prob/train_test_accuracy_wrapper.config.json

#### 0.5 prob, 500 files
/home/ubuntu/rRNA2/train_test_accuracy_wrapper.py --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_50_prob/train_test_accuracy_wrapper.config.json

#### 0.75 prob, 500 files
/home/ubuntu/rRNA2/train_test_accuracy_wrapper.py --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_75_prob/train_test_accuracy_wrapper.config.json

#### 0.9 prob, 500 files
/home/ubuntu/rRNA2/train_test_accuracy_wrapper.py --config /home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_90_prob/train_test_accuracy_wrapper.config.json



# Code Snippets

##### Generate iterations helper 
```python
import os
from py3helpers.utils import load_json, list_dir, save_json
import re

def get_trailing_number(s):
    m = re.search(r'\d+$', s)
    return int(m.group()) if m else None

training_path = "/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_50_prob/training"
model_path = "/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_50_prob/run_embed_plot_wrapper.config.json"
output_path = "/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_50_prob/run_embed_plot_wrapper2.config.json"
assert(os.path.exists(training_path))
assert(os.path.exists(model_path))
model_json = load_json(model_path)
dirs_in_training = [os.path.join(training_path, x) for x in os.listdir(training_path) if os.path.exists(os.path.join(training_path, x)) and os.path.isdir(os.path.join(training_path, x))]
assert len(dirs_in_training) > 0
iterations = []
for directory in dirs_in_training:
    number = get_trailing_number(directory)
    if number is None:
        hmm_model0 = list_dir(directory, ext="hmm")[0]
        hmm_model1 = list_dir(directory, ext="model")[0]
        sa_output_dirs = [os.path.join(directory, x) for x in os.listdir(directory) if os.path.isdir(os.path.join(directory, x))]
        iterations.append({"name": "iteration0", "hmm_model": hmm_model0, "hdp_model": None, "sa_output_dirs": sa_output_dirs})
        iterations.append({"name": "iteration1", "hmm_model": hmm_model1, "hdp_model": None, "sa_output_dirs": sa_output_dirs})
    else:
        name = "iteration{}".format(number)
        hmm_model = list_dir(directory, ext="model")
        if len(hmm_model) == 1:
            hmm_model = hmm_model[0]
            sa_output_dirs = [os.path.join(directory, x) for x in os.listdir(directory) if os.path.isdir(os.path.join(directory, x))]
            iterations.append({"name": name, "hmm_model": hmm_model, "hdp_model": None, "sa_output_dirs": sa_output_dirs})

model_json["iterations"] = iterations
save_json(model_json, output_path)
```

##### Copy model files bash helper 
```bash
TESTING_DIR="/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_80_prob/training/"
MODELS_DIR="/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_80_prob/training_models"
echo ${TESTING_DIR}
cp ${TESTING_DIR}tempFiles_trainModels/template_hmm1.model ${MODELS_DIR}
for VARIABLE in {2..29}
do
 cp ${TESTING_DIR}tempFiles_trainModels_${VARIABLE}/template_hmm${VARIABLE}.model ${MODELS_DIR}
done
```

#### Re run plot_multiple_variant_accuracy
```python
from signalalign.visualization.plot_multiple_variant_accuracy import plot_multiple_variant_accuracy
from py3helpers.utils import list_dir
import os

output_dir = "/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_80_prob/testing_accuracy"
testing_dir = "/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_80_prob/testing"
positions_file = "/home/ubuntu/rRNA2/reference/native_yeast_18S_25S_mods_guess.positions"
names = ["native_nop58_gal"]
suffixes = ["variant_calls/native_nop58_gal.csv"]
threshold = 0.5

assert os.path.isdir(testing_dir), "testing_dir does not exist: {}".format(testing_dir)
assert os.path.isdir(output_dir), "output_dir does not exist: {}".format(output_dir)
dirs = [os.path.join(testing_dir, x) for x in os.listdir(testing_dir) if not x.endswith("created_models")]

for testing_dir in dirs:
    test_output_dir = os.path.join(output_dir, os.path.basename(testing_dir))
    if os.path.exists(test_output_dir):
        print("{} exists, continuing".format(test_output_dir))
        continue
    samples = []
    print(testing_dir)
    for name, suffix in zip(names, suffixes):
        print(os.path.join(testing_dir, suffix))
        samples.append({"name": name, 
                        "variant_csv": os.path.join(testing_dir, suffix),
                        "positions_file": positions_file})
    plot_multiple_variant_accuracy(test_output_dir, samples, threshold)
```

#### Get all variant calls to single directory
```bash
TESTING_ACCURACY_DIR="/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_90_prob/testing_accuracy/"
OUTPUT_DIR="/home/ubuntu/rRNA2/sa_workspace/supervised/less_data_testing_07_03_20/mod_only_nopgal_90_prob/testing_accuracy_csvs"
echo ${TESTING_ACCURACY_DIR}
for VARIABLE in {1..29}
do
    cp ${TESTING_ACCURACY_DIR}template_hmm${VARIABLE}/per_position/per_position_data_0.5.csv ${OUTPUT_DIR}/${VARIABLE}_per_position_data_0.5.csv
done
```

* Re-download raw fast5s
sed -i 's='/home/ubuntu/rRNA2/Nop58_GAL/split_fast5//'='/home/ubuntu/rRNA2/Nop58_GAL/clean/split/'=g' /home/ubuntu/rRNA2/fastq/NOP58GAL.2308.full_length.25S.readdb
sed -i 's='/home/ubuntu/rRNA2/Nop58_GAL/split_fast5//'='/home/ubuntu/rRNA2/Nop58_GAL/clean/split/'=g' /home/ubuntu/rRNA2/fastq/NOP58GAL.2308.full_length.18S.readdb

* get full length reads
samtools view -hb 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam RDN18-1:1-15 -o 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.18S.sorted.bam
samtools view -hb 06_17_19_R941_NOP58GAL_Manny_noU.2308.sorted.bam RDN25-1:1-15 -o 06_17_19_R941_NOP58GAL_Manny_noU.2308.full_length.25S.sorted.bam

* ivt
samtools view -hb ivt_20191014_control.2308.sorted.bam RDN18-1:1-15 -o ivt_20191014_control.2308.full_length.18S.sorted.bam
samtools view -hb ivt_20191014_control.2308.sorted.bam RDN25-1:1-15 -o ivt_20191014_control.2308.full_length.25S.sorted.bam
sed 's='/home/ubuntu/rRNA2/ivt/split_fast5//'='/home/ubuntu/rRNA2/ivt/clean/split_fast5s/'=g' /home/ubuntu/rRNA2/fastq/ivt_full_length_18S.readdb
sed 's='/home/ubuntu/rRNA2/ivt/split_fast5//'='/home/ubuntu/rRNA2/ivt/clean/split_fast5s/'=g' /home/ubuntu/rRNA2/fastq/ivt_full_length_25S.readdb

sed 's='/home/ubuntu/rRNA2/Nop58_GAL/clean/split/.*/'='/home/ubuntu/rRNA2/medium_IVT_nopGAL/nopgal_fast5/'=g' 1000_NOP58GAL.2308.full_length.18S.readdb
sed 's='/home/ubuntu/rRNA2/ivt/clean/split_fast5s/.*/'='/home/ubuntu/rRNA2/medium_IVT_nopGAL/ivt_fast5/'=g' 1000_ivt_full_length_18S.readdb

* CBF5_GAL
/home/ubuntu/rRNA2/CBF5_GAL/clean/split_fast5s

sed -i 's='/home/ubuntu/rRNA2/CBF5_GAL/split_fast5//'='/home/ubuntu/rRNA2/CBF5_GAL/clean/split_fast5s/'=g' CBF5GAL_full_length.18S.readdb
sed -i 's='/home/ubuntu/rRNA2/CBF5_GAL/split_fast5//'='/home/ubuntu/rRNA2/CBF5_GAL/clean/split_fast5s/'=g' CBF5GAL_full_length.25S.readdb
awk '{print $2}' CBF5GAL_full_length.18S.readdb | xargs -I{} cp {} ../CBF5_GAL_18S_full_length/
awk '{print $2}' CBF5GAL_full_length.25S.readdb | xargs -I{} cp {} ../CBF5_GAL_25S_full_length/

* CBF5_GLU

sed -i 's='/home/ubuntu/rRNA2/CBF5_GLU/clean/split_fast5/'='/home/ubuntu/rRNA2/CBF5_GLU/clean/split_fast5/'=g' CBF5GLU_full_length.18S.readdb
sed -i 's='/home/ubuntu/rRNA2/CBF5_GLU/split_fast5//'='/home/ubuntu/rRNA2/CBF5_GLU/clean/split_fast5/'=g' CBF5GLU_full_length.25S.readdb
awk '{print $2}' CBF5GLU_full_length.18S.readdb | xargs -I{} cp {} ../CBF5_GLU_18S_full_length/
awk '{print $2}' CBF5GLU_full_length.25S.readdb | xargs -I{} cp {} ../CBF5_GLU_25S_full_length/

* NOP58_GLU

/home/ubuntu/rRNA2/Nop58_GLU/split_fast5//FAK94145_d542c328c3d937e519131392f6ed2b0b25a8941c_87/read_00110981-3494-42d5-903c-73710be083a1.fast5
sed 's='/home/ubuntu/rRNA2/Nop58_GLU/split_fast5//'='/home/ubuntu/rRNA2/Nop58_GLU/clean/split_fast5/'=g' NOP58GLU.2308.full_length.18S.readdb
sed 's='/home/ubuntu/rRNA2/Nop58_GLU/split_fast5//'='/home/ubuntu/rRNA2/Nop58_GLU/clean/split_fast5/'=g' NOP58GLU.2308.full_length.25S.readdb
awk '{print $2}' NOP58GLU.2308.full_length.25S.readdb | xargs -I{} cp {} ../Nop58_GLU_25S_full_length/
awk '{print $2}' NOP58GLU.2308.full_length.18S.readdb | xargs -I{} cp {} ../Nop58_GLU_18S_full_length/


