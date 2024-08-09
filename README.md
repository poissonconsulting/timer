
<!-- README.md is generated from README.Rmd. Please edit that file -->

# timer

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R build
status](https://github.com/poissonconsulting/timer/workflows/R-CMD-check/badge.svg)](https://github.com/poissonconsulting/timer/actions)
[![Codecov test
coverage](https://codecov.io/gh/poissonconsulting/timer/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/timer)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit)
[![CRAN
status](https://www.r-pkg.org/badges/version/timer)](https://cran.r-project.org/package=timer)
<!-- badges: end -->

## Introduction

An R package implementing a simple timer as an R6 class.

The timer has four functions: `$start()`, `$stop()`, `$reset()` and
`$elapsed()`. The `$elapsed()` function returns the elapsed wall clock
time (as opposed to CPU time) as an object of class
`lubridate::Duration`.

## Utilisation

``` r
library(timer)

# instantiate a new timer
timer <- Timer$new()

# no time has elapsed because the timer has not started
timer$elapsed()
#> [1] "0s"

# start the timer
timer$start()

# get the time elapsed (as an object of class lubridate::Duration)
# time elapsed is increasing because the timer is still running
timer$elapsed()
#> [1] "0.00109100341796875s"
timer$elapsed()
#> [1] "0.00305414199829102s"

# stop the timer
timer$stop()

# time elapsed is now fixed
timer$elapsed()
#> [1] "0.00392317771911621s"
timer$elapsed()
#> [1] "0.00392317771911621s"

# because timer is an object of class R6 use the clone() function
# to make a copy
timer2 <- timer$clone()

# reset the timer
timer$reset()
timer$elapsed()
#> [1] "0s"

# timer2 is not reset
timer2$elapsed()
#> [1] "0.00392317771911621s"
```

## Installation

To install the latest development version from
[r-universe](https://poissonconsulting.r-universe.dev/timer).

``` r
install.packages("hmstimer", repos = c("https://poissonconsulting.r-universe.dev", "https://cloud.r-project.org"))
```

To install the latest development version from
[GitHub](https://github.com/poissonconsulting/timer)

``` r
# install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))
pak::pak("poissonconsulting/timer")
```

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/timer/issues).

[Pull requests](https://github.com/poissonconsulting/timer/pulls) are
always welcome.

## Code of Conduct

Please note that the timer project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
