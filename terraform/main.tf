resource "pingone_environment" "my_environment" {
  name        = "PingAuthorize Tutorial - Manage API Access"
  description = "This environment was created by Terraform to support the PingOne Authorize tutorial \"Manage API access\"."
  type        = "SANDBOX"
  license_id  = var.pingone_license_id

  default_population {
    name        = "My Population"
    description = "My new population for users"
  }

  service {
    type = "SSO"
  }

  service {
    type = "Authorize"
  }
}

resource "pingone_population" "demo_population" {
  environment_id = pingone_environment.my_environment.id

  name = "Demo Population"
}