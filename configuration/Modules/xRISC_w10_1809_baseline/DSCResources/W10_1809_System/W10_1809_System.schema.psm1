Configuration W10_1809_System
{
 # Appx Packages
Registry DisableWindowsConsumerFeatures 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "DisableWindowsConsumerFeatures"
    ValueType   = "dword"
    ValueData   = "00000001"
}

Registry ContentDeliveryAllowed 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "ContentDeliveryAllowed"
    ValueType   = "dword"
    ValueData   = "00000000"
}


Registry OemPreInstalledAppsEnabled 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "OemPreInstalledAppsEnabled"
    ValueType   = "dword"
    ValueData   = "00000000"
}

Registry PreInstalledAppsEnabled 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "PreInstalledAppsEnabled"
    ValueType   = "dword"
    ValueData   = "00000000"
}

Registry PreInstalledAppsEverEnabled 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "PreInstalledAppsEverEnabled"
    ValueType   = "dword"
    ValueData   = "00000000"
}

Registry SilentInstalledAppsEnabled 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "SilentInstalledAppsEnabled"
    ValueType   = "dword"
    ValueData   = "00000000"
}
Registry SystemPaneSuggestionsEnabled 
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    Ensure      = "Present"
    ValueName   = "SystemPaneSuggestionsEnabled"
    ValueType   = "dword"
    ValueData   = "00000000"
}

    Registry "2D46B6DC-2207-486B-B523-A557E6D54B47"
     {
        Key = "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\"
        ValueName = "DisableFileSyncNGSC"
        ValueType   = "dword"
        ValueData   = "1"
        Ensure = "Present"
     }
}
