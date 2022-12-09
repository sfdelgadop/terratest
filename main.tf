terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  database_config = [{
    db_edition        = "GeneralPurpose"
    db_name           = "db01"
    elastic_pool_name = ""
    max_size_gb       = "5"
    sku_name          = "GP_Gen5_2"
    }, {
    db_edition        = "Standard"
    db_name           = "db02"
    elastic_pool_name = ""
    max_size_gb       = "5"
    sku_name          = "S0"
  }]
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

module tf_azure_appservice_plan_mrasptst {
  source                     = "git@github.com:procter-gamble/terraform-azure-app-service-plan.git?ref=v3.0.0"
  sku_workers                = 1
  os                         = "windows"
  app_service_environment_id = ""
  resource_tags = {
    app_shortname                = "cloudpipelines"
    app_id                       = "CI002489694"
    Application_Name             = "cloudpipelines"
    Billing_Notification_Group   = ""
    Cost_Center                  = "1000501541"
    Original_Requestor           = "rzodkiewicz.mr@pg.com"
    Owner_Notification_Group     = ""
    Owning_Role                  = ""
    Security_Notification_Group  = ""
    Stage                        = "Dev"
    Technical_Notification_Group = ""
    WBS_Element                  = null
    terraform_managed            = "true"
  }
  resource_name   = "mrasptst"
  sku_tier        = "PremiumV6"
  subscription_id = ""
  resource_group  = "AZ-RG-grey-Dev-03"
  access_groups   = ["CPA-ManageAccess"]
  sku_size        = "P1v2"
}
