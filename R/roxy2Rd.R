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
#' \dontrun{
#' roxy2Rd("/path/to/script.R", "/path/output/")
#' }
#'
#' @import roxygen2
#' @export
roxy2Rd <- function(input, output, env = NULL) {
  list_files <- .roxytotemp(input, tempdir(), env)
  for (file in list_files) {
    file.copy(from = file, to = file.path(output, basename(file)))
  }
}
