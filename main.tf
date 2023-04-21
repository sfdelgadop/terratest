# This is automatically generated by Cloud Launchpad, do not edit manually

# %LP-MODULES-METADATA-V2-BEGIN%
# tf_azure_vnet%LP%parser01%LP%178%LP%3.0.1
# tf_azure_storage_account%LP%aksprovitst0981%LP%176%LP%3.1.2.1
# tf_azure_appservice_plan%LP%parser01w%LP%191%LP%3.0.0
# tf_azure_appservice_plan%LP%parser02w%LP%191%LP%3.0.0
# tf_azure_webapp%LP%parser02%LP%177%LP%3.1.3
# tf_azure_functionapp%LP%parser01%LP%185%LP%3.0.5
# %LP-MODULES-METADATA-V2-END%

module "tf_azure_vnet_parser01" {
  source          = "git@github.com:procter-gamble/terraform-azure-vnet.git?ref=v3.0.1"
  resource_name   = "parser01"
  subscription_id = "c7f5c8f1-daef-4ccd-9064-3c513c1842dd"
  resource_group  = "AZ-RG-LaunchpadDemo-Dev-01"
  address_space   = ["10.99.0.0/20"]
  access_groups   = ["CPA-ManageAccess"]
  resource_tags = {
    Application_Id               = "CI002489694"
    Application_Name             = "CloudTerraformPipelines"
    Billing_Notification_Group   = ""
    Cost_Center                  = "1000500004"
    Original_Requestor           = "grey.gs@pg.com"
    Owner_Notification_Group     = ""
    Owning_Role                  = ""
    Security_Notification_Group  = ""
    Stage                        = "Dev"
    Technical_Notification_Group = ""
    WBS_Element                  = "1.100.0005.5075.G1005906"
    terraform_managed            = "true"
  }
  subnets = [{
    address_prefix                = ""
    delegation_action             = "Microsoft.Network/virtualNetworks/subnets/action"
    delegation_name               = ""
    enforce_private_link_endpoint = "false"
    service_endpoints             = []
    subnet_name                   = "default"
    }, {
    address_prefix                = ""
    delegation_action             = "Microsoft.Network/virtualNetworks/subnets/action"
    delegation_name               = ""
    enforce_private_link_endpoint = "true"
    service_endpoints             = []
    subnet_name                   = "privatelink"
    }, {
    address_prefix                = ""
    delegation_action             = "Microsoft.Network/virtualNetworks/subnets/action"
    delegation_name               = ""
    enforce_private_link_endpoint = "false"
    service_endpoints             = []
    subnet_name                   = "subnet1"
  }]
  subnet_size = 2
  providers = {
    "azurerm.pgi" = "azurerm.pgi"
  }
}


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
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
  database_config =[{
    db_edition = "GeneralPurpose"
    db_name = "db01"
    elastic_pool_name = ""
    max_size_gb = 5
    sku_name = "GP_Gen5_2"
    }, {
    db_edition = "Standard"
    db_name = "db02"
    elastic_pool_name = ""
    max_size_gb = "5"
    sku_name = "S0"
    test_list = ["abc","123","test"]
    new-inner-attr = "test"
  }]
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
  resource_name   = "azw-mrasptst"
  sku_tier        = "PremiumV6"
  subscription_id = ""
  resource_group  = "AZ-RG-grey-Dev-03"
  access_groups   = ["CPA-ManageAccess", "test"]
  sku_size        = "P1v2"
new-attr="new"
new-attr2="new"
new-attr3="new"
new-attr4="new"
new-attr5=  new
}
