# #
# # Get FQDN Data from VM's
# #
# data "template_file" "inventory" {
#   template = file("templates/inventory.tpl")
#   vars = {
#     # Using Public FQDN Name for ansible
#     web = join("\n", azurerm_public_ip.pip_vms.*.fqdn)
#     # Using private IP Adress for ansible
#     #  web = "${join("\n", azurerm_network_interface.vm_nics.*.private_ip_address)}"
#
#   }
#   depends_on = [
#     "azurerm_virtual_machine.vms",
#     "azurerm_public_ip.pip_vms",
#   ]
#
# }
#
# #
# # Create Inventory & execute Ansible
# #
# # resource "null_resource" "cmd_ansible" {
# #
# #   }
#
# provisioner "local-exec" {
#   #   triggers {
#   #    template_rendered = data.template_file.inventory.rendered
#   # }
#   command = "echo '${data.template_file.inventory.rendered}' > ../ansible/inventory && ansible-playbook -i ../ansible/inventory ../ansible/site.yml"
#
#
# }
