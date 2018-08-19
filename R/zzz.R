#' Global reference to RDKit.
#'
#' Global reference to RDKit which will be initialized in \code{.onLoad}.
#'
#' @importFrom reticulate import
#'
#' @export rdkit
rdkit <- NULL

.onLoad <- function(libname, pkgname) {
  # use superassignment to update global reference to scipy
  rdkit <<- reticulate::import("rdkit", delay_load = TRUE)
}
