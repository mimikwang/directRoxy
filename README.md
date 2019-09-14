# directRoxy
[![Build Status](https://travis-ci.org/mimikwang/directRoxy.svg?branch=master)](https://travis-ci.org/mimikwang/directRoxy) [![codecov](https://codecov.io/gh/mimikwang/directRoxy/branch/master/graph/badge.svg)](https://codecov.io/gh/mimikwang/directRoxy)

## Overview
The purpose of directRoxy is to directly generate Rd and HTML files from R scripts
with roxygen2 comments without having the scripts be in an R package

## Installation
```{r}
devtools::install_github("mimikwang/directRoxy")
```

## Getting Started
```{r}
library(directRoxy)
```

First, add roxygen2 tags to your script.
```{r}
#' @name script
#' 
#' @title script
#' 
#' @description Description here
#' 
#' @details Details here
#' 
#' @param x, character, to be printed
#' 
#' @return
#' A character matching input x
#' 
#' @examples
#' script(x)
script <- function(x) {
  print(x)
}
```

Next, use `roxy2Rd` to generate Rd files or `roxy2HTML` to generate HTML files.

```{r}
roxy2Rd("script.R", "/output/path")
roxy2HTML("script.R", "/output/path")
```
