#' Global reference to RDKit
#'
#' Global reference to RDKit which will be initialized in \code{.onLoad}.
#'
#' @importFrom reticulate import
#'
#' @export rdkit
rdkit <- NULL

.onLoad <- function(libname, pkgname) {
  rdkit <<- reticulate::import("rdkit", delay_load = TRUE)
}
