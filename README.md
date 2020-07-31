[![Appveyor build Status](https://ci.appveyor.com/api/projects/status/github/KWB-R/sema.berlin.utils?branch=master&svg=true)](https://ci.appveyor.com/project/KWB-R/sema-berlin-utils/branch/master)
[![Travis build Status](https://travis-ci.org/KWB-R/sema.berlin.utils.svg?branch=master)](https://travis-ci.org/KWB-R/sema.berlin.utils)
[![codecov](https://codecov.io/github/KWB-R/sema.berlin.utils/branch/master/graphs/badge.svg)](https://codecov.io/github/KWB-R/sema.berlin.utils)
[![Project Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/sema.berlin.utils)]()

# sema.berlin.utils

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

## Documentation

Release: [https://kwb-r.github.io/sema.berlin.utils](https://kwb-r.github.io/sema.berlin.utils)

Development: [https://kwb-r.github.io/sema.berlin.utils/dev](https://kwb-r.github.io/sema.berlin.utils/dev)
