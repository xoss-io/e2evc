Configuration Network
{
    param(
        [Parameter(Mandatory = $true)]
        [string] $MAC,
        [Parameter(Mandatory = $true)]
        [string] $NetAdapterName,
        [Parameter(Mandatory = $true)]
        [string] $IPAdress,
        [Parameter(Mandatory = $true)]
        [int] $SubnetMask,
        [Parameter(Mandatory = $true)]
        [string] $DNS,
        [Parameter(Mandatory = $true)]
        [string] $Gateway
    )
    Import-DscResource -ModuleName xNetworking  -ModuleVersion 3.1.0.0

    NetAdapterName NetAdapterName {
        MacAddress = $MAC
        NewName =  $NetAdapterName
    }
    
    xDNSServerAddress SetDNS {
        Address = $DNS
        InterfaceAlias = $NetAdapterName
        AddressFamily  = "IPv4"
        DependsOn ="[NetAdapterName]NetAdapterName"
    }
    xIPAddress SetIP {
        IPAddress = $IPAdress
        InterfaceAlias = $NetAdapterName
        PrefixLength = $SubnetMask
        AddressFamily = "IPv4"
        DependsOn ="[NetAdapterName]NetAdapterName"
    }
    xDefaultGatewayAddress SetDefaultGateway {
        Address        = $Gateway
        InterfaceAlias = $NetAdapterName
        AddressFamily  = "IPv4"
        DependsOn ="[NetAdapterName]NetAdapterName"
    }
}
