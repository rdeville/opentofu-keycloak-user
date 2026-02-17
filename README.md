<!-- markdownlint-disable -->

# 👋 Welcome to Keycloak User

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]

</center>

[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/opentofu/keycloak-user/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

---

## 🚀 Usage

### Deploy a user with only required variables

```hcl
module "keycloak_user" {
  source = "registry.opentofu.org/rdeville/keycloak-user/keycloak"

  # Required variables
  realm_id   = "my-realm"
  username   = "my-user"
  first_name = "John"
  last_name  = "Doe"
}
```

### Deploy a user with all variables using default values for optional variables

```hcl
module "keycloak_user" {
  source = "registry.opentofu.org/rdeville/keycloak-user/keycloak"

  # Required variables
  realm_id       = "my-realm"
  username       = "my-user"
  first_name     = "John"
  last_name      = "Doe"

  # Optional variables with default values
  enabled        = true
  initial_password = null
  email          = ""
  email_verified = false
  attributes     = {}
  required_actions = []

  import         = false
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)
* [Outputs](#outputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [keycloak](https://search.opentofu.org/provider/keycloak/keycloak/):
  `~>5.6`

### Resources

* [resource.keycloak_user.this](https://registry.terraform.io/providers/keycloak/keycloak/latest/docs/resources/user)
  > Deployment of a keycloak user

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [realm_id](#realm_id)
* [username](#username)
* [first_name](#first_name)
* [last_name](#last_name)

##### `realm_id`

The realm this user belongs to.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `username`

The unique username of this user.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `first_name`

The user's first name.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `last_name`

The user's last name.

<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

#### Optional Inputs

* [enabled](#enabled)
* [initial_password](#initial_password)
* [email](#email)
* [email_verified](#email_verified)
* [attributes](#attributes)
* [required_actions](#required_actions)
* [import](#import)


##### `enabled`

When false, this user cannot log in.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  true
  ```

  </div>
</details>

##### `initial_password`

When given, the user's initial password will be set. This attribute is only
respected during initial user creation. Object support following argument:
* `value`: The initial password.
* `temporary`: If set to true, the initial password is set up for renewal on
first use.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
    value     = optional(string)
    temporary = optional(bool, true)
  })
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  null
  ```

  </div>
</details>

##### `email`

The user's email.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  ""
  ```

  </div>
</details>

##### `email_verified`

Whether the email address was validated or not.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `attributes`

A map representing attributes for the user. In order to add multivalue
attributes, use ## to separate the values. Max length for each value is 255
chars

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `required_actions`

A list of required user actions.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `import`

When true, the user with the specified username is assumed to already exist, and it will be imported into state instead of being created. This attribute is useful when dealing with users that Keycloak creates automatically during realm creation, such as admin. Note, that the user will not be removed during destruction if import is true.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>
<!-- markdownlint-restore -->

### Outputs

* `this`:
  The deployed user information

</details>

<!-- END TF-DOCS -->

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/opentofu/keycloak-user/-/issues
[contributing]: ./CONTRIBUTING.md

## 👤 Maintainers

- 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)

## 📝 License

Copyright © 2026, Romain Deville <code@romaindeville.fr>

This project is under following licenses (**OR**) :

- [MIT][main_license]
- [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/opentofu/keycloak-user/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/opentofu/keycloak-user/blob/main/LICENSE.BEERWARE
