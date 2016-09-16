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
    start = function() {
      if (self$is_running()) {
        warning("timer is already running")
      } else {
        private$start_time <- now() %>% with_tz("UTC")
      }
      invisible(self)
    },
    stop = function() {
      if (!self$is_running()) {
        warning("timer is not running")
      } else {
        private$start_time <- NULL
      }
      invisible(self)
    }),
  private = list(
    start_time = NULL
  )
)
