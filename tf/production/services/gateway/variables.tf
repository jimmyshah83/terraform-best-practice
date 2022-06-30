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