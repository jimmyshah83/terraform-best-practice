terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.0.1"
    }
  }
}

resource "vault_generic_secret" "generic_secret" {
  path     = var.secret_path
  data_json = var.secret_data
}

resource "vault_policy" "policy" {
  name     = var.policy_name
  policy = var.policy
}

resource "vault_generic_endpoint" "generic_endpoint" {
  path                 = var.generic_endpoint_path
  ignore_absent_fields = true
  data_json = var.generic_endpoint_data
}