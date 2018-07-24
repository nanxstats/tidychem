# convert fingerprint to bitvect
fp_to_bitvect <- function(fp) {
  txt <- fp$ToBinary()
  rdkit$DataStructs$ExplicitBitVect(txt)
}

# convert bitvect to numpy array
#' @importFrom reticulate py_run_string py
bitvect_to_array <- function(bitvect) {
  # send
  py$bitvect <- bitvect
  # convert
  py_run_string("import rdkit")
  py_run_string("import numpy")
  py_run_string("arr = numpy.zeros((1, ))")
  py_run_string("rdkit.DataStructs.ConvertToNumpyArray(bitvect, arr)")
  # retrive
  arr <- py$arr
  arr
}

# convert fingerprint to array
fp_to_array <- function(fp) bitvect_to_array(fp_to_bitvect(fp))

get_fp_rdkit <- function(mol, explicit) {
  fp <- rdkit$Chem$RDKFingerprint(mol)
  if (explicit) fp <- fp_to_array(fp)
  fp
}

get_fp_maccs <- function(mol, explicit) {
  fp <- rdkit$Chem$MACCSkeys$GenMACCSKeys(mol)
  if (explicit) fp <- fp_to_array(fp)
  fp
}

get_fp_atompair <- function(mol)
  rdkit$Chem$AtomPairs$Pairs$GetAtomPairFingerprint(mol)

get_fp_torsion <- function(mol)
  rdkit$Chem$AtomPairs$Torsions$GetTopologicalTorsionFingerprint(mol)

get_fp_morgan <- function(mol, radius, use_features, explicit) {
  if (!explicit) {
    fp <- rdkit$Chem$AllChem$GetMorganFingerprint(mol, radius = radius, useFeatures = use_features)
  } else {
    bv <- rdkit$Chem$AllChem$GetMorganFingerprintAsBitVect(mol, radius = radius, useFeatures = use_features)
    fp <- bitvect_to_array(bv)
  }
  fp
}

get_fp_pharm2d <- function(mol, type) {
  if (type == "default") {
    fdef_name <- tidychem_example("MinimalFeatures.fdef")
    feat_factory <- rdkit$Chem$ChemicalFeatures$BuildFeatureFactory(fdef_name)
    sig_factory <- rdkit$Chem$Pharm2D$SigFactory$SigFactory(feat_factory, minPointCount = 2L, maxPointCount = 3L)
    sig_factory$SetBins(r_to_py(list(c(0L, 2L), c(2L, 5L), c(5L, 8L))))
    fp <- rdkit$Chem$Pharm2D$Generate$Gen2DFingerprint(mol, sig_factory)
  }
  if (type == "gobbi") {
    fp <- rdkit$Chem$Pharm2D$Generate$Gen2DFingerprint(mol, rdkit$Chem$Pharm2D$Gobbi_Pharm2D$factory)
  }
  fp
}
