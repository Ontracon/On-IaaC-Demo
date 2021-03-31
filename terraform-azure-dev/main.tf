# Terraform Backend Configuration
#
# Needs to run with additional Configuration on Init: 
# terraform init -backend-config="access_key=Storage Access Key"
#

# Backend Configuration (Make sure Storage Account & Container does exists
# Skip (comment out) if using local tfstate file

#terraform {
#  backend "azurerm" {
#    storage_account_name = "ondevterraform001"
#    container_name       = "on-dev-web-app-tfstate"
#    resource_group_name  = "on-ams-dev-tfstates"
#    key                  = "terraform.tfstate"
#
#  }
#}

#
# Creating Resource Group
#
resource "azurerm_resource_group" "MyRG" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

#
# Generate a Random ID
#

resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${azurerm_resource_group.MyRG.name}"
  }

  byte_length = 8
}


# Files that will be included
# network.tf 	-> Network Configuration
# nsg.tf 	-> Network Security Groups Configuration








