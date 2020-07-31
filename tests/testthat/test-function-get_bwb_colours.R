test_that("get_bwb_colours() works", {

  f <- sema.berlin.utils::get_bwb_colours

  result <- f()

  expect_named(result)
  expect_is(result, "character")
  expect_true(all(c("green", "yellow", "orange", "red") %in% names(result)))
})
