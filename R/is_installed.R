#' Is rdkit installed?
#'
#' @return `TRUE` if installed, `FALSE` if not.
#'
#' @export
#'
#' @examples
#' is_installed_rdkit()
is_installed_rdkit <- function() {
  reticulate::py_available() && reticulate::py_module_available("rdkit")
}
