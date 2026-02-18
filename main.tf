terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.36.0"
    }
  }
}

provider "azurerm" {
subscription_id = "dd2389996-6c64-43f2-8014-e5dff39e5e68"
client_id = "2595c5a6-9cb2-41b1-a1f7-d917a52e5519"
client_secret = "159f7c5a-d0d2-4474-8aa1-5f3d692169a2"
tenant_id = "e39ad0e8-07a8-4895-857c-71c83191a3cf"

features {
  
}
}


resource "azurerm_resource_group" "RG" {
  name     = "MyRG"
  location = "West Europe"
}
resource "azurerm_storage_account" "storage" {
  name                     = "webstorage1251"
  resource_group_name      = "MyRG"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"


}

resource "azurerm_storage_container" "container" {
  name                  = "container1"
  storage_account_id    = "/subscriptions/d2389996-6c64-43f2-8014-e5dff39e5e68/resourceGroups/MyRG/providers/Microsoft.Storage/storageAccounts/webstorage1251"
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob" {
  name                   = "mynewblob"
  storage_account_name   = "webstorage1251"
  storage_container_name = "container1"
  type                   = "Block"
  source                 = "main.tf"
}
