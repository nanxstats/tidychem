#' Compute RDKit fingerprints
#'
#' Compute the Daylight-like fingerprint based on
#' hashing molecular subgraphs defined by RDKit.
#'
#' @param mols A `tidymol` object.
#' @param explicit Return the fingerprints as a vector or matrix?
#' Default is `FALSE`.
#'
#' @export fp_rdkit
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_rdkit(mol)
#' fp_rdkit(mols)
#'
#' # get fingerprints matrix
#' fp_rdkit(mol, explicit = TRUE)
#' fp_rdkit(mols, explicit = TRUE)
fp_rdkit <- function(mols, explicit = FALSE) {
  fps <- sapply(mols, get_fp_rdkit, explicit)
  if (explicit) fps <- t(fps)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute MACCS keys as molecular fingerprints
#'
#' @param mols A `tidymol` object.
#' @param explicit Return the fingerprints as a vector or matrix?
#' Default is `FALSE`.
#'
#' @export fp_maccs
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_maccs(mol)
#' fp_maccs(mols)
#'
#' # get fingerprints matrix
#' fp_maccs(mol, explicit = TRUE)
#' fp_maccs(mols, explicit = TRUE)
fp_maccs <- function(mols, explicit = FALSE) {
  fps <- sapply(mols, get_fp_maccs, explicit)
  if (explicit) fps <- t(fps)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute atom pairs fingerprints
#'
#' @param mols A `tidymol` object.
#'
#' @note The vectorized version of this fingerprint has a dimensionality
#' of millions, which is usually considered too high for direct
#' statistical modeling. Therefore we did not include the option
#' to return the explicit fingerprint matrix here.
#'
#' @export fp_atompair
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_atompair(mol)
#' fp_atompair(mols)
fp_atompair <- function(mols) {
  fps <- sapply(mols, get_fp_atompair)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute topological torsions fingerprints.
#'
#' @param mols A `tidymol` object.
#'
#' @note The vectorized version of this fingerprint has a dimensionality
#' of millions, which is usually considered too high for direct
#' statistical modeling. Therefore we did not include the option
#' to return the explicit fingerprint matrix here.
#'
#' @export fp_torsion
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_torsion(mol)
#' fp_torsion(mols)
fp_torsion <- function(mols) {
  fps <- sapply(mols, get_fp_torsion)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute Morgan fingerprints (circular fingerprints).
#'
#' @param mols A `tidymol` object.
#' @param radius The radius parameter for Morgan fingerprints.
#' `radius = 2` is roughly equivalent to ECFP4 and FCFP4.
#' @param use_features Should we use the feature-based invariants,
#' similar to those used for the FCFP fingerprints? Defaults to `FALSE`.
#' This means only apply the default atom invariants, which use the
#' connectivity information similar to those used for the ECFP fingerprints.
#' @param explicit Return the fingerprints as a vector or matrix?
#' Default is `FALSE`.
#'
#' @export fp_morgan
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' # ECFP4
#' fp_morgan(mol)
#' fp_morgan(mols)
#'
#' # get fingerprints matrix
#' fp_morgan(mol, explicit = TRUE)
#' fp_morgan(mols, explicit = TRUE)
#'
#' # FCFP2
#' fp_morgan(mol, radius = 1L, use_features = TRUE)
#' fp_morgan(mols, radius = 1L, use_features = TRUE)
#'
#' # get fingerprints matrix
#' fp_morgan(mol, radius = 1L, use_features = TRUE, explicit = TRUE)
#' fp_morgan(mols, radius = 1L, use_features = TRUE, explicit = TRUE)
fp_morgan <- function(mols, radius = 2L, use_features = FALSE, explicit = FALSE) {
  # sanitize argument type
  radius <- as.integer(radius)
  use_features <- as.logical(use_features)

  fps <- sapply(mols, get_fp_morgan, radius, use_features, explicit)
  if (explicit) fps <- t(fps)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute 2D pharmacophore fingerprints.
#'
#' @param mols A `tidymol` object.
#' @param type Type of the fingerprint. `"default"` uses
#' the chemical features defined by RDKit, `"gobbi"` uses
#' the set of chemical features feature defined by Gobbi and Poppinger (1998).
#'
#' @export fp_pharm2d
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_pharm2d(mol)
#' fp_pharm2d(mols)
#'
#' fp_pharm2d(mol, type = "gobbi")
#' fp_pharm2d(mols, type = "gobbi")
fp_pharm2d <- function(mols, type = c("default", "gobbi")) {
  type <- match.arg(type)
  fps <- sapply(mols, get_fp_pharm2d, type)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute extended reduced graphs fingerprints derived from the ErG fingerprint
#'
#' @param mols A `tidymol` object.
#'
#' @export fp_erg
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_erg(mol)
#' fp_erg(mols)
fp_erg <- function(mols) {
  fps <- sapply(mols, get_fp_erg)
  fps <- t(fps)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}

#' Compute pattern fingerprints, a topological fingerprint optimized for substructure screening
#'
#' @param mols A `tidymol` object.
#' @param explicit Return the fingerprints as a vector or matrix?
#' Default is `FALSE`.
#'
#' @export fp_pattern
#'
#' @examplesIf is_installed_rdkit()
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' fp_pattern(mol)
#' fp_pattern(mols)
#'
#' fp_pattern(mol, explicit = TRUE)
#' fp_pattern(mols, explicit = TRUE)
fp_pattern <- function(mols, explicit = FALSE) {
  fps <- sapply(mols, get_fp_pattern, explicit)
  if (explicit) fps <- t(fps)
  class(fps) <- c(class(fps), "tidyfps")
  fps
}
