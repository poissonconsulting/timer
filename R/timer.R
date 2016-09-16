#' Is Timer
#'
#' @param x The object to test.
#' @return A flag.
#' @export
is.timer <- function(x) {
    inherits(x, "R6") && inherits(x, "Timer")
}

#' R6 Timer Class
#'
#' @export
Timer <- R6::R6Class(
  "Timer",
  public = list(
    is_running = function() {
      return(!is.null(private$start_time))
    },
    elapsed = function() {
      if (!self$is_running())
        return(private$duration)
      private$duration + as.duration(interval(private$start_time, now()))
    },
    reset = function() {
      private$duration = lubridate::dseconds(0)
      private$start_time = NULL
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
    }),
  private = list(
    duration = lubridate::dseconds(0),
    start_time = NULL
  )
)
