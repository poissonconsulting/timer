# R6 Timer Class

A simple timer as an R6 class.

The timer has four functions: `$start()`, `$stop()`, `$reset()` and
`$elapsed()`. The `$elapsed()` function returns the elapsed wall clock
time (as opposed to CPU time) as an object of class
`lubridate::Duration`.

## Format

An [R6Class](https://r6.r-lib.org/reference/R6Class.html) generator
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

### `Timer$is_running()`

#### Usage

    Timer$is_running()

------------------------------------------------------------------------

### `Timer$elapsed()`

#### Usage

    Timer$elapsed()

------------------------------------------------------------------------

### `Timer$reset()`

#### Usage

    Timer$reset()

------------------------------------------------------------------------

### `Timer$start()`

#### Usage

    Timer$start()

------------------------------------------------------------------------

### `Timer$stop()`

#### Usage

    Timer$stop()

------------------------------------------------------------------------

### `Timer$clone()`

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
#> [1] "0.000816583633422852s"
timer$elapsed()
#> [1] "0.00383591651916504s"

# stop the timer
timer$stop()

# time elapsed is now fixed
timer$elapsed()
#> [1] "0.00529789924621582s"
timer$elapsed()
#> [1] "0.00529789924621582s"

# because timer is an object of class R6 use the clone() function
# to make a copy
timer2 <- timer$clone()

# reset the timer
timer$reset()
timer$elapsed()
#> [1] "0s"

# timer2 is not reset
timer2$elapsed()
#> [1] "0.00529789924621582s"
```
