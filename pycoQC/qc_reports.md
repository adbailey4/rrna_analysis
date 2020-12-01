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
    * [ivt_20191014_control.html](ivt_20191014_control.html)
    * [06_19_19_R941_NOP58GLU_Manny_noU.html](06_19_19_R941_NOP58GLU_Manny_noU.html)
    * [06_17_19_R941_NOP58GAL_Manny_noU.html](06_17_19_R941_NOP58GAL_Manny_noU.html)
    * [06102019_R941_CBF5GAL_noU.html](06102019_R941_CBF5GAL_noU.html)
    * [06112019_R941_CBF5GLU_noU.html](06112019_R941_CBF5GLU_noU.html)


### [HOME](../README.md)