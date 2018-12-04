options(usethis.full_name = "atusy")
library(pacman)
p_load_gh("mkearney/pkgverse")
p_load(rmarkdown, testthat, roxygen2, here)

atusyverse <- c(
  "data.table" ,"dplyr",  "forcats", "ggplot2", "here", "pacman", "pipeR", "purrr", "stringr", "tidyr"
)

## create tidyweb pkgverse
pkgverse(
  "atusyverse",
  atusyverse,
  keep = here::here(..),
  use = c("readme_rmd", "rstudio", "mit_license", "git"),
  install_if = TRUE
)
