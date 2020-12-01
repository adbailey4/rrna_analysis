#### Reference Sequence Search
* Data from Jason (SacCer3)
    * "3) a .bed file of annotated pseudo U and 2’O-me sites (if you are interested) based on this online database http://www.sysu.edu.cn/ however it looks like it is no longer available. 4) a genome file containing only a single copy of the yeast 37S rRNA locus." 
    * 20Me yeast bed
        * [2O_methyl_yeast.bed.bed](mod_files/misc/2O_methyl_yeast.bed)
    * PseudoU yeast bed
        * [pseduo_u_yeast.bed](mod_files/misc/pseduo_u_yeast.bed)
    * 37S 
        * [37S.fa](ares_rRNA/reference/search/37S.fa)

* Good Info
    * https://www.yeastgenome.org/locus/S000006482
    
* References
    * 18S - 1800bp
        * https://www.yeastgenome.org/locus/S000006482/sequence
            * RDN18-1 Location: Chromosome XII 455933..457732
                * [search/S288C_RDN18-1_RDN18-1_genomic.fa](search/S288C_RDN18-1_RDN18-1_genomic.fa) 
        * http://fungi.ensembl.org/
            * Chromosome XII: 455,933-457,732
            * Chromosome XII: 465,070-466,869
        * https://rnacentral.org/rna/URS00005F2C2D/559292
            * [search/18S_rRNA_yeast.fa](search/18S_rRNA_yeast.fa)
        * https://hgdownload.soe.ucsc.edu/goldenPath/sacCer3/chromosomes/
            * chrXII:455933-457732
            * chrXII:465070-466869
            * [search/yeast_ref.fa](search/yeast_ref.fa)
    * 25S - 3396bp
        * https://www.yeastgenome.org/locus/S000006484
            * chrXII:455181..451786    
            * [search/S288C_RDN25-1_RDN25-1_genomic.fa](search/S288C_RDN25-1_RDN25-1_genomic.fa)
        * https://genome.ucsc.edu/
            * chrXII:451786-455181
            * chrXII:460923-464318
        * https://rnacentral.org/rna/URS00005F2C2D/559292
            * XII	451,786-455,181
            * XII	460,923-464,318
            * [search/25S_rRNA_yeast.fa](search/25S_rRNA_yeast.fa)

* Final Reference Sequence
    * combined from https://www.yeastgenome.org/ and matched with other searches for the genome
    * [__yeast_25S_18S.fa__](yeast_25S_18S.fa)

## Nucleotide Encodings 
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


* Mod ambig character model is at [`mod_variants.model`](mod_variants.model)