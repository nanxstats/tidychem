#' Compute all 2D molecular descriptors.
#'
#' Compute all 2D molecular descriptors available in RDKit.
#'
#' @param mols A \code{tidymol} object.
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @export desc_2d
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

desc_2d <- function(mols) {
  desc_names_local <- get_alldesc_2d()
  if (setequal(desc_names_local, desc_names_2d)) {
    desc_names <- desc_names_2d
  } else {
    warning(
      "The locally installed RDKit has a different list of 2D descriptors",
      "than the list shipped with tidychem. We will use the intersected",
      "list. Please install a recent version of RDKit to avoid this issue. ",
      "The different descriptors are: \n",
      paste(set_diff(desc_names_local, desc_names_2d), collapse = ", ")
    )
    desc_names <- intersect(desc_names_local, desc_names_2d)
  }

  desc <- sapply(mols, get_desc_2d, desc_names)
  desc <- t(desc)

  class(desc) <- c(class(desc), "tidydesc")
  desc
}

#' Compute all 3D molecular descriptors.
#'
#' Compute all 3D descriptors available in RDKit.
#'
#' @param mols A \code{tidymol} object.
#'
#' @author Nan Xiao <\url{https://nanx.me}>
#'
#' @note Since there is some randomization in the conformer generation
#' process, there would be some small numerical differences in the
#' calculated descriptors in each different run.
#'
#' @export desc_3d
#'
#' @examples
#' \dontrun{
#'
#' mol <- parse_smiles("Cc1ccccc1")
#' mols <- read_smiles(tidychem_example("smi-multiple.smi"))
#'
#' desc_3d(mol)
#' desc_3d(mols)
#' }

desc_3d <- function(mols) {
  desc <- sapply(mols, get_desc_3d)
  desc <- t(desc)

  class(desc) <- c(class(desc), "tidydesc")
  desc
}
