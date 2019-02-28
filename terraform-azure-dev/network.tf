#
# Creating Virtual Network
#
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.MyRG.name}"
  dns_servers         = "${var.dns_servers}"
  tags                = "${var.tags}"
}

#
# Creating Subnets
# 

resource "azurerm_subnet" "subnet_lb" {
  name                      = "LB_Frontend1"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${azurerm_resource_group.MyRG.name}"
  address_prefix            = "172.16.1.0/24"
  network_security_group_id = "${azurerm_network_security_group.NSG_LB.id}"
}

resource "azurerm_subnet" "subnet_web" {
  name                      = "WEB_Frontend2"
  virtual_network_name      = "${azurerm_virtual_network.vnet.name}"
  resource_group_name       = "${azurerm_resource_group.MyRG.name}"
  address_prefix            = "172.16.2.0/24"
  network_security_group_id = "${azurerm_network_security_group.NSG_WEB.id}"
}




