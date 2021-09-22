provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "project2" {
  name     = "myproject3"
  location = "eastus2"
}



resource "azurerm_app_service_plan" "appser" {
  name = "ajithapp1"
  location = azurerm_resource_group.project2.location
  resource_group_name = azurerm_resource_group.project2.name
  kind = "Linux"
  reserved = True  
  sku {
    tier = "Basic"
    size = "B1"
  }  
  
}


resource "azurerm_app_service" "appser" {
  name                = "ajipto2012"
  resource_group_name      = azurerm_resource_group.project2.name
  location                 = azurerm_resource_group.project2.location
  app_service_plan_id = azurerm_app_service_plan.appser.id

  site_config {                                                            
     linux_fx_version = "PYTHON|3.6"                                        
   }                                  

  
}
