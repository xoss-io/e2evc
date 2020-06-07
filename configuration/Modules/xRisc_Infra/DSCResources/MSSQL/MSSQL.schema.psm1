Configuration MSSQL
{
    param(

        [Parameter(Mandatory)]
        [string] $Media,
        [Parameter(Mandatory)]
        [string] $Instance,
        [ValidateNotNullOrEmpty()]
        [string] $Features = 'SQLENGINE,FULLTEXT',
        [ValidateNotNullOrEmpty()]
        [string] $LogDir = 'C:\Logs\',
        [ValidateNotNullOrEmpty()]
        [string] $InstallDir = 'C:\Microsoft SQL Server\MSSQL11.MSSQLSERVER',     
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $Admins,
        [Parameter(Mandatory)]
        [ValidateSet("SQL","Windows")]
        [string] $SecurityMode,       
        [int]$Port = 0,       
        [Parameter(Mandatory)]
        [pscredential] $Credential,
        [pscredential] $saCredential
    )


    Import-DscResource -ModuleName SQLServerDsc -ModuleVersion 12.2.0.0
    WindowsFeature 'NetFramework45'
          {
               Name   = 'NET-Framework-45-Core'
               Ensure = 'Present'
          }

    # SqlSetup Setup
    # {
    #     SourcePath           = "$Media"
    #     InstanceName         = "$Instance"
    #     Features             = "$Features"
    #     SQLSysAdminAccounts  = "$Admins"
    #     InstallSharedDir     = "C:\Microsoft SQL Server"
    #     InstallSharedWOWDir  = "C:\Program Files (x86)\Microsoft SQL Server"
    #     InstanceDir          = "C:\Microsoft SQL Server"
    #     InstallSQLDataDir    = "$InstallDir\MSSQL\Data"
    #     SQLUserDBDir         = "$InstallDir\MSSQL\Data"
    #     SQLUserDBLogDir      = "$LogDir\$Instance\UserDB"
    #     SQLTempDBDir         = "$InstallDir\MSSQL\Data"
    #     SQLTempDBLogDir      = "$LogDir\$Instance\TempDB"
    #     SQLBackupDir         = "$InstallDir\MSSQL\Data"
    #     ASDataDir            = "$InstallDir\OLAP\Data"
    #     ASLogDir             = "$LogDir\$Instance\AS"
    #     ASBackupDir          = "$InstallDir\OLAP\Backup"
    #     ASTempDir            = "$InstallDir\OLAP\Temp"
    #     ASConfigDir          = "$InstallDir\OLAP\Config"
    #     SecurityMode         = "$SecurityMode"
    #     SAPwd                = $saCredential
    #     PsDscRunAsCredential = $Credential
    #     UpdateEnabled        = "FALSE"
        
    # }
     SqlSetup 'Setup'
    {
        InstanceName        = 'MSSQLSERVER'
        Features            = $Features
        SourcePath          = $Media
        SQLSysAdminAccounts = $Admins
        PsDscRunAsCredential = $Credential
        DependsOn           = '[WindowsFeature]NetFramework45'
    }


    if($port -gt 0){
        SQLServerNetwork ConfigureSQLNetwork
        {
            DependsOn = "[SqlSetup]Setup"
            InstanceName = "$Instance"
            ProtocolName = "tcp"
            IsEnabled = $true
            TCPPort = $Port
            RestartService = $true
        }

        SqlWindowsFirewall "$Instance"
        {
            SourcePath   = "$Media"
            InstanceName = $Instance
            Features     = $Features
            DependsOn    = "[SqlSetup]Setup"
            
        }
    }
}
