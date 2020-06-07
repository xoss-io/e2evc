param(
    [string[]]$ConfigName = "Empty",
    [string]$PullserverUrl = "https://config.infra-x0.com/api/dsc",
    [string]$RegistrationKey = '3e0cbed0-0b21-4e8e-874e-7577f9cda75f'
)

Write-Output "Setting up WSMan and enforcing 16 MB "
Set-Item -Path WSMan:\localhost\MaxEnvelopeSizeKb -Value 16384

Write-Output "Allowing 4GB WSMan memory"
Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 4096

$dscLocalConfigurationManager = Get-DscLocalConfigurationManager
$isLCMInitialized = $dscLocalConfigurationManager | Select -ExpandProperty ConfigurationDownloadManagers

if(-not $isLCMInitialized){
    
    Write-Output "Initializing the Local Configuration Manager (LCM)"

    Write-Output "Going to proceed DSC LCM configuration with config $ConfigName."

    Write-Output "Loading LCM Default configuration"
    . ".\LCMDefault.ps1"

    Write-Output "Compiling LCM Default Configuration for $ConfigName"
    LCMDefault -ConfigName $ConfigName -PullserverUrl $PullserverUrl -RegistrationKey $RegistrationKey
    Write-Output "Assigning LCM"
    Set-DSCLocalConfigurationManager  -Path .\LCMDefault\ -Verbose
    Write-Information "Starting dsc configuration update..."
    Update-DscConfiguration -Verbose
}
else {
    Write-Information "The computer has already an initialized Local Configuration Manager!"
    Write-Information "Starting dsc configuration ..."
    Start-DscConfiguration -Verbose -UseExisting
}