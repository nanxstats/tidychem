# tidychem  <a href="https://nanx.me/tidychem/"><img src="man/figures/logo.png" align="right" height="180" /></a>

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/nanxstats/tidychem/workflows/R-CMD-check/badge.svg)](https://github.com/nanxstats/tidychem/actions)
<!-- badges: end -->

Read, preprocess, and featurize chemical data using RDKit.

The `tidychem` package offers a lightweight R interface for accessing RDKit via the [RDKit Python API](https://www.rdkit.org/docs/api-docs.html).

![](https://i.imgur.com/ZEeUmfW.png)

## Installation

First of all, [install RDKit](https://www.rdkit.org/docs/Install.html). Make sure it is [discoverable by reticulate](https://rstudio.github.io/reticulate/articles/versions.html).

Then install `tidychem` with:

```r
remotes::install_github("nanxstats/tidychem")
```

## License

tidychem is free and open source software, licensed under GPL-3.
