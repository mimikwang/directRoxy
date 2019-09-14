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
#' roxy2Rd("/path/to/script.R", "/path/output/")
#'
#' @import roxygen2 tools
#' @export
roxy2Rd <- function(input, output, env = NULL) {
  # Parse File for roxyblocks
  rblocks <- roxygen2::parse_file(input, env = env)

  # Save Output to temp directory
  if (!(dir.exists(file.path(tempdir(), "man")))) {
    dir.create(file.path(tempdir(), "man"))
  }
  roclet  <- roxygen2::rd_roclet()
  process <- roxygen2::roclet_process(roclet, rblocks, base_path = tempdir())
  roxygen2::roclet_output(roclet, process, base_path = tempdir())

  # Copy Rd to Output Directory
  list_files <- list.files(path = file.path(tempdir(), "man"), pattern = ".Rd$", full.names = TRUE)
  for (file in list_files) {
    file.copy(from = file, to = file.path(output, basename(file)))
  }
}
