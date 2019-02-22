
$PSModules = "Pester,4.5"

foreach ($Ps in $PSModules){
    Write-Output "Loading module $PS"
    $module = $PS.split(",")[0]
    $version = $PS.split(",")[1]

    if (-not (get-module $module -ListAvailable | Where-object Version -gt $version)){
    try{
        Import-Module $module -ErrorAction Stop
        }
        catch{
            Write-Output "  Installing module $module"
            install-module $module -force -AllowClobber -Scope CurrentUser -SkipPublisherCheck -MinimumVersion $version
        }
    }
    if (get-module $module | Where-object Version -gt $version){
        Write-Output "  importing module $module"
        import-module $module -force  
    }
} 