resource "null_resource" "run-pestertest" {
  provisioner "local-exec" {
    command = ".\\scripts\\runTests.ps1 -resourceGroupname ${azurerm_resource_group.rg.name} -databaseName ${var.database_name} -serverName ${var.environment_prefix}${var.application}sql${var.location}${var.environment_suffix} -sqlAdministratorLogin ${var.sqladminuser} -sqlAdministratorLoginPassword ${var.sqladminpassword}",
    interpreter = ["PowerShell"]
  }
  depends_on = ["azurerm_sql_database.db", "null_resource.run-installtools"]
  triggers = {
    always_run = "${timestamp()}"
  }
}
