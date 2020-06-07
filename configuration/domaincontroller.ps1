Configuration DomainControllers

{
    param
    (
        [Parameter(Mandatory = $true)][PSCredential]$SafeModeCredentials,
        [Parameter(Mandatory = $true)][PSCredential]$VMCredentials,
        [Parameter(Mandatory = $true)][PSCredential]$DomainAdministratorCredentials,
        [Parameter(Mandatory = $true)][string]$AdministratorAccount,
        [Parameter(Mandatory = $true)][string]$FirstDomainControllerName,
        [Parameter(Mandatory = $true)][string]$FirstDomainControllerIPAddress,
        [Parameter(Mandatory = $true)][string]$FirstDomainControllerName,
        [Parameter(Mandatory = $true)][string]$SecondDomainControllerIPAddress,
        [Parameter(Mandatory = $true)][string]$GatewayAddress,
        [Parameter(Mandatory = $true)][string]$SubnetMask,
        [Parameter(Mandatory = $true)][string]$DomainName,
        [Parameter(Mandatory = $true)][string]$DomainDnsName
    )

    Import-Module PSDesiredStateConfiguration
    Import-Module xActiveDirectory

    Import-DscResource -ModuleName PSDesiredStateConfiguration
    Import-DscResource -ModuleName xActiveDirectory

    Node $FirstDomainControllerName
    {
        File ADFiles
            {
            DestinationPath = 'C:\NTDS'
            Type = 'Directory'
            Ensure = 'Present'
        }

        WindowsFeature DNS
            {
            Ensure = "Present"
            Name = "DNS"
        }

        xIPAddress SetIP
            {

            IPAddress = $FirstDomainControllerIPAddress
            InterfaceAlias = 'Ethernet'
            DefaultGateway = $GatewayAddress
            SubnetMask = $SubnetMask
            AddressFamily = 'IPv4'
        }

        xDnsServerAddress DnsServerAddress
            {
                Address        = '127.0.0.1'
                InterfaceAlias = 'Ethernet'
                AddressFamily  = 'IPv4'
                DependsOn = "[WindowsFeature]DNS"

        }

        WindowsFeature AD-Domain-Services
            {
                Ensure = "Present"
                Name = "AD-Domain-Services"
                DependsOn = "[File]ADFiles"
        }

        WindowsFeature RSAT-DNS-Server
            }
            Ensure = "Present"
            Name = "RSAT-DNS-Server"
            DependsOn = "[WindowsFeature]DNS"
        }

        WindowsFeature RSAT-AD-Tools
            {
            Name = 'RSAT-AD-Tools'
            Ensure = 'Present'
            DependsOn = "[WindowsFeature]AD-Domain-Services"
        }

        WindowsFeature RSAT-ADDS
            {
            Ensure = "Present"
            Name = "RSAT-ADDS"
            DependsOn = "[WindowsFeature]AD-Domain-Services"
        }

        WindowsFeature RSAT-ADDS-Tools
            {
            Name = 'RSAT-ADDS-Tools'
            Ensure = 'Present'
            DependsOn = "[WindowsFeature]RSAT-ADDS"
        }

        WindowsFeature RSAT-AD-AdminCenter
            {
            Name = 'RSAT-AD-AdminCenter'
            Ensure = 'Present'
            DependsOn = "[WindowsFeature]AD-Domain-Services"
        }

        xADDomain PrimaryDC
            {
            DomainName = $DomainDnsName
            DomainNetbiosName = $DomainName
            DomainAdministratorCredential = $DomainAdministratorCredentials
            SafemodeAdministratorPassword = $SafeModeCredentials
            DatabasePath = 'C:\NTDS'
            LogPath = 'C:\NTDS'
            DependsOn = "[WindowsFeature]AD-Domain-Services"
        }

        xADGroup AddAdminToDomainAdminsGroup
            {
            GroupName = "Domain Admins"
            GroupScope = 'Global'
            Category = 'Security'
            MembersToInclude = @($AdministratorAccount, "Administrator")
            Ensure = 'Present'
            Credential = $DomainAdministratorCredentials
        }

        xADGroup AddAdminToEnterpriseAdminsGroup
            {
            GroupName = "Enterprise Admins"
            GroupScope = 'Universal'
            Category = 'Security'
            MembersToInclude = @($AdministratorAccount, "Administrator")
            Ensure = 'Present'
            Credential = $DomainAdministratorCredentials
        }
    }
}