resource "azurerm_network_security_group" "NSG_DMZ" {
  name                = "NSG_DMZ"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.MyRG.name}"
  tags                = "${var.tags}"

  security_rule {
    name                       = "allow_80"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
  
resource "azurerm_network_security_group" "NSG_WEB" {
  name                = "NSG_WEB"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.MyRG.name}"
  tags                = "${var.tags}"

  security_rule {
    name                       = "allow_8080"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_22"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}




