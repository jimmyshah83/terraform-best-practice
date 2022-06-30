terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.0.1"
    }
  }
}

module "vault_account_configuration" {
  source = "../../../modules/vault"
  secret_path = var.secret_path
  secret_data = var.secret_data
  policy_name = var.policy_name
  policy = var.policy
  generic_endpoint_path = var.generic_endpoint_path
  generic_endpoint_data = var.generic_endpoint_data
}