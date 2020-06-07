Configuration W2K16_1607_SecPol
{
    # Disable Telemetry Collection
    Registry DisableTelemetryCollection
    {
        ValueName   = "AllowTelemetry"
        Ensure      = "Present"
        Key         = "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection\"
        ValueType   = "dword"
        ValueData   = "0"
    }

    # Disable customer experience improvement program
    Registry DisableCEIP
    {
        Key         = "HKLM\Software\Microsoft\SQMClient\Windows\"
        Ensure      = "Present"
        ValueName   = "CEIPEnable"
        ValueType   = "dword"
        ValueData   = "0"
    }

    # Disable Windows Defender
    Registry DisableWindowsDefender
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"
        Ensure      = "Present"
        ValueName   = "Real-Time Protection"
        ValueType   = "dword"
        ValueData   = "1"
    }

    # Disable Anti Spyware
    Registry DisableAntiSpyWare
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\DisableAntiSpyware"
        Ensure      = "Present"
        ValueName   = "DisableAntiSpyware"
        ValueType   = "dword"
        ValueData   = "1"
    }

    # Disable UAC
    Registry DisableUAC
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        Ensure      = "Present"
        ValueName   = "EnableLUA"
        ValueType   = "dword"
        ValueData   = "1"
    }

    # Disable UAC ConsentPromptBehaviorAdmin
    Registry DisableUACContentPromptAdmin
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        Ensure      = "Present"
        ValueName   = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        ValueType   = "dword"
        ValueData   = "0"
    }

    # Disable UAC ConsentPromptBehaviorUser
    Registry DisableUACContentPromptAUser
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        Ensure      = "Present"
        ValueName   = "ConsentPromptBehaviorUser"
        ValueType   = "dword"
        ValueData   = "0"
    }

    # CIS Hardening
    # Enabling PowerShell script block logging will record detailed information from the processing of PowerShell commands and scripts
    Registry PSScriptBlogLogging  
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
        Ensure      = "Present"
        ValueName   = "EnableScriptBlockLogging"
        ValueType   = "dword"
        ValueData   = "0"
    }
}
