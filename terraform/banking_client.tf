resource "pingone_resource" "banking_app" {
  environment_id = pingone_environment.my_environment.id

  name = "Banking App"

  audience                      = "Banking App"
  access_token_validity_seconds = 3600
}

resource "pingone_resource_scope" "banking" {
  environment_id = pingone_environment.my_environment.id
  resource_id    = pingone_resource.banking_app.id

  name        = "banking"
  description = "Access banking services"
}

resource "pingone_application" "aam_banking_client" {
  environment_id = pingone_environment.my_environment.id
  name           = "AAM Tutorial Banking Client"
  description    = "Banking app for AAM tutorials."
  enabled        = true

  oidc_options {
    type                        = "SINGLE_PAGE_APP"
    grant_types                 = ["IMPLICIT", "CLIENT_CREDENTIALS"]
    response_types              = ["TOKEN"]
    token_endpoint_authn_method = "CLIENT_SECRET_BASIC"
    redirect_uris               = ["https://oauth.pstmn.io/v1/callback"]
  }
}

resource "pingone_application_resource_grant" "banking" {
  environment_id = pingone_environment.my_environment.id
  application_id = pingone_application.aam_banking_client.id

  resource_id = pingone_resource.banking_app.id

  scopes = [
    pingone_resource_scope.banking.id
  ]
}

