variable "secret_path" { default = "secret/staging/payment" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "payment",
    "db_password": "a63e8938-6d49-49ea-905d-e03a683059e7"
  }
EOT
}

variable "policy_name" { default = "payment-staging" }
variable "policy" {
  default = <<EOT
    path "secret/data/staging/payment"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/payment-staging" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["payment-staging"],
    "password": "123-payment-staging"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-payment" }
variable "name" { default = "payment_staging" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-staging:8200",
    "VAULT_USERNAME=payment-staging",
    "VAULT_PASSWORD=123-payment-staging",
    "ENVIRONMENT=staging"
  ]
}
variable "network_name" { default = "vagrant_staging" }