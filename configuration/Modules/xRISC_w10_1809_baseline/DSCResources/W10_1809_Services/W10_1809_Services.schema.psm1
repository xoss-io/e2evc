Configuration W10_1809_Services
{

  # Increase services startup timeout from 30 to 45 seconds
  Registry IncreaseServicesStartupTimeout
  {
      Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"
      Ensure      = "Present"
      ValueName   = "ServicesPipeTimeout"
      ValueType   = "Dword"
      ValueData   = "2400"
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
   
     #Disabling Bitlocker Drive Encryption service
     Service "BDESVC"
     {
       Name        = "BDESVC"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Disabling Block Level Backup Engine service
     Service "wbengine"
     {
       Name        = "wbengine"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Disabling Bluetooth Handsfree service
    #  Service "BthHFSrv"
    #  {
    #    Name        = "BthHFSrv"
    #    State       = "stopped"
    #    StartupType = "Disabled"
    #  }
   
     #Disabling Bluetooth Support service
     Service "bthserv"
     {
       Name        = "bthserv"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Branche Cache service
     Service "PeerDistSvc"
     {
       Name        = "PeerDistSvc"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Disabling Computer Browser service
    #  Service "Browser"
    #  {
    #    Name        = "Browser"
    #    State       = "stopped"
    #    StartupType = "Disabled"
    #  }
   
     #Disabling Device Association Service
     Service "DeviceAssociationService"
     {
       Name        = "DeviceAssociationService"
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
   
     #Disabling Encrypting File System service
     Service "EFS"
     {
       Name        = "EFS"
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
   
       #Disabling Infrared Monitoring service
       Service "irmon"
       { 
         Name        = "irmon"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       # Disabling Microsoft Account Sign-in Assistant service
       Service wlidsvc
       {
         Name        = "wlidsvc"
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
   
       #Disabling Optimize drives service
       Service "defragsvc"
       {
         Name        = "defragsvc"
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
   
       #Disabling Security service
       Service "wscsvc"
       {
         Name        = "wscsvc"
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
   
       #Disabling Sensor service
       Service "SensorService"
       {
        Name        = "SensorService"
        State       = "stopped"
        StartupType = "Disabled"
       }
   
       #Disabling Shell Hardware Detection service
       Service "ShellHWDetection"
       {
         Name        = "ShellHWDetection"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling SSDP Discovery service
       Service "SSDPSRV"
       {
         Name        = "SSDPSRV"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling Superfetch service
       Service "SysMain"
       {
         Name        = "SysMain"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling Themes service
       Service "Themes"
       {
         Name        = "Themes"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling Touch Keyboard and Handwriting Panel service
       #Service TabletInputService
       #{
       #  Name        = "TabletInputService"
       #  State       = "stopped"
       #  StartupType = "Disabled"
       #}
   
       #Disabling UPnP Device Host service
       Service "upnphost"
       {
         Name        = "upnphost"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling Volume Shadow Copy service
       #Service VSS
       #{
       #  Name        = "VSS"
       #  State       = "stopped"
       #  StartupType = "Disabled"
       #}
   
       #Disabling Wi-fi Direct Connect Manager service
       #Service WFDSConMgrSvc
       #{
       #  Name        = "WFDSConMgrSvc"
       #  State       = "stopped"
       #  StartupType = "Disabled"
       #}
   
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
   
      
       #Disabling Windows Mobile Hotspot service
       Service "icssvc"
       {
          Name        = "icssvc"
          State       = "stopped"
          StartupType = "Disabled"
       }
   
       #Disabling Windows Search
      #  Service "WSearch"
      #  {
      #  Name        = "WSearch"
      #    State       = "Running"
      #    StartupType = "Automatic"
      #  }
   
       #Disabling WLAN AutoConfig service
       Service "WlanSvc"
       {
         Name        = "WlanSvc"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       #Disabling WWAN AutoConfig service
       Service "WwanSvc"
       {
         Name        = "WwanSvc"
         State       = "stopped"
         StartupType = "Disabled"
       }
    #Cryptographic services as proper service
    Service "CryptSvc"
    {
      Name        = "CryptSvc"
      State       = "Running"
      StartupType = "Automatic"
      BuiltInAccount = "LocalSystem"
    }
}