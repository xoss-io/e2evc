Configuration W10_1809_OptionalFeatures
{
    # Enable SMB1
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

  
    # Disable Windows MediaPlayer
    WindowsOptionalFeature WindowsMediaPlayer
    {
        Ensure = "Enable"
        Name = "WindowsMediaPlayer"
        NoWindowsUpdateCheck = $true
    }

    # Disable WCF Port Sharing
    WindowsOptionalFeature WCFTCPPortSharing45
    {
        Ensure = "Disable"
        Name = "WCF-TCP-PortSharing45"
        NoWindowsUpdateCheck = $true
    }

    # Disable Work Folders
    WindowsOptionalFeature Workfolders
    {
        Ensure = "Disable"
        Name = "WorkFolders-Client"
        NoWindowsUpdateCheck = $true
    }

    # Disable XPS Printing
    WindowsOptionalFeature XPSPrinting
    {
        Ensure = "Disable"
        Name = "Printing-XPSServices-Features"
        NoWindowsUpdateCheck = $true
    }

    # Disable InternetPrinting
    WindowsOptionalFeature InternetPrinting
    {
        Ensure = "Disable"
        Name = "Printing-Foundation-InternetPrinting-Client"
        NoWindowsUpdateCheck = $true
    }

    # Disable FaxServices
    WindowsOptionalFeature FaxServices
    {
        Ensure = "Disable"
        Name = "FaxServicesClientPackage"
        NoWindowsUpdateCheck = $true
    }
}
