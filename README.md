# On-IaaC-Demo
Terraform &amp; Ansible, better together.

This Repository contains some simple IaaC Examples to deploy a simple Web Application on Azure with Terraform and Ansible. The example ties Terraform as Provisioning Tool and Ansible as Orchestration Tool together.

On Azure the following will be deployed:
* vNet with two subnets including basic NSG
* Load Balancer with Frontend IP & Backend Pool which probes the Backen on Port 8080
* n x VM's which are act as Backend Pool in an Availibility Set

# Prequisites
1. Create a Storage Account and a Access Key for the tfstate File as Backend.
2. Download the GIT Repository "git pull https://github.com/Ontracon/On-IaaC-Demo"
3. Edit "./terraform-azure-dev/variables.tf" to fit your kneeds
4. Initialize Terraform with Backend Key:
```
terraform init -backend-config="access_key=hYcbI7Yw58n9tWJ4bKt52MThlx6PLqQWAAUagTdcn0CLrIHN/qR07Y/yqeJeikCGVQSKvz/6NURQh/tNiUyyHw=="
```
