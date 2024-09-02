#' Print parsed molecules object.
#'
#' @param x An object of class `tidymol`.
#' @param ... Additional parameters for [print()] (not used).
#'
#' @method print tidymol
#'
#' @importFrom utils head str
#'
#' @export
#'
#' @examplesIf is_installed_rdkit()
#' parse_smiles("Cc1ccccc1")
#' parse_smiles(c("Cc1ccccc1", "CCN(CC)CC"))
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
#' @param x An object of class `tidyfps`.
#' @param ... Additional parameters for [print()] (not used).
#'
#' @method print tidyfps
#'
#' @export
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_topo(mol)
#' fp_topo(mols)
#'
#' fp_topo(mol, explicit = TRUE)
#' fp_topo(mols, explicit = TRUE)
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
#' @param x An object of class `tidydesc`.
#' @param ... Additional parameters for [print()] (not used).
#'
#' @method print tidydesc
#'
#' @export
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' desc_2d(mol)
#' desc_2d(mols)
print.tidydesc <- function(x, ...) {
  cat_sys("tidychem descriptors: ", nrow(x), " molecules x ", ncol(x), " descriptors", "\n")
  str(x)
}
