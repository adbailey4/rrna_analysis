# Notebooks

## Active
### multiple_model_accuracy_comparison.ipynb   
* compare the accuracy of prediction across multiple models
* also plot how model delta is correlated with accuracy

### yeast_rrna_position_visualization.ipynb
* Trying to predict rna positions based on tombo and nanocompore data

### plot_sa_calling_consistancy.ipynb
* Plot accuracy comparison between depletions and ivt calling in order to determine the percent modifications of the depleted reads 


## Static

### Preprocessing_yeast_rRNA.ipynb
* converting `25S_mods.bed` and `18S_mods.bed` into the `yeast_18S_25S_mods.positions` file
* Create csv for secondary structure visualization via [ribovision](http://apollo.chemistry.gatech.edu/RiboVision/)
* Create signalAlign baseline models 

### embed_data_from_eventalign.ipynb
* Check to see if alignments from eventalign match signalalign

### filter_mods.ipynb
* Filter modifications based on their modification, percent modified in order to get more general information regarding accuracy using `plot_multiple_variant_accuracy.py`
                      
