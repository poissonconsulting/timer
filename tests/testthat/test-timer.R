context("timer")

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
})
