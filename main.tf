module "naming" {
  source  = "Azure/naming/azurerm"
  suffix = [ "${var.vnet_name_suffix}" ]
  prefix = [ "${var.vnet_name_prefix}" ]
}

resource "azurerm_virtual_network" "main" {
  name                = length(var.vnet_name) < 0 ? var.vnet_name :  module.naming.virtual_network.name 
  location            = var.vnet_location
  resource_group_name = var.vnet_resource_group_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "main" {
  for_each             = var.vnet_subnet_details == null ? { "default" = var.vnet_address_space } : var.vnet_subnet_details
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.main.name
  resource_group_name  = var.vnet_resource_group_name
  address_prefixes     = each.value
  depends_on = [
    azurerm_virtual_network.main
  ]
}
