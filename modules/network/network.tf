resource "azurerm_network_security_group" "devnsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  #   security_rule {
  #   name                       = "eventdriven-rl"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "Tcp"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "*"
  #   destination_address_prefix = "*"
  # }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "pvt_subnet1" {
  name                 = var.pvt_subnet1
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix_pvt_subnet1
  depends_on = [
    azurerm_virtual_network.vnet
  ]
}

resource "azurerm_subnet" "pvt_subnet2" {
  name                 = var.pvt_subnet2
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix_pvt_subnet2
  depends_on = [
    azurerm_subnet.pvt_subnet1
  ]
}

resource "azurerm_subnet" "pub_subnet1" {
  name                 = var.pub_subnet1
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix_pub_subnet1
  depends_on = [
    azurerm_subnet.pvt_subnet2
  ]
}

resource "azurerm_subnet" "pub_subnet2" {
  name                 = var.pub_subnet2
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix_pub_subnet2
  service_endpoints    = ["Microsoft.Sql"]
  depends_on = [
    azurerm_subnet.pub_subnet1
  ]
}

resource "azurerm_subnet" "aks_subnet" {
  name                 = var.pvt_aks_subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefix_pvt_aks_subnet
  depends_on = [
    azurerm_subnet.pub_subnet2
  ]

}

# resource "azurerm_nat_gateway" "nat" {
#   name                = var.eventdriven_nat_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
# }

# resource "azurerm_subnet_nat_gateway_association" "nat_asso" {
#   subnet_id      = azurerm_subnet.aks_subnet.id
#   # nat_gateway_id = azurerm_nat_gateway.nat.id
# }


resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.aks_subnet.id
  network_security_group_id = azurerm_network_security_group.devnsg.id
}

# Load banlancer

# resource "azurerm_public_ip" "public_ip" {
#   name                = var.public_ip_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   allocation_method   = var.ip_allocation_method
# }

# resource "azurerm_lb" "lb" {
#   name                = var.lb_name
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.example.id
#   }
# }