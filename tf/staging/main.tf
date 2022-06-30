terraform {
  required_version = ">= 0.1.0.7"

  required_providers {
    vault = {
      source = "hashicorp/vault"
      version = "3.0.1"
    }
  }
}

provider "vault" {
  alias   = "vault_staging"
  address = var.address
  token   = var.token
}

resource "vault_audit" "vault_audit" {
  provider = vault.vault_staging
  type     = "file"
  options = {
    file_path = var.file_path
  }
}

resource "vault_auth_backend" "userpass_stage" {
  provider = vault.vault_staging
  type     = "userpass"
}

module "account_configuration" {
  providers = {
    vault = vault.vault_staging
  }
  source = "./services/account"
  depends_on = [vault_auth_backend.userpass_stage]
}

module "gateway_configuration" {
  providers = {
    vault = vault.vault_staging
  }
  source = "./services/gateway"
  depends_on = [vault_auth_backend.userpass_stage]
}

module "payment_configuration" {
  providers = {
    vault = vault.vault_staging
  }
  source = "./services/payment"
  depends_on = [vault_auth_backend.userpass_stage]
}