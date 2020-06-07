# Disable customer experience improvement program
Registry DisableCEIP
{
    Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\SQMClient\Windows\"
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

# Location based info in searches
Registry DisableLocation
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
    Ensure      = "Present"
    ValueName   = "AllowSearchToUseLocation"
    ValueType   = "dword"
    ValueData   = "00000000"
}

# Disable search web when searching pc
Registry DisableSearchWeb
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
    Ensure      = "Present"
    ValueName   = "ConnectedSearchUseWeb"
    ValueType   = "dword"
    ValueData   = "00000000"
}

# Disable send additional info with error reports
Registry DisableAdditionalInfoErrorReports
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"
    Ensure      = "Present"
    ValueName   = "DontSendAdditionalData"
    ValueType   = "dword"
    ValueData   = "00000001"
}

# Lock Workstation after 10 minutes
Registry InactivityTimeoutSecs
{
    Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    Ensure      = "Present"
    ValueName   = "InactivityTimeoutSecs"
    ValueType   = "dword"
    ValueData   = "00000600"
}