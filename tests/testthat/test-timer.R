context("timer")

test_that("timer", {
  timer <- Timer$new()
  expect_true(is.timer(timer))
})
