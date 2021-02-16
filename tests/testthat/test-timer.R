test_that("timer", {
  expect_is(Timer, "R6ClassGenerator")

  timer <- Timer$new()
  expect_true(is.timer(timer))
})

test_that("timer starts and stops", {
  timer <- Timer$new()

  expect_false(timer$is_running())
  timer$start()
  expect_true(timer$is_running())
  timer$stop()
  expect_false(timer$is_running())
  timer$start()
  expect_true(timer$is_running())
  timer$stop()
  expect_false(timer$is_running())
  expect_warning(timer$stop(), "timer is not running")
  expect_false(timer$is_running())
  timer$start()
  expect_true(timer$is_running())
  expect_warning(timer$start(), "timer is already running")
  expect_true(timer$is_running())
  timer$stop()$start()
  expect_true(timer$is_running())
  timer$reset()
  expect_false(timer$is_running())
})

test_that("elapsed time", {
  timer <- Timer$new()

  expect_gt_os <- function (x, y) {
    if (.Platform$OS.type == "unix") {
      expect_gt(x, y)
    } else
      expect_gte(x, y)
  }

  expect_lt_os <- function (x, y) {
    if (.Platform$OS.type == "unix") {
      expect_lt(x, y)
    } else
      expect_lte(x, y)
  }

  expect_is(timer$elapsed(), "Duration")
  expect_equal(as.numeric(timer$elapsed()), 0)
  timer$start()
  timer$stop()
  expect_gt_os(as.numeric(timer$elapsed()), 0)
  elapsed1 <- timer$elapsed()
  timer$start()
  timer$stop()
  expect_gt_os(as.numeric(timer$elapsed()), as.numeric(elapsed1))
  timer$reset()
  expect_equal(as.integer(timer$elapsed()), 0L)
  timer$start()
  expect_lt_os(as.numeric(timer$elapsed()), as.numeric(timer$elapsed()))
  timer$stop()
  expect_identical(timer$elapsed(), timer$elapsed())
})
