module "tfconfig-functions" {
  source = "../../common-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "../../mock-data/mock-tfconfig-v2-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}