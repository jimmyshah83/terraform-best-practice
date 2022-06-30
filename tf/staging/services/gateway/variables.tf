variable "secret_path" { default = "secret/staging/gateway" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "gateway",
    "db_password": "10350819-4802-47ac-9476-6fa781e35cfd"
  }
EOT
}

variable "policy_name" { default = "gateway-staging" }
variable "policy" {
  default = <<EOT
    path "secret/data/staging/gateway"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/gateway-staging" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["gateway-staging"],
    "password": "123-gateway-staging"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-gateway" }
variable "name" { default = "gateway_staging" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-staging:8200",
    "VAULT_USERNAME=gateway-staging",
    "VAULT_PASSWORD=123-gateway-staging",
    "ENVIRONMENT=staging"
  ]
}
variable "network_name" { default = "vagrant_staging" }