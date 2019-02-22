# terraform-azure-sql-pester

Project is a terraform-based project.

## To Build/Deploy Project

* You will need to specify the values yourself for anything not in double quotes in the ```terraform.tfvars``` -  

```text
subscription_id = ""
subscription_name = ""
environment_suffix = ""
tenant_id = ""
```

Some variables are sensitive and need to be added to a secrets.auto.tfvars file which will not be added to the repo as it is included in the gitignore file.

* At root directory create a ```secrets.auto.tfvars``` and enter the following parameters. You will need to specify the values yourself.

```text
sqladminpassword = password of sql admin account on box
sqladminuser = username of sql admin
```

* Make sure you have [terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) installed and added to path.
* Make sure you have [az cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?view=azure-cli-latest) installed.
* Should you have more than one subscription, specify it ```az account set --subscription="SUBSCRIPTION_ID"```
* Open shell at root of directory (ie PowerShell)
* Login using az commands
* Run ```terraform init```
* If successful, run ```terraform apply```

Pester Tests are run as ```null_resource``` resource via the ```local_exec``` provider, and have triggers so that they are always run.