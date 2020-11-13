# 18S and 25S rRNA Modification Sites

* The most complete dataset comes from [The complete chemical structure of Saccharomyces cerevisiae rRNA: partial pseudouridylation of U2345 in 25S rRNA by snoRNA snR9](https://academic.oup.com/nar/article-lookup/doi/10.1093/nar/gkw564)
And a good secondary article is [here](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0173940).
* The reference material for each modification status and percent modified is in the [supplemental](nar-01140-r-2016-File004.pdf) of Isobe et al.
* I copied over all the data into a tsv file called [`mod_file.csv`](mod_file.csv) 
    * NOTE: The 25S positions used a reference sequence which encoded the reference positions 2 bases off of the reference I use. See [reference.md](../reference.md) for more detail on reference selection
    * NOTE: I encoded >95% as just 95%.

## Position Files
* The conversion from mod_file.csv to positions files can be found in the [Preprocessing_yeast_rRNA](../notebooks/Preprocessing_yeast_rRNA.ipynb) notebook.
* NOTE: 25S pos 2346 has 3 possible variants and in the "modified" positions file I chose the most prevalent one.

* All mod positions and corresponding branches `yeast_18S_25S_variants.positions`
* Native `mod_files/yeast_18S_25S_modified.positions`
* IVT `yeast_18S_25S_canonical.positions`
* pseduoU knockdown `yeast_18S_25S_pseudoU_knockdown.positions`
* 2'-O methyl knock down `yeast_18S_25S_Omethyl_knockdown.positions`
 