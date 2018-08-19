get_sim_tanimoto <- function(fp1, fp2) rdkit$DataStructs$TanimotoSimilarity(fp1, fp2)
get_sim_dice <- function(fp1, fp2) rdkit$DataStructs$DiceSimilarity(fp1, fp2)
get_sim_cosine <- function(fp1, fp2) rdkit$DataStructs$CosineSimilarity(fp1, fp2)
get_sim_sokal <- function(fp1, fp2) rdkit$DataStructs$SokalSimilarity(fp1, fp2)
get_sim_russel <- function(fp1, fp2) rdkit$DataStructs$RusselSimilarity(fp1, fp2)
get_sim_rogotgoldberg <- function(fp1, fp2) rdkit$DataStructs$RogotGoldbergSimilarity(fp1, fp2)
get_sim_allbit <- function(fp1, fp2) rdkit$DataStructs$AllBitSimilarity(fp1, fp2)
get_sim_kulczynski <- function(fp1, fp2) rdkit$DataStructs$KulczynskiSimilarity(fp1, fp2)
get_sim_mcconnaughey <- function(fp1, fp2) rdkit$DataStructs$McConnaugheySimilarity(fp1, fp2)
get_sim_asymmetric <- function(fp1, fp2) rdkit$DataStructs$AsymmetricSimilarity(fp1, fp2)
get_sim_braunblanquet <- function(fp1, fp2) rdkit$DataStructs$BraunBlanquetSimilarity(fp1, fp2)

# mols <- read_smiles(tidychem_example("smi-multiple.smi"))
# x <- fp_maccs(mols)
# fp1 <- x[[1]]
# fp2 <- x[[2]]
#
# get_sim_tanimoto(fp1, fp2)
# get_sim_dice(fp1, fp2)
# get_sim_cosine(fp1, fp2)
# get_sim_sokal(fp1, fp2)
# get_sim_russel(fp1, fp2)
# get_sim_rogotgoldberg(fp1, fp2)
# get_sim_allbit(fp1, fp2)
# get_sim_kulczynski(fp1, fp2)
# get_sim_mcconnaughey(fp1, fp2)
# get_sim_asymmetric(fp1, fp2)
# get_sim_braunblanquet(fp1, fp2)

# mols <- parse_smiles(c("C1CCC1OCC", "CC(C)OCC", "CCOCC"))
# # ok
# x <- fp_maccs(mols)
# x <- fp_rdkit(mols)
# x <- fp_pharm2d(mols)
# x <- fp_pattern(mols)
# x <- fp_atompair(mols)
# x <- fp_torsion(mols)
# x <- fp_morgan(mols)
# # can't do since it's matrix
# x <- fp_erg(mols)
#
# fp1 <- x[[1]]
# fp2 <- x[[2]]
# get_sim_tanimoto(fp1, fp2)
# get_sim_dice(fp1, fp2)
