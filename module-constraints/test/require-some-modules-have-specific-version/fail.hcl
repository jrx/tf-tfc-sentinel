module "tfconfig-functions" {
  source = "../../common-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "../../mock-data/mock-tfconfig-v2-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}