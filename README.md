
# HLADiversity

<!-- badges: start -->
<!-- badges: end -->

- The goal of the "HLADiversity" package is to estimate the distinctiveness of HLA
alleles.
- The package does the following:
  * calculates HLA allele frequency
  * plots HLA allele frequency
  * plots HLA allele count
  * compares the frequency of a target dataset to a reference population
  * plots the diversity of HLA alleles.
 
## Data Format
The input data has to be a HLA PED file in tsv format. 
The columns of the HLA PED file should be in the format shown below. 
 - 4-digit HLA class I and II alleles (A, B, C, DQA1, DQB1, DRB1, DPA1, DPB1)
 - HLA allele column name separator is "."
 - Include population column 

| A.1 | A.2 | B.1 | B.2 | C.1 | C.2 | DQA1.1 | DQA1.2 | DQB1.1 | DQB1.2 | DRB1.1 | DRB1.2 | DPA1.1 | DPA1.2 | DPB1.1 | DPB1.2
:---: | :---: | :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---:
A*30:02| A*32:01| B*42:01| B*44:03| C*04:01| C*17:01| DQA1*02:01| DQA1*04:01| DQB1*02:01| DQB1*04:02| DRB1*03:02| DRB1*07:01| DPA1*01:03| DPA1*03:03| DPB1*04:01| DPB1*04:02| AFR
A*02:03| A*33:03| B*38:02| B*58:01| C*03:02| C*07:02| DQA1*01:02| DQA1*03:01| DQB1*03:02| DQB1*06:09| DRB1*04:03| DRB1*13:02| DPA1*01:03| DPA1*02:02| DPB1*04:02| DPB1*394:01| EAS

If your HLA PED file does not have a population column, create one with the name of the dataset.
For example:
```r
hped$Population <- "1KG"
```

## Installation

You can install the development version of HLADiversity from
[GitHub](https://github.com) with:

``` r
devtools::install_github("yang-luo-lab/HLADiversity")
```

## Example

This is a basic example of how to run one of the functions:

``` r
library(HLADiversity)

plot_HLA_Diversity(example_data, gene = "A", ntop = 5)
#> Loading required package: pacman
#> Warning: Expected 2 pieces. Additional pieces discarded in 1 rows [1201].
#> Warning: Expected 2 pieces. Missing pieces filled with `NA` in 1 rows [1].
#> Warning: Expected 2 pieces. Additional pieces discarded in 1 rows [1200].
```

<img src="man/figures/README-example-1.png" width="100%" />

## Other functions included in the package

```
calculate_HLA_frequency()
Plot_HLA_allele_frequency()
Plot_HLA_allele_count()
Plot_HLA_target_vs_ref()
```

Find a description of each function and how to run it by invoking a question mark before the function in R console.
```
?calculate_HLA_frequency
```
