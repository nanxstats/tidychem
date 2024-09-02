#' Global reference to RDKit
#'
#' Global reference to RDKit which will be initialized in `.onLoad`.
#'
#' @importFrom reticulate import
#'
#' @export rdkit
rdkit <- NULL

.onLoad <- function(libname, pkgname) {
  reticulate::use_virtualenv("r-rdkit", required = FALSE)
  rdkit <<- reticulate::import("rdkit", delay_load = TRUE)
}
