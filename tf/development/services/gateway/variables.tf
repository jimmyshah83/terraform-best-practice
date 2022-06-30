variable "secret_path" { default = "secret/development/gateway" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "gateway",
    "db_password": "10350819-4802-47ac-9476-6fa781e35cfd"
  }
EOT
}

variable "policy_name" { default = "gateway-development" }
variable "policy" {
  default = <<EOT
    path "secret/data/development/gateway"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/gateway-development" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["gateway-development"],
    "password": "123-gateway-development"
  }
EOT
}