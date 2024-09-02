# tidychem <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/nanxstats/tidychem/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nanxstats/tidychem/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Read, preprocess, and featurize chemical data using RDKit.

A lightweight R interface for accessing RDKit via the [RDKit Python API](https://www.rdkit.org/docs/api-docs.html).

![](man/figures/tidychem-workflow.png)

## Installation

You can install tidychem from GitHub:

```r
remotes::install_github("nanxstats/tidychem")
```

## Install rdkit

A simple way to install the Python package rdkit that tidychem can discover
easily, is to run the helper function `tidychem::install_rdkit()`.
By default, it installs rdkit into an virtual environment named `r-rdkit`.

```r
tidychem::install_rdkit()
```

This follows the best practices suggested by the reticulate vignette
[Managing an R Package's Python
Dependencies](https://rstudio.github.io/reticulate/articles/python_dependencies.html).
There are also recommendations in the vignette on how to manage multiple
R packages with different Python dependencies.

## Usage

```r
library("tidychem")

"smi-multiple.smi" |>
  tidychem_example() |>
  read_smiles() |>
  fp_morgan()
```
