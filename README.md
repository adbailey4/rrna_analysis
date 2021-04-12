# Ares Lab rRNA

## 18S and 25S rRNA Yeast Data
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


## [References](reference/reference.md)

## [Data Preprocessing](notes/data_preprocessing.md)

## [QC Results](pycoQC/qc_reports.md)

## [Modification Positions](reference/mod_files/mod_files.md)
* [.position file creation notebook](notebooks/position_file_creation.ipynb)
* [subset .position files](notebooks/filter_mods.ipynb)
* [Ribovision visualization](reference/ribovision/ribovision.md)

## De Novo Site Prediction
* [Tombo Preprocessing](tombo/tombo.md)
* [Nanocompore Preprocessing](nanocompore/nanocompore.md)
* [Analysis Notebook](notebooks/de_novo_site_prediction.ipynb)

## Supervised Training
* [Analysis Pipeline](k8_configs/k8s.md#Supervised)

## Read Clustering



