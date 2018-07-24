#' Print parsed molecules object.
#'
#' Print parsed molecules object.
#'
#' @param x An object of class \code{tidymol}.
#' @param ... Additional parameters for \code{\link{print}} (not used).
#'
#' @method print tidymol
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @importFrom utils head str
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' parse_smiles("Cc1ccccc1")
#' parse_smiles(c("Cc1ccccc1", "CCN(CC)CC"))
#' }

print.tidymol <- function(x, ...) {
  k <- length(x)
  cat_sys("tidychem molecules: ", k, "\n")
  cat(str(head(x), no.list = TRUE))
  if (k > 6L) cat(" $ : ...")
}

#' Print molecular fingerprints object.
#'
#' Print molecular fingerprints object.
#'
#' @param x An object of class \code{tidyfps}.
#' @param ... Additional parameters for \code{\link{print}} (not used).
#'
#' @method print tidyfps
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_topo(mol)
#' fp_topo(mols)
#'
#' fp_topo(mol, explicit = TRUE)
#' fp_topo(mols, explicit = TRUE)
#' }

print.tidyfps <- function(x, ...) {
  if (c("matrix") %in% class(x)) {
    cat_sys("tidychem fingerprints: ", nrow(x), " molecules \n")
    str(x)
  } else {
    k <- length(x)
    cat_sys("tidychem fingerprints: ", k, " molecules \n")
    cat(str(head(x), no.list = TRUE))
    if (k > 6L) cat(" $ : ...")
  }
}

#' Print molecular descriptors object.
#'
#' Print molecular descriptors object.
#'
#' @param x An object of class \code{tidydesc}.
#' @param ... Additional parameters for \code{\link{print}} (not used).
#'
#' @method print tidydesc
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @export
#'
#' @examples
#' \dontrun{
#'
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' desc_2d(mol)
#' desc_2d(mols)
#' }

print.tidydesc <- function(x, ...) {
  cat_sys("tidychem descriptors: ", nrow(x), " molecules x ", ncol(x), " descriptors", "\n")
  str(x)
}
