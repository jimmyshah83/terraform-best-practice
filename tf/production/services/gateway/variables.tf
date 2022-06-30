variable "secret_path" { default = "secret/production/gateway" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "gateway",
    "db_password": "33fc0cc8-b0e3-4c06-8cf6-c7dce2705329"
  }
EOT
}

variable "policy_name" { default = "gateway-production" }
variable "policy" {
  default = <<EOT
    path "secret/data/production/gateway"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/gateway-production" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["gateway-production"],
    "password": "123-gateway-production"
  }
EOT
}

variable "image" { default = "form3tech-oss/platformtest-gateway" }
variable "name" { default = "gateway_production" }
variable "env" {
  default = [
    "VAULT_ADDR=http://vault-production:8200",
    "VAULT_USERNAME=gateway-production",
    "VAULT_PASSWORD=123-gateway-production",
    "ENVIRONMENT=production"
  ]
}
variable "network_name" { default = "vagrant_production" }