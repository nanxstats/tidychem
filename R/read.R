#' Read molecules from a SMILES file.
#'
#' Read molecules from a SMILES file.
#'
#' @param file Path to the SMILES file.
#'
#' @export read_smiles
#'
#' @examplesIf is_installed_rdkit()
#' read_smiles(tidychem_example("smi-single.smi"))
#' read_smiles(tidychem_example("smi-multiple.smi"))
#' read_smiles(tidychem_example("smi-single-noname.smi"))
#' read_smiles(tidychem_example("smi-multiple-noname.smi"))
read_smiles <- function(file) {
  file <- normalizePath(file)
  x <- readLines(file)
  if (length(x) == 1L) {
    mols <- parse_smiles(x)
  } else {
    supp <- rdkit$Chem$SmilesMolSupplier(file)
    mols <- iterate(supp)
  }
  class(mols) <- "tidymol"
  mols
}

#' Read molecules from a SDF/MOL file.
#'
#' Read molecules from a SDF/MOL file.
#'
#' @param file Path to the SDF or MOL file.
#'
#' @export read_sdf
#'
#' @examplesIf is_installed_rdkit()
#' read_sdf(tidychem_example("single.mol"))
#' read_sdf(tidychem_example("5ht3ligs.sdf"))
read_sdf <- function(file) {
  file <- normalizePath(file)
  x <- readr::read_file(file)
  if (count_mol_sdf(x) == 1L) {
    mols <- list(rdkit$Chem$MolFromMolBlock(r_to_py(as.character(x))))
  } else {
    supp <- rdkit$Chem$SDMolSupplier(file)
    mols <- iterate(supp)
  }
  class(mols) <- "tidymol"
  mols
}
