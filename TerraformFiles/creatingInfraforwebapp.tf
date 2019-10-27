
provider "azurerm" { }


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