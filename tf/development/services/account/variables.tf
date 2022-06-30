variable "secret_path" { default = "secret/development/account" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "account",
    "db_password": "965d3c27-9e20-4d41-91c9-61e6631870e7"
  }
EOT
}

variable "policy_name" { default = "account-development" }
variable "policy" {
  default = <<EOT
    path "secret/data/development/account"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/account-development" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["account-development"],
    "password": "123-account-development"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-account" }
variable "name" { default = "account_development" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-development:8200",
    "VAULT_USERNAME=account-development",
    "VAULT_PASSWORD=123-account-development",
    "ENVIRONMENT=development"
  ]
}
variable "network_name" { default = "vagrant_development" }