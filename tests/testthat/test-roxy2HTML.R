test_that("Convert script.R", {
  input_path <- system.file("examples/script.R", package = "directRoxy")
  expect_error(roxy2HTML(input_path, tempdir()), NA)
})
