#' Install rdkit and its dependencies
#'
#' @param ... Other arguments passed to [reticulate::py_install()].
#' @param envname The name or full path of the environment in which
#'   rdkit is installed. Default is `r-rdkit`.
#' @param new_env Logical. If `TRUE`, the specified Python environment
#'   will be deleted and recreated if it already exists.
#'   Defaults to `TRUE` only when using the default environment name.
#'
#' @return Invisibly returns `NULL`. Primarily used for its side effect
#'   of installing the Python package in the specified environment.
#'
#' @export
#'
#' @examplesIf is_installed_rdkit()
#' install_rdkit()
install_rdkit <- function(
    ...,
    envname = "r-rdkit",
    new_env = identical(envname, "r-rdkit")) {
  if (new_env && reticulate::virtualenv_exists(envname)) reticulate::virtualenv_remove(envname)
  reticulate::py_install(packages = "rdkit", envname = envname, ...)
}
