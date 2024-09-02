#' Parse molecules from SMILES strings
#'
#' Parse molecules from a vector of SMILES strings.
#'
#' @param string A vector of SMILES string(s).
#'
#' @export parse_smiles
#'
#' @examplesIf is_installed_rdkit()
#' parse_smiles("Cc1ccccc1")
#' parse_smiles(c("Cc1ccccc1", "CCN(CC)CC"))
parse_smiles <- function(string) {
  mols <- if (length(string) == 1L) {
    list(mol_from_smiles(string))
  } else {
    sapply(string, mol_from_smiles, USE.NAMES = FALSE)
  }
  class(mols) <- "tidymol"
  mols
}

#' Parse molecules from SDF/MOL text block.
#'
#' Parse molecules from SDF/MOL text block.
#'
#' @param string A SDF/MOL text block string.
#'
#' @importFrom reticulate r_to_py iterate
#'
#' @export parse_sdf
#'
#' @examplesIf is_installed_rdkit()
#' str_single <- readr::read_file(tidychem_example("single.mol"))
#' str_multiple <- readr::read_file(tidychem_example("5ht3ligs.sdf"))
#'
#' parse_sdf(str_single)
#' parse_sdf(str_multiple)
parse_sdf <- function(string) {
  if (count_mol_sdf(string) == 1L) {
    mols <- list(rdkit$Chem$MolFromMolBlock(r_to_py(as.character(string))))
  } else {
    temp_sdf <- tempfile(fileext = ".sdf")
    writeLines(string, temp_sdf)
    supp <- rdkit$Chem$SDMolSupplier(temp_sdf)
    mols <- iterate(supp)
    mols
  }
  class(mols) <- "tidymol"
  mols
}
