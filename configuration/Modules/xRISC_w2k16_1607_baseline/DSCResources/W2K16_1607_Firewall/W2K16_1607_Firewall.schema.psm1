Configuration W2K16_1607_Firewall
{
    Import-DscResource -ModuleName NetworkingDsc -ModuleVersion 6.3.0.0

    FirewallProfile ConfigurePrivateFirewallProfile
    {
        Name = "Private"
        Enabled = "False"
    }

    FirewallProfile ConfigurePublicFirewallProfile
    {
        Name = "Public"
        Enabled = "False"
    }

    FirewallProfile ConfigureDomainFirewallProfile
    {
        Name = "Domain"
        Enabled = "False"
    }
}
