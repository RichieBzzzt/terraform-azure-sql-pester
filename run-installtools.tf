resource "null_resource" "run-installtools" {
  provisioner "local-exec" {
    command = ".\\scripts\\installTools.ps1",
    interpreter = ["PowerShell"]
  }
  depends_on = ["azurerm_sql_database.fxrates"]
   triggers = {
    always_run = "${timestamp()}"
  }
}
