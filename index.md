[![R-CMD-check](https://github.com/KWB-R/sema.berlin.utils/workflows/R-CMD-check/badge.svg)](https://github.com/KWB-R/sema.berlin.utils/actions?query=workflow%3AR-CMD-check)
[![pkgdown](https://github.com/KWB-R/sema.berlin.utils/workflows/pkgdown/badge.svg)](https://github.com/KWB-R/sema.berlin.utils/actions?query=workflow%3Apkgdown)
[![codecov](https://codecov.io/github/KWB-R/sema.berlin.utils/branch/master/graphs/badge.svg)](https://codecov.io/github/KWB-R/sema.berlin.utils)
[![Project Status](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/sema.berlin.utils)]()

This package provides the functions used for
the uncertainty analysis in KWB-project sema-berlin-2.

## Installation

For details on how to install KWB-R packages checkout our [installation tutorial](https://kwb-r.github.io/kwb.pkgbuild/articles/install.html).

```r
### Optionally: specify GitHub Personal Access Token (GITHUB_PAT)
### See here why this might be important for you:
### https://kwb-r.github.io/kwb.pkgbuild/articles/install.html#set-your-github_pat

# Sys.setenv(GITHUB_PAT = "mysecret_access_token")

# Install package "remotes" from CRAN
if (! require("remotes")) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Install KWB package 'sema.berlin.utils' from GitHub

remotes::install_github("KWB-R/sema.berlin.utils")
```
