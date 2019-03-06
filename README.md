# On-IaaC-Demo
Terraform &amp; Ansible, better together.

This Repository contains some simple IaaC Examples to deploy a simple Web Application on Azure with Terraform and Ansible. The example ties Terraform as Provisioning Tool and Ansible as Orchestration Tool together.

On Azure the following will be deployed:
* vNet with two subnets including basic NSG
* Load Balancer with Frontend IP & Backend Pool which probes the Backen on Port 8080
* n x VM's which are act as Backend Pool in an Availibility Set
![Graph](/(graph.png)

## Prequisites
1. Create a Storage Account and a Access Key for the tfstate File as Backend.
2. Create a Application (API) User for Terraform
3. Set up the Access to Azure ARM Portal:
https://www.terraform.io/docs/providers/azurerm/index.html

4. Download the GIT Repository "git pull https://github.com/Ontracon/On-IaaC-Demo"
5. Edit "./terraform-azure-dev/variables.tf" to fit your needs
6. Initialize Terraform with Backend Key:
```
terraform init -backend-config="access_key=MySecretAccessKey"
```
## Deploy Application with Terraform (from ./terraform-azure-dev)
* First create the Plan:

`terraform plan --out MyPlan`
* Deploy the Application on Azure:

`terraform apply "MyPlan"`
* Destroy the Application:

`terraform destroy`

## Deploy Application from Ansible with Terraform
`ansible-playbook main.yml`


# Layout
```
.
├── ansible
│   ├── group_vars
│   │   └── all
│   ├── inventory
│   ├── roles
│   │   ├── common
│   │   │   ├── handlers
│   │   │   │   └── main.yml
│   │   │   ├── tasks
│   │   │   │   ├── main.yml
│   │   │   │   ├── security.yml
│   │   │   │   └── update.yml
│   │   │   └── templates
│   │   └── web
│   │       ├── tasks
│   │       │   ├── go-autostart.yml
│   │       │   ├── go-wget-app.yml
│   │       │   └── main.yml
│   │       └── templates
│   │           └── on-webapp-demo.service.j2
│   └── site.yml
├── LICENSE
├── main.yml
├── README.md
└── terraform-azure-dev
    ├── ansible.tf
    ├── graph.png
    ├── lb.tf
    ├── main.tf
    ├── network.tf
    ├── nsg.tf
    ├── outputs.tf
    ├── templates
    │   └── inventory.tpl
    ├── variables.tf
    └── vms.tf

```
