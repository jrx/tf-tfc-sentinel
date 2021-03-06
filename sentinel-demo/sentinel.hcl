module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

# Compliance
policy "restrict-aws-machine-type" {
  source            = "./restrict-aws-machine-type.sentinel"
  enforcement_level = "hard-mandatory"
}

# Finance
policy "less-than-100-month" {
  source            = "./less-than-100-month.sentinel"
  enforcement_level = "hard-mandatory"
}

# Security
policy "restrict-s3-buckets" {
  source            = "./restrict-s3-buckets.sentinel"
  enforcement_level = "hard-mandatory"
}