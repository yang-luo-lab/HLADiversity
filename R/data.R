#load libraries
if(!require(pacman)) install.packages("pacman")
pacman::p_load(stringr, plyr, RColorBrewer, vroom, janitor,
               patchwork, tidyverse, devtools, ggpubr, ggpmisc, purrr, data.table)

#Step 2: Read in input files
#Step 2.1: 4digit HLA PED file (A,B,C,DQA1,DQB1,DRB1,DPA1,DPB1)
#ref
test = vroom::vroom("/Users/rnanjala/Library/CloudStorage/OneDrive-Nexus365/PhD work/Gambian work/Data Analysis/KIR-HLA-LA/data/multi_ethnic_reference.hped")
example_data <- test %>%
  dplyr::rename(Population = ethnicity) %>%
  dplyr::rename(A.1 = A1) %>%
  dplyr::rename(A.2 = A2) %>%
  dplyr::rename(B.1 = B1) %>%
  dplyr::rename(B.2 = B2) %>%
  dplyr::rename(C.1 = C1) %>%
  dplyr::rename(C.2 = C2) %>%
  dplyr::rename(DQA1.1 = DQA11) %>%
  dplyr::rename(DQA1.2 = DQA12) %>%
  dplyr::rename(DQB1.1 = DQB11) %>%
  dplyr::rename(DQB1.2 = DQB12) %>%
  dplyr::rename(DRB1.1 = DRB11) %>%
  dplyr::rename(DRB1.2 = DRB12) %>%
  dplyr::rename(DPA1.1 = DPA11) %>%
  dplyr::rename(DPA1.2 = DPA12) %>%
  dplyr::rename(DPB1.1 = DPB11) %>%
  dplyr::rename(DPB1.2 = DPB12)

#target_data
targt = vroom::vroom("/Users/rnanjala/Library/CloudStorage/OneDrive-Nexus365/PhD work/Gambian work/Data Analysis/KIR-HLA-LA/data/target_data_GGVP.hped")

