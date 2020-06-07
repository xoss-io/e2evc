# Increase services startup timeout from 30 to 45 seconds
Registry IncreaseServicesStartupTimeout
{
    Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"
    Ensure      = "Present"
    ValueName   = "ServicesPipeTimeout"
    ValueType   = "Dword"
    ValueData   = "120000"
}

#Disabling AllJoyn Router service
Service AJRouter
{
    Name        = "AJRouter"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Application Layer Gateway service
Service ALG
{
    Name        = "ALG"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Background Intelligent Transfer service
Service "BITS"
{
    Name        = "BITS"
    State       = "stopped"
    StartupType = "Manual"
}

#Branche Cache service
Service "PeerDistSvc"
{
    Name        = "PeerDistSvc"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Diagnostic Policy service
Service "DPS"
{
Name        = "DPS"
State       = "stopped"
StartupType = "Disabled"
}

#Disabling Diagnostic service Host service
Service "WdiServiceHost"
{
Name        = "WdiServiceHost"
State       = "stopped"
StartupType = "Disabled"
}

#Disabling Diagnostic System Host service
Service "WdiSystemHost"
{
Name        = "WdiSystemHost"
State       = "stopped"
StartupType = "Disabled"
}

#Connected User Experiences and Telemetry
Service "DiagTrack"
{
Name        = "DiagTrack"
State       = "stopped"
StartupType = "Disabled"
}

#Disabling Function Discovery Provider Host service
Service "fdPHost"
{
    Name        = "fdPHost"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Function Discovery Resource Publication service
Service "FDResPub"
{
Name        = "FDResPub"
State       = "stopped"
StartupType = "Disabled"
}

#Disabling Internet Connection Sharing (ICS) service
Service "SharedAccess"
{
    Name        = "SharedAccess"
    State       = "stopped"
    StartupType = "Disabled"
}

# Disabling Microsoft Maps Download Manager service
Service MapsBroker
{
    Name        = "MapsBroker"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Offline Files service
Service "CscService"
{
    Name        = "CscService"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Retail Demo service
Service "RetailDemo"
{
    Name        = "RetailDemo"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Sensor Monitoring service
Service "SensrSvc"
{
    Name        = "SensrSvc"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling UPnP Device Host service
Service "upnphost"
{
    Name        = "upnphost"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Windows Connect Now - Config Registrar service
Service "wcncsvc"
{
    Name        = "wcncsvc"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Windows Error Reporting service
Service "WerSvc"
{
    Name        = "WerSvc"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Windows Media Player Network Sharing service
Service "WMPNetworkSvc"
{
Name        = "WMPNetworkSvc"
    State       = "stopped"
    StartupType = "Disabled"
}

#Disabling Windows Mobile Hotspot service
Service "icssvc"
{
    Name        = "icssvc"
    State       = "stopped"
    StartupType = "Disabled"
}