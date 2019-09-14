#' @name roxy2HTML
#'
#' @title roxy2HTML
#'
#' @description Convert roxygen2 tags directly to html
#'
#' @details
#' Takes, as input, an R script with roxygen2 tags and outputs the
#' HTML file to an output folder
#'
#' @param input, character, path to R file with roxygen2 tags
#' @param output, character, path to output file to save HTML files
#' @param env, environment, environment to run parse_file.  Defaults to \code{NULL}
#' @param ..., additional parameters to be passed to Rd2HTML
#'
#' @return
#' This function doesn't return anything
#'
#' @examples
#' roxy2HTML("/path/to/script.R", "/path/output/")
#'
#' @import roxygen2 tools
#' @export
roxy2HTML <- function(input, output, env = NULL, ...) {
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
    tools::Rd2HTML(file, out = file.path(output, paste0(tools::file_path_sans_ext(basename(file)), ".html")), ...)
  }
}
