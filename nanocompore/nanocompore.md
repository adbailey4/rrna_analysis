## Nanocompore Analysis

* Merge bams for more coverage
    * `samtools merge ivt_20191014_control.2408.60.1000.3600.10.19.bam ivt_20191014_control.2408.60.1000.3600.1*.bam`
    * `samtools merge 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.10.19.bam 06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.1*.bam`
    * `samtools merge 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.10.19.bam 06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.1*.bam`
    * `samtools merge 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.10.19.bam 06112019_R941_CBF5GLU_noU.2408.60.1000.3600.1*.bam`
    * `samtools merge 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.10.19.bam 06102019_R941_CBF5GAL_noU.2408.60.1000.3600.1*.bam`

* Run eventalign
    * `nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/ivt_20191014_control.fastq --bam /home/ubuntu/rRNA2/fastq/split_ivt_20191014_control/ivt_20191014_control.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/ivt_20191014_control.ea_reads.tsv`
    * `nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06_19_19_R941_NOP58GLU_Manny_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06_19_19_R941_NOP58GLU_Manny_noU/06_19_19_R941_NOP58GLU_Manny_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_19_19_R941_NOP58GLU_Manny_noU.ea_reads.tsv`
    * `nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06_17_19_R941_NOP58GAL_Manny_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06_17_19_R941_NOP58GAL_Manny_noU/06_17_19_R941_NOP58GAL_Manny_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_17_19_R941_NOP58GAL_Manny_noU.ea_reads.tsv`
    * `nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06112019_R941_CBF5GLU_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06112019_R941_CBF5GLU_noU/06112019_R941_CBF5GLU_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06112019_R941_CBF5GLU_noU.ea_reads.tsv`
    * `nanopolish eventalign -t 64 --reads /home/ubuntu/rRNA2/fastq/06102019_R941_CBF5GAL_noU.fastq --bam /home/ubuntu/rRNA2/fastq/split_06102019_R941_CBF5GAL_noU/06102019_R941_CBF5GAL_noU.2408.60.1000.3600.10.19.bam --genome /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --samples --print-read-names --scale-events --samples > /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06102019_R941_CBF5GAL_noU.ea_reads.tsv`

* Collapse Reads
    * `NanopolishComp Eventalign_collapse -t 64 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_17_19_R941_NOP58GAL_Manny_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU`
    * `NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06_19_19_R941_NOP58GLU_Manny_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_19_19_R941_NOP58GLU_Manny_noU`
    * `NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06112019_R941_CBF5GLU_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06112019_R941_CBF5GLU_noU`
    * `NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/06102019_R941_CBF5GAL_noU.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06102019_R941_CBF5GAL_noU`
    * `NanopolishComp Eventalign_collapse -t 16 -i /home/ubuntu/rRNA2/nanocompore_workspace/nanopolish_outputs/ivt_20191014_control.ea_reads.tsv -o /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/ivt_20191014_control`


* `nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/ivt_20191014_control/out_eventalign_collapse.tsv --label1 native --label2 control --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/NOP58GAL_vs_ivt -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite`
* `nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06102019_R941_CBF5GAL_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06112019_R941_CBF5GLU_noU/out_eventalign_collapse.tsv --label1 native --label2 pseudou_knockdown --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/CBF5GAL_vs_CBF5GLU -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite`
* `nanocompore sampcomp --file_list1 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_17_19_R941_NOP58GAL_Manny_noU/out_eventalign_collapse.tsv --file_list2 /home/ubuntu/rRNA2/nanocompore_workspace/nanopolishcomp/06_19_19_R941_NOP58GLU_Manny_noU/out_eventalign_collapse.tsv --label1 native --label2 methyl2_knockdown --fasta /home/ubuntu/rRNA2/reference/yeast_25S_18S.fa --outpath /home/ubuntu/rRNA2/nanocompore_workspace/NOP58GAL_vs_NOP58GLU -t 12 --comparison_methods GMM --sequence_context 2 --sequence_context_weights harmonic --downsample_high_coverage 10000 --overwrite`





### [HOME](../README.md)