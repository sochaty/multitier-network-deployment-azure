business_department     = "hr"
environment             = "dev"
resource_group_name     = "rg-demo"
resource_group_location = "westeurope"
vnet_name               = "vnet-default"
vnet_address_space      = ["90.0.0.0/16"]

subnets = [
  {
    name    = "websubnet",
    address = ["90.0.1.0/24"],
    ports = {
      "100" : "80",
      "110" : "443",
      "120" : "22"
    }
  },
  {
    name    = "appsubnet",
    address = ["90.0.2.0/24"],
    ports = {
      "100" : "80",
      "110" : "443",
      "120" : "8080",
      "130" : "22"
    }
  },
  {
    name    = "dbsubnet",
    address = ["90.0.3.0/24"],
    ports = {
      "100" : "3306",
      "110" : "1433",
      "120" : "5432"
    }
  },
  {
    name    = "bastionsubnet",
    address = ["90.0.4.0/24"],
    ports = {
      "100" : "3306",
      "110" : "1433",
      "120" : "5432"
    }
  }
]