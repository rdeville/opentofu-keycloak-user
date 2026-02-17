# Deployment of a keycloak user
resource "keycloak_user" "this" {
  realm_id = var.realm_id
  username = var.username

  enabled          = var.enabled
  email            = var.email
  email_verified   = var.email_verified
  first_name       = var.first_name
  last_name        = var.last_name
  attributes       = var.attributes
  required_actions = var.required_actions

  dynamic "initial_password" {
    for_each = var.initial_password[*]

    content {
      value     = initial_password.value.value
      temporary = initial_password.value.temporary
    }
  }

  import = var.import
}
