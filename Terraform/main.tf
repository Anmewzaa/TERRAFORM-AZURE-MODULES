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
  resource_group_name = "rg-tst-anmew"
  virtual_network_name = "vnet-tst-anmew"
  address_space = ["10.0.0.0/16"]

  subnets = [
    {
      name = "subnet1"
      address_prefixes = ["10.0.1.0/24"]
    }
  ]

  tags = {
    environment = "development"
  }
}