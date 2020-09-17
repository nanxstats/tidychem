#' Calculate fingerprint similarity.
#'
#' Calculate fingerprint similarity.
#'
#' @param fps1 A \code{tidyfps} object.
#' @param fps2 A \code{tidyfps} object (optional).
#
#' @examples
#' \dontrun{
#'
#' mols1 <- parse_smiles(c("Cc1ccccc1", "CCN(CC)CC"))
#' mols2 <- parse_smiles(c("Cc1ccccc1", "CCN(CC)CC", "CCC"))
#' fps1 <- fp_maccs(mols1)
#' fps2 <- fp_maccs(mols2)
#'
#' sim(fps1, metric = "tanimoto")
#' sim(fps1, fps2, metric = "tanimoto")
#'
#' # or use pipes
#' mols1 %>% fp_maccs %>% sim("tanimoto")
#' (mols1 %>% fp_maccs) %>% sim(mols2 %>% fp_maccs, "tanimoto")
#' }

sim <- function(
  fps1 = NULL, fps2 = NULL,
  metric = c(
    "tanimoto", "dice", "cosine", "sokal",
    "russel", "rogotgoldberg", "allbit",
    "kulczynski", "mcconnaughey", "asymmetric", "braunblanquet"
  )) {
  metric <- match.arg(metric)
  if (is.null(fps1)) stop("Please provide one tidyfps object.")

  # similarity within one tidyfps object
  if (!is.null(fps1) & is.null(fps2)) {
    # is matrix? - don't do it for now, stop - please set explicit = FALSE. this will be added in the future.
    # or a list?
    NULL
  }

  # similarity between two tidyfps objects
  if (!is.null(fps1) & !is.null(fps2)) {
    # must be of the same type - a check function here
    NULL
    # is two matrice? - don't do it for now, stop - please set explicit = FALSE. this will be added in the future.
    # is two lists?
  }
}
