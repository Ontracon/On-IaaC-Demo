#
# Create Storage Accoiunt for diagnostic of VM's
#
resource "azurerm_storage_account" "mystorageaccount" {
    name                = "ondiag${random_id.randomId.hex}"
    resource_group_name = "${azurerm_resource_group.MyRG.name}"
    location            = "${var.location}"
    account_replication_type = "LRS"
    account_tier = "Standard"
    tags                = "${var.tags}"
}

#
# Create Public IP's 
#

resource "azurerm_public_ip" "pip_vms" {
  name                = "PIP-${var.vm_names[count.index]}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.MyRG.name}"
  domain_name_label = "${var.vm_names[count.index]}"
  public_ip_address_allocation = "dynamic"
  tags                = "${var.tags}"
  count                     = "${length(var.vm_names)}"
}

#
# Create Network Interfaces and assign public IP
#
resource "azurerm_network_interface" "vm_nics" {
    name                = "NIC-${var.vm_names[count.index]}"
  location              = "${var.location}"
    resource_group_name = "${azurerm_resource_group.MyRG.name}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${azurerm_subnet.subnet_web.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${element(azurerm_public_ip.pip_vms.*.id, count.index)}"
    }
  tags                = "${var.tags}"
  count               = "${length(var.vm_names)}"
}

#
# Create VM's
#

resource "azurerm_virtual_machine" "vms" {
    name                  = "${var.vm_names[count.index]}"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.MyRG.name}"
    network_interface_ids = ["${element(azurerm_network_interface.vm_nics.*.id, count.index)}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "OsDisk-${var.vm_names[count.index]}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

  storage_image_reference {
    publisher = "openlogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }

    os_profile {
        computer_name  = "${var.vm_names[count.index]}"
        admin_username = "${var.admin_username}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "${var.ssh_path}"
            key_data = "${var.ssh_key}"
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }
    count                 = "${length(var.vm_names)}"

# Wait until Instance is up

provisioner "remote-exec" {
          inline = ["echo 'Hello World'"]
   connection {
      type = "ssh"
      host = "${element(azurerm_public_ip.pip_vms.*.id, count.index)}"
      user = "${var.admin_username}"
       private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

}







