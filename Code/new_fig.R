library(tidyverse)
library(glue)
library(pheatmap)
library(viridis)
library(cowplot)
library(ggtext)

path_to_data <- '/Users/mackenziejohnson/Documents/grad_school/wilke_lab/Growth-expression-translation/Data/processed_data/'
path_to_figures <- '/Users/mackenziejohnson/Documents/grad_school/wilke_lab/Growth-expression-translation/Manuscript/Figures'

data_key <- tibble(
  set = c(
    'ecoli_full', 
    'ecoli_sparse', 
    'ecoli_prot',
    'scer_rna', 
    'scer_prot'
  ),
  meta_file = c(
    glue({path_to_data}, 'processed_metadata_ecoli.tsv'),
    glue({path_to_data}, 'processed_metadata_ecoli_SPARSE.tsv'),
    glue({path_to_data}, 'processed_metadata_ecoli_PROTEIN.tsv'),
    glue({path_to_data}, 'processed_metadata_scer_RNA.tsv'),
    glue({path_to_data}, 'processed_metadata_scer_PROTEIN.tsv')
  ),
  expression_file = c(
    glue({path_to_data}, 'processed_expression_ecoli.tsv'),
    glue({path_to_data}, 'processed_expression_ecoli_SPARSE.tsv'),
    glue({path_to_data}, 'processed_expression_ecoli_PROTEIN.tsv'),
    glue({path_to_data}, 'processed_expression_scer_RNA.tsv'),
    glue({path_to_data}, 'processed_expression_scer_PROTEIN.tsv')
  ),
  summary_file = c(
    glue({path_to_data}, 'processed_expression_summary_ecoli.tsv'),
    glue({path_to_data}, 'processed_expression_summary_ecoli_SPARSE.tsv'),
    glue({path_to_data}, 'processed_expression_summary_ecoli_PROTEIN.tsv'),
    glue({path_to_data}, 'processed_expression_summary_scer_RNA.tsv'),
    glue({path_to_data}, 'processed_expression_summary_scer_PROTEIN.tsv')
  )
)

# select dataset for analysis
data_tag <- "ecoli_full"

# get relevant file names for data set of interest
data_key %>% 
  filter(set == data_tag) -> analysis_files

# read in data
meta_df <- read_tsv(analysis_files$meta_file)

exp_df <- read_tsv(analysis_files$expression_file)

exp_sum_df <- read_tsv(analysis_files$summary_file)

gene_df <- read_tsv(
  glue(
    '/Users/mackenziejohnson/Documents/grad_school/wilke_lab/Growth-expression-translation/Data/ecoli_info/', 
    'current_ecoli_master_table.tsv'
  )
)

# join data sets
growth_data <- meta_df %>% 
  select(c(Simple_sample_id, `Growth Rate (1/hr)`))

gene_data <- gene_df %>% 
  mutate(`log-TPM` = locus_tag) %>% 
  select(`log-TPM`, CAI)

full_df <- exp_df %>%
  gather(-`log-TPM`, key = "Simple_sample_id", value = "expression") %>% 
  left_join(., growth_data, by = "Simple_sample_id") %>% 
  left_join(., gene_data, by = "log-TPM") 

# create figure after reordering data
# heatmap of genes x conditions, where conditions are sorted by growth rate and genes are sorted by CAI

full_df <- full_df %>% 
  rename(
    "gene" = `log-TPM`,
    "condition" = `Simple_sample_id`,
    "growth_rate" = `Growth Rate (1/hr)`
  )

full_df %>% 
  arrange(condition, desc(growth_rate)) %>% # sort conditions by growth rate
  arrange(gene, desc(CAI)) %>%  # sort genes by CAI
  View()

fig_full <- full_df %>% 
  arrange(condition, desc(growth_rate)) %>% # sort conditions by growth rate
  arrange(gene, desc(CAI)) %>% 
  ggplot(aes(x = gene, y = condition, fill = expression)) +
  geom_tile() + 
  theme(axis.text = element_blank())

fig_full


