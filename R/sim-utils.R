get_sim_tanimoto <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$TanimotoSimilarity)
}

get_sim_dice <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$DiceSimilarity)
}

get_sim_cosine <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$CosineSimilarity)
}

get_sim_sokal <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$SokalSimilarity)
}

get_sim_russel <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$RusselSimilarity)
}

get_sim_rogotgoldberg <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$RogotGoldbergSimilarity)
}

get_sim_allbit <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$AllBitSimilarity)
}

get_sim_kulczynski <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$KulczynskiSimilarity)
}

get_sim_mcconnaughey <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$McConnaugheySimilarity)
}

get_sim_asymmetric <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$AsymmetricSimilarity)
}

get_sim_braunblanquet <- function(fp1, fp2) {
  rdkit$DataStructs$FingerprintSimilarity(fp1, fp2, rdkit$DataStructs$BraunBlanquetSimilarity)
}

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
