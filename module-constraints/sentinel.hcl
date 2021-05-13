module "tfconfig-functions" {
  source = "./common-functions/tfconfig-functions.sentinel"
}

policy "require-all-modules-have-version-constraint" {
  source            = "./require-all-modules-have-version-constraint.sentinel"
  enforcement_level = "soft-mandatory"
}

policy "require-some-modules-have-specific-version" {
  source            = "./require-some-modules-have-specific-version.sentinel"
  enforcement_level = "soft-mandatory"
}