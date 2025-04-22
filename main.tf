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
resource "azurerm_service_plan" "plan" {
  name                = "appservice-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "F1"
  os_type = "Linux"
}
resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    always_on = false
    application_stack {
      node_version = "18-lts"
    }
  }

  depends_on = [
    azurerm_application_insights.ai
  ]
}
resource "azurerm_application_insights" "ai" {
  application_type    = "web"
  location            = var.location
  name                = "${var.app_name}-ai"
  resource_group_name = azurerm_resource_group.rg.name
}
