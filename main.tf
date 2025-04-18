terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}
provider "azurerm" {
  features {
    
  }
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
resource "azurerm_app_service_plan" "plan" {
  name                = "appservice-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "app" {
  app_service_plan_id = azurerm_app_service_plan.plan.id
  location            = azurerm_resource_group.rg.location
  name                = var.app_name
  resource_group_name = azurerm_resource_group.rg.name
  site_config {
    always_on : false
  }
}
resource "azurerm_application_insights" "ai" {
  application_type    = "web"
  location            = var.location
  name                = "${var.app_name}-ai"
  resource_group_name = azurerm_resource_group.rg.name
}
