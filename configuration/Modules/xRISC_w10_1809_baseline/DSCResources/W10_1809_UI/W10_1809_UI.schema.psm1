Configuration W10_1809_UI
{

    #Disable DelayedDesktopSwitchTimeout
   
    Registry DisableWU
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        Ensure      = "Present"
        ValueName   = "DelayedDesktopSwitchTimeout"
        ValueType   = "dword"
        ValueData   = "2"
    }
    

    Registry DisableActionCenter
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        Ensure      = "Present"
        ValueName   = "DisableNotificationCenter"
        ValueType   = "dword"
        ValueData   = "1"
    }
    Registry DisableTrayIcon
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        Ensure      = "Present"
        ValueName   = "NoAutoTrayNotify"
        ValueType   = "dword"
        ValueData   = "1"
    }

    Registry HidePeopleBar
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        Ensure      = "Present"
        ValueName   = "HidePeopleBar"
        ValueType   = "dword"
        ValueData   = "1"
    }
    Registry HideRecentlyAddedApps
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        Ensure      = "Present"
        ValueName   = "HideRecentlyAddedApps"
        ValueType   = "dword"
        ValueData   = "1"
    }

    Registry NoDrives
    {
        Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Ensure      = "Present"
        ValueName   = "NoDrives"
        ValueType   = "dword"
        ValueData   = "58720287"
    }
    
 
     Registry AllowgameDVR
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR"
        Ensure      = "Present"
        ValueName   = "AllowgameDVR"
        ValueType   = "dword"
        ValueData   = "0"
    }

    Registry DisableWindowsSecurityNotifications
    {
        Key ="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications"
        Ensure      = "Present"
        ValueName   = "DisableEnhancedNotifications"
        ValueType   = "dword"
        ValueData   = "1"
    }

    Registry DisableWindowsSecurityNotificationsPolicy
    {
        Key ="HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications"
        Ensure      = "Present"
        ValueName   = "DisableEnhancedNotifications"
        ValueType   = "dword"
        ValueData   = "1"
    }
   
}
