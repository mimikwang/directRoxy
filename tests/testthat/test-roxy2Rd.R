test_that("Convert script.R", {
  expect_error(roxy2Rd("script.R", tempdir()), NA)
})
