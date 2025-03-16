provider "azurerm" {
  features {

  }
  subscription_id = "a1bb21f8-fca2-4832-8b35-4fc83f310690"
}

locals {
  resource_group_name = "rg-${random_string.random.result}"
}

data "azurerm_client_config" "current" {

}

resource "random_string" "random" {
  length  = 5
  upper   = false
  special = false

}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "app.techdecline.dev"
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_private_dns_zone.dns_zone.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = data.azurerm_client_config.current.object_id
}


output "private_dns_zone_id" {
  value = azurerm_private_dns_zone.dns_zone.id
}