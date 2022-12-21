## Organization
`E_coli_core_genome/`: contains the scripts to generate a list of 'core' genes for core vs accessory GCI analysis. A static version of this pipeline used in this manuscript is provided here, while a live version can be found at [https://github.com/mmcguffi/E_coli_core_genome](https://github.com/mmcguffi/E_coli_core_genome).

`R_code/`: contains the scripts used to generate estimates of codon usage bias using ROC SEMPPR.

`1a-process_expression_data_ECOLI.ipynb`: processing the full, sparse, and neutral *E. coli* RNA data sets from [Sastry, A. V. et al. (2019)](https://www.nature.com/articles/s41467-019-13483-w).

`1b-process_expression_data_SCER.ipynb`: processing the *S. cerevisiae* RNA and protein data sets from [Yu, R. et al. (2021)](https://elifesciences.org/articles/65722.pdf).

`1c-process_ecoli_proteome_data.ipynb`: processing the *E. coli* protein data set from [Schmidt, A. et al. (2016)](https://www.nature.com/articles/nbt.3418).

`2-compile_gene_metrics.ipynb`: compiles codon usage bias metrics (CAI, tAI, ROC SEMPPR) for *E. coli* and *S. cerevisiae* genes.

`3-explore_expression_and_growth.Rmd`: examines correlation between conditions and correlations between expressiona and growth rate for all data sets. Produces Figures 2 and 4 using the full *E. coli* transcript data set, and Supplementary Figures S4-S8 on the remaining data sets.

`4-explore_cub_predictors.Rmd`: examines correlation between expression and CUB, and includes a regression analysis to evaluate predictors of CUB (expression, GCI, and combos). Produces Figure 3 and 5 using the full *E. coli* transcript data set and CAI metric, and Supplementary Figures S1-S3 and S9-13 on the remaining CUB metrics and data sets.

`5-go_analysis_gci.Rmd`: includes GO enrichment analyses for genes with positive or negative GCI values, and examines the distribution of GCI values for core vs. accessory genes and essential vs. non-essential genes in *E. coli*. Produces Figure 6 using the full *E. coli* transcript data set.
