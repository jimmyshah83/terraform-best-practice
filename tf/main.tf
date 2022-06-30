#provider "vault" {
#  address = "http://localhost:8201"
#  token   = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
#}

module "development" {
  source = "./development"
}

module "production" {
  source = "./production"
}

#resource "docker_container" "gateway_production" {
#  image = "form3tech-oss/platformtest-gateway"
#  name  = "gateway_production"
#
#  env = [
#    "VAULT_ADDR=http://vault-production:8200",
#    "VAULT_USERNAME=gateway-production",
#    "VAULT_PASSWORD=123-gateway-production",
#    "ENVIRONMENT=production"
#  ]
#
#  networks_advanced {
#    name = "vagrant_production"
#  }
#
#  lifecycle {
#    ignore_changes = all
#  }
#}
#
#resource "docker_container" "payment_production" {
#  image = "form3tech-oss/platformtest-payment"
#  name  = "payment_production"
#
#  env = [
#    "VAULT_ADDR=http://vault-production:8200",
#    "VAULT_USERNAME=payment-production",
#    "VAULT_PASSWORD=123-payment-production",
#    "ENVIRONMENT=production"
#  ]
#
#  networks_advanced {
#    name = "vagrant_production"
#  }
#
#  lifecycle {
#    ignore_changes = all
#  }
#}
#
#resource "docker_container" "gateway_development" {
#  image = "form3tech-oss/platformtest-gateway"
#  name  = "gateway_development"
#
#  env = [
#    "VAULT_ADDR=http://vault-development:8200",
#    "VAULT_USERNAME=gateway-development",
#    "VAULT_PASSWORD=123-gateway-development",
#    "ENVIRONMENT=development"
#  ]
#
#  networks_advanced {
#    name = "vagrant_development"
#  }
#
#  lifecycle {
#    ignore_changes = all
#  }
#}
#
#resource "docker_container" "payment_development" {
#  image = "form3tech-oss/platformtest-payment"
#  name  = "payment_development"
#
#  env = [
#    "VAULT_ADDR=http://vault-development:8200",
#    "VAULT_USERNAME=payment-development",
#    "VAULT_PASSWORD=123-payment-development",
#    "ENVIRONMENT=development"
#  ]
#
#  networks_advanced {
#    name = "vagrant_development"
#  }
#
#  lifecycle {
#    ignore_changes = all
#  }
#}