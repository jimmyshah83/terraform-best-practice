variable "secret_path" { default = "secret/production/account" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "account",
    "db_password": "396e73e7-34d5-4b0a-ae1b-b128aa7f9977"
  }
EOT
}

variable "policy_name" { default = "account-production" }
variable "policy" {
  default = <<EOT
    path "secret/data/production/account"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/account-production" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["account-production"],
    "password": "123-account-production"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-account" }
variable "name" { default = "account_production" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-production:8200",
    "VAULT_USERNAME=account-production",
    "VAULT_PASSWORD=123-account-production",
    "ENVIRONMENT=production"
  ]
}
variable "network_name" { default = "vagrant_production" }