# R6 Timer Class

A simple timer as an R6 class.

The timer has four functions: `$start()`, `$stop()`, `$reset()` and
`$elapsed()`. The `$elapsed()` function returns the elapsed wall clock
time (as opposed to CPU time) as an object of class
`lubridate::Duration`.

## Format

An [R6::R6Class](https://r6.r-lib.org/reference/R6Class.html) generator
object.

## Methods

### Public methods

- [`Timer$is_running()`](#method-Timer-is_running)

- [`Timer$elapsed()`](#method-Timer-elapsed)

- [`Timer$reset()`](#method-Timer-reset)

- [`Timer$start()`](#method-Timer-start)

- [`Timer$stop()`](#method-Timer-stop)

- [`Timer$clone()`](#method-Timer-clone)

------------------------------------------------------------------------

### Method `is_running()`

#### Usage

    Timer$is_running()

------------------------------------------------------------------------

### Method `elapsed()`

#### Usage

    Timer$elapsed()

------------------------------------------------------------------------

### Method `reset()`

#### Usage

    Timer$reset()

------------------------------------------------------------------------

### Method [`start()`](https://rdrr.io/r/stats/start.html)

#### Usage

    Timer$start()

------------------------------------------------------------------------

### Method [`stop()`](https://rdrr.io/r/base/stop.html)

#### Usage

    Timer$stop()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Timer$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
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
#> [1] "0.000921726226806641s"
timer$elapsed()
#> [1] "0.00426530838012695s"

# stop the timer
timer$stop()

# time elapsed is now fixed
timer$elapsed()
#> [1] "0.00598955154418945s"
timer$elapsed()
#> [1] "0.00598955154418945s"

# because timer is an object of class R6 use the clone() function
# to make a copy
timer2 <- timer$clone()

# reset the timer
timer$reset()
timer$elapsed()
#> [1] "0s"

# timer2 is not reset
timer2$elapsed()
#> [1] "0.00598955154418945s"
```
