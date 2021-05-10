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