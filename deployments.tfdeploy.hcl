deployment "simple" {
  variables = {
    prefix           = "simple"
    instances        = 2
  }
}

deployment "complex" {
  variables = {
    prefix           = "complex"
    instances        = 5
  }
}
