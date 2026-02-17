variable "realm_id" {
  type        = string
  description = <<-EOM
  The realm this user belongs to.
  EOM
}

variable "username" {
  type        = string
  description = <<-EOM
  The unique username of this user.
  EOM
}

variable "enabled" {
  type        = bool
  description = <<-EOM
  When false, this user cannot log in.
  EOM

  default = true
}

variable "initial_password" {
  type = object({
    value     = optional(string)
    temporary = optional(bool, true)
  })
  description = <<-EOM
  When given, the user's initial password will be set. This attribute is only
  respected during initial user creation. Object support following argument:
  * `value`: The initial password.
  * `temporary`: If set to true, the initial password is set up for renewal on
  first use.
  EOM

  default = null
}
variable "email" {
  type        = string
  description = <<-EOM
  The user's email.
  EOM

  default = ""
}

variable "email_verified" {
  type        = bool
  description = <<-EOM
  Whether the email address was validated or not.
  EOM

  default = false
}

variable "first_name" {
  type        = string
  description = <<-EOM
  The user's first name.
  EOM
}

variable "last_name" {
  type        = string
  description = <<-EOM
  The user's last name.
  EOM
}

variable "attributes" {
  type        = map(string)
  description = <<-EOM
  A map representing attributes for the user. In order to add multivalue
  attributes, use ## to separate the values. Max length for each value is 255
  chars
  EOM

  default = {}
}

variable "required_actions" {
  type        = list(string)
  description = <<-EOM
  A list of required user actions.
  EOM

  default = []
}

variable "import" {
  type        = bool
  description = <<-EOM
  When true, the user with the specified username is assumed to already exist, and it will be imported into state instead of being created. This attribute is useful when dealing with users that Keycloak creates automatically during realm creation, such as admin. Note, that the user will not be removed during destruction if import is true.
  EOM

  default = false
}
