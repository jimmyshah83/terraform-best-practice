variable "secret_path" { default = "secret/production/payment" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "payment",
    "db_password": "821462d7-47fb-402c-a22a-a58867602e39"
  }
EOT
}

variable "policy_name" { default = "payment-production" }
variable "policy" {
  default = <<EOT
    path "secret/data/production/payment"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/payment-production" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["payment-production"],
    "password": "123-payment-production"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-payment" }
variable "name" { default = "payment_production" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-production:8200",
    "VAULT_USERNAME=payment-production",
    "VAULT_PASSWORD=123-payment-production",
    "ENVIRONMENT=production"
  ]
}
variable "network_name" { default = "vagrant_production" }