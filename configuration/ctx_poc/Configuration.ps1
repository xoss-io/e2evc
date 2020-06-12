Configuration "CTX_POC"{

    Import-DscResource -ModuleName ComputerManagementDsc 
    Import-DscResource -ModuleName XenDesktop7
    Import-DscResource -ModuleName XOSSBaselineModuleDSC
    Import-DscResource -ModuleName NetworkingDSC
    Import-Dscresource -ModuleName XOSSCtxOptimizationW2k19Any1809DSC
    Import-DscResource -ModuleName xDSCDomainjoin

    $Administrator = $ConfigurationData.Domain.Administrator
    $Credential =  Get-Credential -Username $Administrator -Message "Please type the password for the administrative user"


    Node $AllNodes.NodeName {
      
        DnsServerAddress "Domaincontroller" {
            Address = $ConfigurationData.Domain.Server
            InterfaceAlias = "internal"
            AddressFamily  = 'IPv4'
            Validate       = $true
        }

        xDSCDomainjoin "Defaults" {
            Domain = $ConfigurationData.Domain.Name
            Credential =  $Credential
            DependsOn =  "[DnsServerAddress]Domaincontroller"
        }
      

        PendingReboot "CheckReboot" {
            Name = "CheckComponents"
            SkipComponentBasedServicing = $false
            SkipWindowsUpdate = $false
            SkipPendingFileRename = $false
            SkipPendingComputerRename = $false
        }

        PowerPlan SetPlanHighPerformance
        {
          IsSingleInstance = 'Yes'
          Name             = 'High performance'
        }

        RemoteDesktopAdmin RemoteDesktopSettings
        {
            IsSingleInstance   = 'yes'
            Ensure             = 'Present'
            UserAuthentication = 'Secure'
        }
        XOSSPackageInstaller "Host" #ResourceName
        {
            Id = [GUID]::NewGuid()
            InstallationScope = "Host"
            PackageManagementUrl = "https://packages.infraxo-dev.com/api/packages"
            ConfigurationManagementUrl = "https://config.infraxo-dev.com/api/dsc"
            PsDscRunAsCredential   = $Credential 
            
        }
       
        foreach($role in $Node.Roles){
            . ".\Roles\$role.ps1"
        }
    }
}
