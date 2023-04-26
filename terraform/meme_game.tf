resource "pingone_application" "meme_game" {
  environment_id = pingone_environment.my_environment.id
  name           = "Meme Game"
  description    = "Meme Game app for AAM tutorials."
  enabled        = true

  oidc_options {
    type                        = "SINGLE_PAGE_APP"
    grant_types                 = ["IMPLICIT", "CLIENT_CREDENTIALS"]
    response_types              = ["TOKEN"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
    redirect_uris               = ["https://oauth.pstmn.io/v1/callback"]
  }
}

resource "pingone_user" "gameplayer" {
  environment_id = pingone_environment.my_environment.id

  population_id = pingone_population.demo_population.id

  username = "gameplayer"
  email    = "noreply@pingidentity.com"
}

resource "pingone_user" "gameadmin" {
  environment_id = pingone_environment.my_environment.id

  population_id = pingone_population.demo_population.id

  username = "gameadmin"
  email    = "noreply@pingidentity.com"
}

resource "pingone_group" "meme_game_admins" {
  environment_id = pingone_environment.my_environment.id

  name = "Meme Game Admins"
}
