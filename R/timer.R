#' Is Timer
#'
#' Tests whether x is an object of class \code{\link{Timer}}.
#'
#' @param x The object to test.
#' @return A flag indicating whether the test was positive.
#' @export
is.timer <- function(x) {
  inherits(x, "R6") && inherits(x, "Timer")
}

#' R6 Timer Class
#'
#' @description A simple timer as an R6 class.
#'
#' The timer has four functions: \code{$start()}, \code{$stop()}, \code{$reset()} and \code{$elapsed()}.
#' The \code{$elapsed()} function returns the elapsed wall clock time (as opposed to CPU time)
#' as an object of class \code{lubridate::Duration}.
#'
#' @format An [R6Class] generator object.
#' @examples
#' # instantiate a new timer
#' timer <- Timer$new()
#'
#' # no time has elapsed because the timer has not started
#' timer$elapsed()
#'
#' # start the timer
#' timer$start()
#'
#' # get the time elapsed (as an object of class lubridate::Duration)
#' # time elapsed is increasing because the timer is still running
#' timer$elapsed()
#' timer$elapsed()
#'
#' # stop the timer
#' timer$stop()
#'
#' # time elapsed is now fixed
#' timer$elapsed()
#' timer$elapsed()
#'
#' # because timer is an object of class R6 use the clone() function
#' # to make a copy
#' timer2 <- timer$clone()
#'
#' # reset the timer
#' timer$reset()
#' timer$elapsed()
#'
#' # timer2 is not reset
#' timer2$elapsed()
#' @export
Timer <- R6::R6Class(
  "Timer",
  public = list(
    is_running = function() {
      return(!is.null(private$start_time))
    },
    elapsed = function() {
      if (!self$is_running()) {
        return(private$duration)
      }
      private$duration + as.duration(interval(private$start_time, now()))
    },
    reset = function() {
      private$duration <- lubridate::dseconds(0)
      private$start_time <- NULL
      invisible(self)
    },
    start = function() {
      if (self$is_running()) {
        warning("timer is already running")
      } else {
        private$start_time <- now()
      }
      invisible(self)
    },
    stop = function() {
      if (!self$is_running()) {
        warning("timer is not running")
      } else {
        private$duration <- self$elapsed()
        private$start_time <- NULL
      }
      invisible(self)
    }
  ),
  private = list(
    duration = lubridate::dseconds(0),
    start_time = NULL
  )
)
