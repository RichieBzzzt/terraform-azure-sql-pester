Param(
    [string] $resourceGroupName,
    [string] $databaseName,
    [string] $sqlAdministratorLogin,
    [string] $sqlAdministratorLoginPassword,
    [string] $serverName,
    [string] $outputFile = '.\TestRun.xml'
)

Write-Host "Running Script tests"
$testPath = ".\tests\testSql.ps1"
Invoke-Pester -Script @{Path=$testPath; Parameters=@{databaseName = $databaseName; sqlAdministratorLogin = $sqlAdministratorLogin; sqlAdministratorLoginPassword = $sqlAdministratorLoginPassword; serverName = $serverName}} -OutputFile $outputFile -EnableExit