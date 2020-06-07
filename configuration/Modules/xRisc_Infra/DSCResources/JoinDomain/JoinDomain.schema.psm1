Configuration JoinDomain
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$Domain,
        [Parameter(Mandatory = $true)]
        [string]$ComputerName,
        [Parameter(Mandatory = $true)]
        [pscredential] $Credential
    )
    Import-DscResource -ModuleName xActiveDirectory -ModuleVersion 2.22.0.0
    Import-DscResource -ModuleName ComputerManagementDsc 

    xWaitForADDomain DscForestWait
    {
        DomainName           = $Domain
        DomainUserCredential = $Credential
        RetryCount           = 60
        RetryIntervalSec     = 60
        
    }

    Computer JoinDomain
    {
        Name = $ComputerName
        DomainName = $Domain
        Credential = $Credential
        DependsOn  = "[xWaitForADDomain]DscForestWait"
    }
}
