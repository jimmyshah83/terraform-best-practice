variable "secret_path" { default = "secret/development/payment" }
variable "secret_data" {
  default = <<EOT
  {
    "db_user":   "payment",
    "db_password": "a63e8938-6d49-49ea-905d-e03a683059e7"
  }
EOT
}

variable "policy_name" { default = "payment-development" }
variable "policy" {
  default = <<EOT
    path "secret/data/development/payment"
    {
      capabilities = ["list", "read"]
    }
EOT
}

variable "generic_endpoint_path" { default = "auth/userpass/users/payment-development" }
variable "generic_endpoint_data" {
  default = <<EOT
  {
    "policies": ["payment-development"],
    "password": "123-payment-development"
  }
EOT
}