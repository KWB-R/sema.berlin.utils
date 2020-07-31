# Set the name of your (!) new package
package <- "sema.uncert"

# Set the path to your (!) local folder to which GitHub repositories are cloned
repo_dir <- "~/github-repos"

# Set the path to the package directory
pkg_dir <- file.path(repo_dir, package)

# Create directory for R package
kwb.pkgbuild::create_pkg_dir(pkg_dir)

# Create a default package structure
withr::with_dir(pkg_dir, {kwb.pkgbuild::use_pkg_skeleton(package)})

author <- list(
  name = "Hauke Sonnenberg",
  orcid = "0000-0001-9134-2871"
)

description <- list(
  name = package,
  title = "Utillity Functions Used in sema.berlin Packages",
  desc  = "This package provides utility functions that are used in sema.berlin.* packages."
)

setwd(pkg_dir)

kwb.pkgbuild::use_pkg(
  author,
  description,
  version = "0.0.0.9000",
  stage = "experimental"
)

travis::use_travis_deploy(key_name_private = "id_rsa", endpoint = ".com")

kwb.pkgbuild::create_empty_branch_ghpages(repo = "sema.uncert")

### Add token GITHUB_PAT with acces to "private repos" to environment variable
### in TravisCI
### 1) Get: https://github.com/settings/tokens
### 2) Set: https://travis-ci.com/github/KWB-R/sema.uncert/settings
