#' Get all available 2D descriptor names
#'
#' @export get_alldesc_2d
#'
#' @examplesIf is_installed_rdkit()
#' get_alldesc_2d()
get_alldesc_2d <- function() {
  sapply(rdkit$Chem$Descriptors$descList, "[[", 1L)
}

# names of all 2D descriptors in RDKit 2018.09.1dev1.
# dput(get_alldesc_2d())
desc_names_2d <- c(
  "qed", "MinAbsPartialCharge", "NumRadicalElectrons", "FpDensityMorgan2",
  "FpDensityMorgan3", "FpDensityMorgan1", "HeavyAtomMolWt", "MaxAbsEStateIndex",
  "MaxAbsPartialCharge", "MaxEStateIndex", "MinPartialCharge",
  "ExactMolWt", "MolWt", "NumValenceElectrons", "MinEStateIndex",
  "MinAbsEStateIndex", "MaxPartialCharge", "BalabanJ", "BertzCT",
  "Chi0", "Chi0n", "Chi0v", "Chi1", "Chi1n", "Chi1v", "Chi2n",
  "Chi2v", "Chi3n", "Chi3v", "Chi4n", "Chi4v", "HallKierAlpha",
  "Ipc", "Kappa1", "Kappa2", "Kappa3", "LabuteASA", "PEOE_VSA1",
  "PEOE_VSA10", "PEOE_VSA11", "PEOE_VSA12", "PEOE_VSA13", "PEOE_VSA14",
  "PEOE_VSA2", "PEOE_VSA3", "PEOE_VSA4", "PEOE_VSA5", "PEOE_VSA6",
  "PEOE_VSA7", "PEOE_VSA8", "PEOE_VSA9", "SMR_VSA1", "SMR_VSA10",
  "SMR_VSA2", "SMR_VSA3", "SMR_VSA4", "SMR_VSA5", "SMR_VSA6", "SMR_VSA7",
  "SMR_VSA8", "SMR_VSA9", "SlogP_VSA1", "SlogP_VSA10", "SlogP_VSA11",
  "SlogP_VSA12", "SlogP_VSA2", "SlogP_VSA3", "SlogP_VSA4", "SlogP_VSA5",
  "SlogP_VSA6", "SlogP_VSA7", "SlogP_VSA8", "SlogP_VSA9", "TPSA",
  "EState_VSA1", "EState_VSA10", "EState_VSA11", "EState_VSA2",
  "EState_VSA3", "EState_VSA4", "EState_VSA5", "EState_VSA6", "EState_VSA7",
  "EState_VSA8", "EState_VSA9", "VSA_EState1", "VSA_EState10",
  "VSA_EState2", "VSA_EState3", "VSA_EState4", "VSA_EState5", "VSA_EState6",
  "VSA_EState7", "VSA_EState8", "VSA_EState9", "FractionCSP3",
  "HeavyAtomCount", "NHOHCount", "NOCount", "NumAliphaticCarbocycles",
  "NumAliphaticHeterocycles", "NumAliphaticRings", "NumAromaticCarbocycles",
  "NumAromaticHeterocycles", "NumAromaticRings", "NumHAcceptors",
  "NumHDonors", "NumHeteroatoms", "NumRotatableBonds", "NumSaturatedCarbocycles",
  "NumSaturatedHeterocycles", "NumSaturatedRings", "RingCount",
  "MolLogP", "MolMR", "fr_Al_COO", "fr_Al_OH", "fr_Al_OH_noTert",
  "fr_ArN", "fr_Ar_COO", "fr_Ar_N", "fr_Ar_NH", "fr_Ar_OH", "fr_COO",
  "fr_COO2", "fr_C_O", "fr_C_O_noCOO", "fr_C_S", "fr_HOCCN", "fr_Imine",
  "fr_NH0", "fr_NH1", "fr_NH2", "fr_N_O", "fr_Ndealkylation1",
  "fr_Ndealkylation2", "fr_Nhpyrrole", "fr_SH", "fr_aldehyde",
  "fr_alkyl_carbamate", "fr_alkyl_halide", "fr_allylic_oxid", "fr_amide",
  "fr_amidine", "fr_aniline", "fr_aryl_methyl", "fr_azide", "fr_azo",
  "fr_barbitur", "fr_benzene", "fr_benzodiazepine", "fr_bicyclic",
  "fr_diazo", "fr_dihydropyridine", "fr_epoxide", "fr_ester", "fr_ether",
  "fr_furan", "fr_guanido", "fr_halogen", "fr_hdrzine", "fr_hdrzone",
  "fr_imidazole", "fr_imide", "fr_isocyan", "fr_isothiocyan", "fr_ketone",
  "fr_ketone_Topliss", "fr_lactam", "fr_lactone", "fr_methoxy",
  "fr_morpholine", "fr_nitrile", "fr_nitro", "fr_nitro_arom", "fr_nitro_arom_nonortho",
  "fr_nitroso", "fr_oxazole", "fr_oxime", "fr_para_hydroxylation",
  "fr_phenol", "fr_phenol_noOrthoHbond", "fr_phos_acid", "fr_phos_ester",
  "fr_piperdine", "fr_piperzine", "fr_priamide", "fr_prisulfonamd",
  "fr_pyridine", "fr_quatN", "fr_sulfide", "fr_sulfonamd", "fr_sulfone",
  "fr_term_acetylene", "fr_tetrazole", "fr_thiazole", "fr_thiocyan",
  "fr_thiophene", "fr_unbrch_alkane", "fr_urea"
)

# calculate all 2D descriptors for a single molecule
get_desc_2d <- function(mol, desc_names) {
  calc <- rdkit$ML$Descriptors$MoleculeDescriptors$MolecularDescriptorCalculator(desc_names)
  desc <- unlist(calc$CalcDescriptors(mol))
  names(desc) <- desc_names
  desc
}

# names of all 3D descriptors in RDKit 2018.09.1dev1.
# https://www.rdkit.org/docs/GettingStartedInPython.html#list-of-available-3d-descriptors
desc_names_3d <- c(
  "PBF", "PMI1", "PMI2", "PMI3", "NPR1", "NPR2", "RadiusOfGyration",
  "InertialShapeFactor", "Eccentricity", "Asphericity", "SpherocityIndex",
  "AUTOCORR3D", "RDF", "MORSE", "WHIM", "GETAWAY"
)

# calculate all 3D descriptors for a single molecule
get_desc_3d <- function(mol) {
  # add hydrogens
  m <- rdkit$Chem$AddHs(mol)
  # use the ETKDG method for conformer generation (to avoid minimization)
  rdkit$Chem$AllChem$EmbedMolecule(m, rdkit$Chem$AllChem$ETKDG())

  # calculate all descriptors in the descriptor list
  n_desc_3d <- length(desc_names_3d)
  desc <- vector("list", n_desc_3d)

  for (i in 1L:n_desc_3d) {
    desc[[i]] <- eval(parse(text = paste0(
      "rdkit$Chem$Descriptors3D$rdMolDescriptors$Calc", desc_names_3d[i], "(m)"
    )))
    k <- length(desc[[i]])
    names(desc[[i]]) <- if (k > 1L) paste(desc_names_3d[i], 1:k, sep = "_") else desc_names_3d[i]
  }
  unlist(desc)
}
