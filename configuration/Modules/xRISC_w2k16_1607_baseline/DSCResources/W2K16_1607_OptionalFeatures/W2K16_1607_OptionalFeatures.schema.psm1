Configuration W2K16_1607_OptionalFeatures
{
    WindowsOptionalFeature SMB1Protocol
    {
        Ensure = "Enable"
        Name = "SMB1Protocol"
        NoWindowsUpdateCheck = $true
    }

    # Remove Printing-XPSServices-Features
    WindowsOptionalFeature Printing-XPSServices-Features
    {
        Ensure = "Disable"
        Name = "Printing-XPSServices-Features"
        NoWindowsUpdateCheck = $true
    }

    # Remove Printing-Foundation-InternetPrinting-Client
    WindowsOptionalFeature Printing-Foundation-InternetPrinting-Client
    {
        Ensure = "Disable"
        Name = "Printing-Foundation-InternetPrinting-Client"
        NoWindowsUpdateCheck = $true
    }

    # Remove FaxServicesClientPackage
    WindowsOptionalFeature FaxServicesClientPackage
    {
        Ensure = "Disable"
        Name = "FaxServicesClientPackage"
        NoWindowsUpdateCheck = $true
    }

    # Enable NetFX3
    WindowsOptionalFeature NetFX3
    {
        Ensure = "Enable"
        Name = "NetFX3"
        NoWindowsUpdateCheck = $true
    }

    # Disable Windows Defender
    WindowsOptionalFeature WindowsDefender
    {
        Ensure = "Disable"
        Name = "Windows-Defender"
        NoWindowsUpdateCheck = $true
    }    
}
