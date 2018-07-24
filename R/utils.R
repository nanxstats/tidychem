#' Generate path to the example data.
#'
#' Generate path to the example data in the tidychem package.
#'
#' @param file Filename of the example dataset in the tidychem package,
#' under the \code{inst/extdata/} directory.
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @export tidychem_example

tidychem_example <- function(file) {
  system.file("extdata", file, package = "tidychem", mustWork = TRUE)
}

#' Get RDKit version.
#'
#' Return the version number of the installed RDKit.
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @export rdkit_version
#'
#' @examples
#' \dontrun{
#'
#' rdkit_version()
#' }
rdkit_version <- function() {
  rdkit$rdBase$rdkitVersion
}

# count the number of molecules in the SDF text block
#' @importFrom stringr str_count
count_mol_sdf <- function(x) str_count(x, "M  END")

# parse molecule from a SMILES string
mol_from_smiles <- function(x) rdkit$Chem$MolFromSmiles(as.character(x))

# stylize cli output
#' @importFrom crayon green
cat_sys <- function(...) cat(crayon::green(paste0(...), sep = ""))

# setdiff without worrying about x, y order
set_diff <- function(x, y) setdiff(union(x, y), intersect(x, y))
