#' @name roxy2Rd
#'
#' @title roxy2Rd
#'
#' @description Convert roxygen2 tags directly to Rd
#'
#' @details
#' Takes, as input, an R script with roxygen2 tags and outputs the
#' Rd file to an output folder
#'
#' @param input, character, path to R file with roxygen2 tags
#' @param output, character, path to output file to save Rd files
#' @param env, environment, environment to run parse_file.  Defaults to \code{NULL}
#'
#' @return
#' This function doesn't return anything
#'
#' @examples
#' input_path <- system.file("examples/script.R", package = "directRoxy")
#' roxy2Rd(input_path, tempdir())
#'
#' @import roxygen2
#' @export
roxy2Rd <- function(input, output, env = NULL) {
  list_files <- .roxytotemp(input, output, env)
  for (file in list_files) {
    file.copy(from = file, to = file.path(output, basename(file)))
  }
  unlink(file.path(output, "man"), recursive = TRUE)
}
