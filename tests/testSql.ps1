
#Requires -Modules Pester
 
Param(
    [string] $databaseName,
    [string] $sqlAdministratorLogin,
    [string] $sqlAdministratorLoginPassword,
    [string] $serverName
)

$conn = "Server=$($serverName).database.windows.net,1433;Initial Catalog=$($DatabaseName);Persist Security Info=False;User ID=$($sqlAdministratorLogin);Password=$($sqlAdministratorLoginPassword);MultipleActiveResultSets=False;TrustServerCertificate=True;Connection Timeout=30;"
Describe "Check Database Exists" {
    it 'Test Database Exists' {
        $sqlConnection = new-object System.Data.SqlClient.SqlConnection ($conn)
        $sqlConnection.Open()
        $dbName = $sqlConnection.Database
        $sqlConnection.Dispose();
        $dbname | Should Be "bzzzt"
    }	
}