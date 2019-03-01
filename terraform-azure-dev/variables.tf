variable "resource_group_name" {
  description = "Default resource group name that the application will be created in."
  default     = "on-ams-dev-webapp-rg-01"
}

variable "location" {
  description = "The location/region where the Application will be created. The full list of Azure regions can be found at https://azure.microsoft.com/regions"
  default     = "westeurope"
}

variable "vm_names" {
  description = "A list of VM's to be deployed."
  default     = ["on-ams-web-d01","on-ams-web-d02","on-ams-web-d03"]
}

variable "admin_username"{
  description = "The Admin User for the VM's"
  default     = "jkritzen"
}


variable "ssh_key"{
            default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC0j9UAe85Gs5Qq0lepbxKDCFZKBuhS3TPa/ycQ27UcbC8iRl5kGXh/cU7e17eeu2qoLdcC5InMD2hodmopV92G6vwjGSoq596khgarHsKV+8sna/2XVW+EFkTSHs648iuUozlaCZQUh9ghfGsExxsqp+ZPW71gt9eqBRD/KwDyJv/g4UISDQEgwY7QGOiDF7SIcPlhYWrUST+55d/GLClTWXnmt43bWAPJuRDWq//z97O/gRAeRGsV034NuMwNzw2LcIIws12VYEsLT3Q3jqWcP8lfHHlmud9MdXb6jZjxRUmO8CW23vVndQxj5riLa5nBPCUKjNYCTYJiXXxZtW/5 jkritzen"
}


variable "ssh_path" {
  default = "/home/jkritzen/.ssh/authorized_keys"
}

variable "tags" {
  description = "The tags to associate with the resources."
  type        = "map"

  default = {
    owner = "j.kritzen@ontracon.de"
    env = "Development"
  }
}

variable "vnet_name" {
  description = "Name of the vnet to create"
  default     = "on-ams-dev-web-vnet-01"
}

variable "address_space" {
  description = "The address space that is used by the virtual network."
  default     = "172.16.0.0/16"
}

# If no values specified, this defaults to Azure DNS 
variable "dns_servers" {
  description = "The DNS servers to be used with vNet."
  default     = []
}

variable "vm_size" {
  description = "Size of VM's to be deployed."
  default     = "Standard_B1s"
}
