module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-tst-anmew"

  location = "southeastasia"
  tags = {
    environment = "development"
  }
}

module "virtual_network" {
  source = "./modules/virtual_network"

  # Virtual Network Configuration
  resource_group_name  = "rg-tst-anmew"
  virtual_network_name = "vnet-tst-anmew"
  address_space        = ["10.0.0.0/16"]

  subnets = [
    {
      name             = "subnet-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-2"
      address_prefixes = ["10.0.2.0/24"]
      security_group   = "nsg-tst-anmew"
    }
  ]

  tags = {
    environment = "development"
  }
}

module "network_security_group" {
  source = "./modules/network_security_group"

  # Network Security Group Configuration
  resource_group_name         = "rg-tst-anmew"
  network_security_group_name = "nsg-tst-anmew"

  security_rules = [
    {
      name                       = "allow-ssh"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}