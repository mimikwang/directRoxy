test_that("Convert script.R", {
  expect_error(roxy2HTML("script.R", tempdir()), NA)
})
