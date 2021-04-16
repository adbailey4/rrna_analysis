# Flongle yeast rRNA experiments

#### Setup
docker run -it --entrypoint /bin/bash -v /home/ubuntu:/data --name rrna_analysis ucscbailey/signalalign:bailey-dev
apt-get -qq update
apt-get -qq install -y awscli git python3-distutils
git clone https://github.com/adbailey4/rrna_scripts.git
cd rrna_scripts
checkout hdp_testing
cd ..
git clone https://github.com/tleonardi/pycoQC.git
cd pycoQC
pip install .
cd ..
apt install curl
curl -L https://github.com/lh3/minimap2/releases/download/v2.18/minimap2-2.18_x64-linux.tar.bz2 | tar -jxvf -
./minimap2-2.18_x64-linux/minimap2
export PATH="$PATH:/data/minimap2-2.18_x64-linux"

### WT_YPD 
* Wild Type (YS602) log phase 

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_YPD_basecalled_20210410_1830_MN20528_AGN282_f7dbe316/WT_YPD.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_YPD_basecalled_20210410_1830_MN20528_AGN282_f7dbe316/sequencing_summary.txt \
--output_dir \
/data/flongle_runs/output/WT_YPD \
--path_to_bin \
/root/signalAlign/bin \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_YPD_20210410_1830_MN20528_AGN282_f7dbe316/fast5 \
--name \
WT_YPD \
--threads \
96 

### WT_KOAC
* Wild Type (YS602) Potassium Acetate treated

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--path_to_bin \
/root/signalAlign/bin \
--threads \
96 \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_KOAC_basecalled_20210412_1911_MN20528_AGN151_7b2d7d7b/WT_KOAC.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_KOAC_basecalled_20210412_1911_MN20528_AGN151_7b2d7d7b/sequencing_summary.txt \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_KOAC_20210412_1911_MN20528_AGN151_7b2d7d7b/20210412_1911_MN20528_AGN151_7b2d7d7b/fast5 \
--output_dir \
/data/flongle_runs/output/WT_KOAC \
--name \
WT_KOAC 

### WT_CY
* Wild Type (YS602) cycloheximide treated

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--path_to_bin \
/root/signalAlign/bin \
--threads \
96 \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_CY_basecalled_20210414_1835_MN20528_AGG103_6ffffb4e/basecalled_20210414_1835_MN20528_AGG103_6ffffb4e/WT_CY.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_CY_basecalled_20210414_1835_MN20528_AGG103_6ffffb4e/basecalled_20210414_1835_MN20528_AGG103_6ffffb4e/sequencing_summary.txt \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/WT_CY_20210414_1835_MN20528_AGG103_6ffffb4e/20210414_1835_MN20528_AGG103_6ffffb4e/fast5 \
--output_dir \
/data/flongle_runs/output/WT_CY \
--name \
WT_CY

### mutant448_YPD
* Mutant YWD448a log phase
* This strain is missing pseudoU @ 18-759; 25-775(776).

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--path_to_bin \
/root/signalAlign/bin \
--threads \
96 \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant448_YPD_basecalled_20210405_2123_MN20528_AGM619_9cab14cd/mutant448_YPD.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant448_YPD_basecalled_20210405_2123_MN20528_AGM619_9cab14cd/sequencing_summary.txt \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant448_YPD_20210405_2123_MN20528_AGM619_9cab14cd/fast5 \
--output_dir \
/data/flongle_runs/output/mutant448_YPD \
--name \
mutant448_YPD


### mutant451_YPD
* Mutant YWD451a log phase
* This strain is missing pseudoU @ 18-1289.

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--path_to_bin \
/root/signalAlign/bin \
--threads \
96 \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutatn451_YPD_basecalled_20210415_0552_MN20528_AGG125_7a2113f4/basecalled_20210415_0552_MN20528_AGG125_7a2113f4/mutant451_YPD.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutatn451_YPD_basecalled_20210415_0552_MN20528_AGG125_7a2113f4/basecalled_20210415_0552_MN20528_AGG125_7a2113f4/sequencing_summary.txt \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant451_YPD_20210415_0552_MN20528_AGG125_7a2113f4/20210415_0552_MN20528_AGG125_7a2113f4/fast5 \
--output_dir \
/data/flongle_runs/output/mutant451_YPD \
--name \
mutant451_YPD


### mutant452_YPD
* Mutant YWD452a log phase
* This strain is missing 2'Ome @ 18-436.

python /data/rrna_scripts/src/rrna_analysis/scripts/inference_pipeline.py \
--reference \
/data/rrna_yeast_data/reference/yeast_25S_18S.fa \
--path_to_bin \
/root/signalAlign/bin \
--threads \
96 \
--fastq \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant452_YPD_basecalled_20210413_1855_MN20528_AGN165_7f59ecb0/basecalled_20210413_1855_MN20528_AGN165_7f59ecb0/mutant452_YPD.all.fastq \
--seq_summary \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant452_YPD_basecalled_20210413_1855_MN20528_AGN165_7f59ecb0/basecalled_20210413_1855_MN20528_AGN165_7f59ecb0/sequencing_summary.txt \
--fast5 \
/data/flongle_runs/intron.ucsc.edu/basecalls/mutant452_YPD_20210413_1855_MN20528_AGN165_7f59ecb0/20210413_1855_MN20528_AGN165_7f59ecb0/fast5 \
--output_dir \
/data/flongle_runs/output/mutant452_YPD \
--name \
mutant452_YPD
