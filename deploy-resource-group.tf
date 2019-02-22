resource "azurerm_resource_group" "rg" {
  name     = "${var.environment_prefix}-${var.application}-sql-${var.location}${var.environment_suffix}"
  location = "${var.location}"
}
