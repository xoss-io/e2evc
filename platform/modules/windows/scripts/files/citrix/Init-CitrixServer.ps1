param(
    [Parameter(Mandatory=$true)]
    [string]$Hostname,
    [Parameter(Mandatory=$true)]
    [int]$HostID,
    [Parameter(Mandatory=$true)]
    [ValidateSet('Storefront', 'Delivery_Controller', 'Database')]
    [string]$CitrixServerType,
    [Parameter(Mandatory=$true)]
    [string]$DomainName,
    [Parameter(Mandatory=$true)]
    [string]$DomainAdminUser,
    [Parameter(Mandatory=$true)]
    [string]$DomainAdminUserPassword,
    [Parameter(Mandatory=$false)]
    [string]$DomainControllerIP,
    [Parameter(Mandatory=$false)]
    [string]$DscConfigName,
    [Parameter(Mandatory=$true)]
    [string]$DscPullserverUrl,
    [Parameter(Mandatory=$true)]
    [string]$DscRegistrationKey
)
try {

  # Parameters
  $targetHostname = "$HostName$($HostID.ToString('0000'))" # DEMOWWW0001
  $targetDscConfigurationName = $DscConfigName

  if(-not $DscConfigName){

    $configurationSuffix = "Primary"

    if($HostID -gt 1) {
        $configurationSuffix = "Additional"
    }

    $configurationPrefix = "CTX"
    if($CitrixServerType -eq "Storefront"){
      $configurationPrefix = "CTX_SF"
    } elseif ($CitrixServerType -eq "Delivery_Controller"){
      $configurationPrefix = "CTX_DDC"
    } elseif($CitrixServerType -eq "Database"){
      $configurationPrefix = "CTX_DB"
    }

    $targetDscConfigurationName = "$($configurationPrefix)_$($configurationSuffix)"
  }

  Start-Transcript -Path "$env:windir\Temp\UserData-$(Get-Date -Format FileDateTime).log" -NoClobber

  Write-Output "Working directory: $(Get-Location)"
  
  Write-Output "The target hostname will be $($targetHostname) and will have the following dsc config $($targetDscConfigurationName)"

  # Rename host and join domain

  .\Join-Domain.ps1 -NewHostname $targetHostname -DomainName $DomainName -DomainAdminUser $DomainAdminUser -DomainAdminUserPassword $DomainAdminUserPassword -DomainControllerIP $DomainControllerIP

  # DSC Configuration Initialization

  $hostInfo = Get-WmiObject win32_computersystem
  $alreadyDomainJoined = $hostInfo.partofdomain -eq $true -and ($hostInfo.Domain -like $DomainName)

  if($alreadyDomainJoined){
    .\Init-DscConfiguration.ps1 -ConfigName $targetDscConfigurationName -PullserverUrl $DscPullserverUrl -RegistrationKey $DscRegistrationKey
  }
}
catch {
  Write-Output "The following error occurred:`n$($_.Exception)"
}
finally {
  try{ Stop-Transcript } catch{}
}