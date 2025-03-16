provider "azurerm" {
  
    features {}
    subscription_id = local.subscription_id
    alias = "hub"
}

locals {
  subscription_id = split("/", var.private_dns_zone_id)[2]
  resource_group_name = split("/", var.private_dns_zone_id)[4]
  dns_zone_name = split("/", var.private_dns_zone_id)[8]
}

resource "azurerm_private_dns_a_record" "dns_record" {
  name = "web"
  records = [ "1.2.3.4" ]
  resource_group_name = local.resource_group_name
  ttl = 3600
  zone_name = local.dns_zone_name
  provider = azurerm.hub
}