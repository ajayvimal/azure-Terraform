terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.36.0"
    }
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
