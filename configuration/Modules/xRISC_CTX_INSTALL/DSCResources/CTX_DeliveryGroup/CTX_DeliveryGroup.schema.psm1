Configuration CTX_DeliveryGroup
{
    param (
    [Parameter(Mandatory)]
    [string] $Name,
    [Parameter(Mandatory)]
    [string[]] $ComputerName,
    [Parameter(Mandatory)]
    [string[]] $Users,
    [AllowNull()]
    [string] $Description = '',
    [ValidateSet('AppsOnly','DesktopsAndApps','DesktopsOnly')]
    [string] $DeliveryType = 'DesktopsAndApps',
    [ValidateSet('Private','Shared')]
    [string] $DesktopType = 'Shared',
    [ValidateNotNull()]
    [System.Boolean] $IsMultiSession = $true,
    [ValidateNotNull()]
    [PSCredential]$Credential
    )
    Import-DscResource -ModuleName XenDesktop7
    Import-DscResource -ModuleName PSDesiredStateConfiguration


    $resourceName = $Name.Replace(' ','_')

    XD7DesktopGroup "DesktopGroup_$resourceName" {
        Name = $Name
        Description = $Description
        DeliveryType = $DeliveryType
        DesktopType = $DesktopType
        IsMultiSession = $IsMultiSession
        Enabled = $true
        PsDscRunAsCredential = $Credential
    }

    XD7DesktopGroupMember "DesktopGroup_${resourceName}_Machines" {
        Name = $Name
        Members = $ComputerName
        PsDscRunAsCredential = $Credential
        DependsOn = "[XD7DesktopGroup]DesktopGroup_$resourceName"
    }

    if ($DeliveryType -in 'DesktopsAndApps','DesktopsOnly') {

        XD7EntitlementPolicy "DesktopGroup_${resourceName}_DesktopEntitlement" {
            DeliveryGroup = $Name
            Name = $Name
            Description = $Description
            EntitlementType = 'Desktop'
            PsDscRunAsCredential = $Credential
            DependsOn = "[XD7DesktopGroup]DesktopGroup_$resourceName"
        }
    }

    if ($DeliveryType -in 'DesktopsAndApps','AppsOnly') {

        XD7EntitlementPolicy "DesktopGroup_${resourceName}_ApplicationEntitlement" {
            DeliveryGroup = $Name
            Name = $Name
            EntitlementType = 'Application'
            PsDscRunAsCredential = $Credential
            DependsOn = "[XD7DesktopGroup]DesktopGroup_$resourceName"
        }
    }

    XD7AccessPolicy "DesktopGroup_${resourceName}_Direct" {
        DeliveryGroup = $Name
        AccessType = 'Direct'
        PsDscRunAsCredential = $Credential
        DependsOn = "[XD7DesktopGroup]DesktopGroup_$resourceName"
        IncludeUsers = $Users
    }

    XD7AccessPolicy "DesktopGroup_${resourceName}_AG" {
        DeliveryGroup = $Name
        AccessType = 'AccessGateway'
        PsDscRunAsCredential = $Credential
        DependsOn = "[XD7DesktopGroup]DesktopGroup_$resourceName"
        IncludeUsers = $Users
    }
}
