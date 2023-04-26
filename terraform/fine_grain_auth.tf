resource "pingone_user" "genericuser" {
  environment_id = pingone_environment.my_environment.id

  population_id = pingone_population.demo_population.id

  username = "genericuser"
  email    = "noreply@example.com"
}

resource "pingone_user" "companyuser" {
  environment_id = pingone_environment.my_environment.id

  population_id = pingone_population.demo_population.id

  username = "companyuser"
  email    = "example@pingidentity.com"
}
