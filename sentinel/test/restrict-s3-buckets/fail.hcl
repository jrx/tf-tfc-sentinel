mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
