  
  
param(
    [Parameter(Mandatory=$true)]
    [string]$DomainName,
    [Parameter(Mandatory=$true)]
    [string]$DomainAdminUser,
    [Parameter(Mandatory=$true)]
    [string]$DomainAdminUserPassword,
    [Parameter(Mandatory=$false)]
    [string]$DomainControllerIP,
    [Parameter(Mandatory=$false)]
    [string]$NewHostname,
    [Parameter(Mandatory=$false)]
    [boolean]$Restart = $true

)

# Computer info
$hostInfo = Get-WmiObject win32_computersystem
Write-Output "The current hostname is $($env:ComputerName)`n"
Write-Output "The current host is already in a domain: $($hostInfo.partofdomain)"
Write-Output "The current domain is $($hostInfo.Domain)"

# Domain Join
$secureDomainAdminUserPassword = ConvertTo-SecureString $DomainAdminUserPassword -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList "$DomainName\$DomainAdminUser",$secureDomainAdminUserPassword

$alreadyDomainJoined = $hostInfo.partofdomain -eq $true -and ($hostInfo.Domain -like $DomainName)
$hostnameIsDifferent = $NewHostname -ne "" -and $env:ComputerName -notlike "*$($NewHostname)*"

if($hostnameIsDifferent -and $alreadyDomainJoined){
    Write-Information "The computer is already part of the domain but has different hostname! Unjoining it from the domain in order to rejoin it with the correct hostname."
    Remove-Computer -UnjoinDomaincredential $cred -PassThru -Verbose -Restart -Force
    return
}

if(-not $hostnameIsDifferent -and $alreadyDomainJoined){
    Write-Information "The computer is already part of the domain and named correctly"
    return
}

if($NewHostname) {
    $hostnameIsDifferent = $env:ComputerName -notlike "*$($NewHostname)*"

    if($hostnameIsDifferent){
      Write-Output "Renaming Computer from $($env:ComputerName) to $($NewHostname).."
      Rename-Computer -NewName $NewHostname

      Write-Output "Restarting server.."
      Restart-Computer -Force
      return
    }
}

if($DomainControllerIP) {
    $serverAlreadyConfigured = Get-DnsClientServerAddress "Ethernet" -AddressFamily IPv4 | Where {$_.ServerAddresses -contains $DomainControllerIP}
    if(-not $serverAlreadyConfigured){
        Write-Output "Setting the DNS client server address to $DomainControllerIP ..."
        Set-DnsClientServerAddress "Ethernet" -ServerAddresses $DomainControllerIP
    }
    else {
        Write-Output "The specified domain controller ip '$DomainControllerIP' is already configured as a dns server address..."
    }
}

Write-Output "Adding computer to the domain..."
if($Restart){
    Add-Computer -DomainName $DomainName -Credential $cred -Restart -Verbose -ErrorAction Stop
}
else {
    Add-Computer -DomainName $DomainName -Credential $cred -Verbose -ErrorAction Stop
}