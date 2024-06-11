# No resources deployed by this module so this file is here as an entry point only
# Please navigate the variables, locals and outputs to see how the data model is generated from the inputs

# Need to consider remediation steps for Landing Zones once deploy_management_resources has been run, for example:
# - remediate_vm_monitoring   = bool
# - remediate_vmss_monitoring = bool
provider "azurerm" {
  alias           = "management"
  subscription_id = "d1a7ebf8-bbf9-465b-96e7-09c013117714"
  features {}
}
