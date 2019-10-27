variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

provider "azurerm" {    
    subscription_id="${var.subscription_id}"
    client_id="${var.client_id}"
    client_secret="${var.client_secret}"
    tenant_id="${var.tenant_id}"  
}

resource "azurerm_resource_group" "dev" {
    name="avikdemowebapptf"
    location = "West Europe" 
}
resource "azurerm_app_service_plan" "dev" {
  name                = "appsrvcplan76a3800275"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "dev" {
  name                = "appsrvctf76a3800275"
  location            = "${azurerm_resource_group.dev.location}"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  app_service_plan_id = "${azurerm_app_service_plan.dev.id}"
}