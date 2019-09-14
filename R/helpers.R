#' @import roxygen2
.roxytotemp <- function(input, dir_out, env) {
  # Parse File for roxyblocks
  rblocks <- roxygen2::parse_file(input, env = env)

  # Save output to temp directory
  if (!dir.exists(file.path(dir_out, "man"))) {
    dir.create(file.path(dir_out, "man"))
  }

  roclet  <- roxygen2::rd_roclet()
  process <- roxygen2::roclet_process(roclet, rblocks, base_path = dir_out)
  roxygen2::roclet_output(roclet, process, base_path = dir_out)

  list_files <- list.files(path = file.path(dir_out, "man"), pattern = ".Rd$", full.names = TRUE)
  return(list_files)
}
