variable "secret_path" { default = "secret/staging/account" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "account",
    "db_password": "965d3c27-9e20-4d41-91c9-61e6631870e7"
  }
EOT
}

variable "policy_name" { default = "account-staging" }
variable "policy" {
  default = <<EOT
    path "secret/data/staging/account"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/account-staging" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["account-staging"],
    "password": "123-account-staging"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-account" }
variable "name" { default = "account_staging" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-staging:8200",
    "VAULT_USERNAME=account-staging",
    "VAULT_PASSWORD=123-account-staging",
    "ENVIRONMENT=staging"
  ]
}
variable "network_name" { default = "vagrant_staging" }