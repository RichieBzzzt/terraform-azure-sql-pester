resource "azurerm_sql_server" "sqlbox" {
  name                         = "${var.environment_prefix}${var.application}sql${var.location}${var.environment_suffix}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  location                     = "${var.location}"
  version                      = "12.0"
  administrator_login          = "${var.sqladminuser}"
  administrator_login_password = "${var.sqladminpassword}"
}

resource "azurerm_sql_database" "db" {
  name                = "${var.database_name}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${var.location}"
  server_name         = "${azurerm_sql_server.sqlbox.name}"
  requested_service_objective_name  = "${var.service_objective_size}"
}

resource "azurerm_sql_firewall_rule" "allow_azure" {
  name                = "allow_azure"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.sqlbox.name}"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

data "http" "myip" {
   url = "http://bot.whatismyipaddress.com/"
}

resource "azurerm_sql_firewall_rule" "allow_local" {
  name                = "allow_local"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  server_name         = "${azurerm_sql_server.sqlbox.name}"
  start_ip_address    = "${data.http.myip.body}"
  end_ip_address      = "${data.http.myip.body}"
}
