
<!-- README.md is generated from README.Rmd. Please edit that file -->

# datasummary

<!-- badges: start -->

<!-- badges: end -->

The goal of datasummary is to summary data by group. The `group_summary`
function will calculate the number of rows, numeric columns’ mean value
and categorical columns’ number of unique values for each group.

## Installation

You can install the development version of datasummary like so:

Package installation can be done directly by calling
`devtools::install_github("circle117/datasummary")`

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(datasummary)
## basic example code
suppressPackageStartupMessages(library(tidyverse))
group_summary(penguins, species, island)
#> # A tibble: 5 × 9
#> # Groups:   species [3]
#>   species   island   mean_bill_len mean_bill_dep mean_flipper_len mean_body_mass
#>   <fct>     <fct>            <dbl>         <dbl>            <dbl>          <dbl>
#> 1 Adelie    Biscoe            39.0          18.4             189.          3710.
#> 2 Adelie    Dream             38.5          18.2             190.          3701.
#> 3 Adelie    Torgers…          39.0          18.5             192.          3709.
#> 4 Chinstrap Dream             48.8          18.4             196.          3733.
#> 5 Gentoo    Biscoe            47.6          15.0             217.          5092.
#> # ℹ 3 more variables: mean_year <dbl>, num_of_unique_sex <int>, n <int>
```
