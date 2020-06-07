Configuration W2K16_1607_Services
{

    # Increase services startup timeout from 30 to 45 seconds
    Registry IncreaseServicesStartupTimeout
    {
        Key         = "HKLM\SYSTEM\CurrentControlSet\Control"
        Ensure     = "Present"
        ValueName   = "ServicesPipeTimeout"
        ValueType   = "Dword"
        ValueData   = "0000afc8"
    }

    # Per https://docs.microsoft.com/en-us/windows-server/security/windows-services/security-guidelines-for-disabling-system-services-in-windows-server

    # ActiveX Installer 
    Service AxInstSV
    {
        Name        = "AxInstSV"
        State       = "stopped"
        StartupType = "Disabled"
    }    
    
    # Audio Endpoint Builder
    Service AudioEndpointBuilder
    {
        Name        = "AudioEndpointBuilder"
        State       = "stopped"
        StartupType = "Disabled"
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

    #Disabling Application Management
    Service AppMgmt
    {
        Name        = "AppMgmt"
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
     Service "BthHFSrv"
     {
       Name        = "BthHFSrv"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Disabling Bluetooth Support service
     Service "bthserv"
     {
       Name        = "bthserv"
       State       = "stopped"
       StartupType = "Disabled"
     }

     # CDPUserSvc
     Service "CDPUserSvc"
     {
       Name        = "CDPUserSvc"
       State       = "stopped"
       StartupType = "Disabled"
     }

     # DcpSvc - DataCollectionPublishingService
     Service "DcpSvc"
     {
       Name        = "DcpSvc"
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
     # Service "Browser"
     # {
     #   Name        = "Browser"
     #   State       = "stopped"
     #   StartupType = "Disabled"
     # }
   
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

     # DiagTrack - Connected User Experiences and Telemetry [Diagnostics Tracking Service]
     Service "DiagTrack"
     {
       Name        = "DiagTrack"
       State       = "stopped"
       StartupType = "Disabled"
     }

     # dmwappushservice - dmwappushsvc
     Service "dmwappushservice"
     {
       Name        = "dmwappushservice"
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

     # Eaphost - Extensible Authentication Protocol
     Service "Eaphost"
     {
       Name        = "Eaphost"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
     #Disabling Fax service
     Service "Fax"
     {
       Name        = "Fax"
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

     # Windows Camera Frame Server
     Service "FrameServer"
     {
       Name        = "FrameServer"
       State       = "stopped"
       StartupType = "Disabled"
     }
   
       #Disabling Home Group Listener service
     Service "HomeGroupListener"
     {  
       Name        = "HomeGroupListener"
       State       = "stopped"
       StartupType = "Disabled"
     }

       # Contact Data
       Service "PimIndexMaintenanceSvc"
       {  
         Name        = "PimIndexMaintenanceSvc"
         State       = "stopped"
         StartupType = "Disabled"
       }


       # HvHost - HV Host Service
       # Service "HvHost"
       # {  
       #   Name        = "HvHost"
       #   State       = "stopped"
       #   StartupType = "Disabled"
       # }

       # Link-Layer Topology Discovery Mapper
       Service "lltdsvc"
       {  
         Name        = "lltdsvc"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmickvpexchange - Hyper-V Data Exchange Service
       Service "vmickvpexchange"
       {  
         Name        = "vmickvpexchange"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicguestinterface - Hyper-V Guest Service Interface
       Service "vmicguestinterface"
       {  
         Name        = "vmicguestinterface"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicshutdown - Hyper-V Guest Shutdown Interface
       Service "vmicshutdown"
       {  
         Name        = "vmicshutdown"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicheartbeat - Hyper-V Heartbeat Service
       Service "vmicheartbeat"
       {  
         Name        = "vmicheartbeat"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicvmsession - Hyper-V PowerShell Direct Service
       Service "vmicvmsession"
       {  
         Name        = "vmicvmsession"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicrdv - Hyper-V Remote Desktop Virtualization Service
       Service "vmicrdv"
       {  
         Name        = "vmicrdv"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmictimesync - Hyper-V Time Synchronization Service
       Service "vmictimesync"
       {  
         Name        = "vmictimesync"
         State       = "stopped"
         StartupType = "Disabled"
       }

       # vmicvss - Hyper-V Volume Shadow Copy Requestor
       Service "vmicvss"
       {  
         Name        = "vmicvss"
         State       = "stopped"
         StartupType = "Disabled"
       }
  
       # lfsvc - Geolocation Service
       Service "lfsvc"
       {  
         Name        = "lfsvc"
         State       = "stopped"
         StartupType = "Disabled"
       }

    # MapsBroker - Downloaded Maps Manager
    Service "MapsBroker"
    {  
        Name        = "MapsBroker"
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

       # Smart Card Device Enumeration Service
       Service "ScDeviceEnum"
       {
         Name        = "ScDeviceEnum"
         State       = "stopped"
         StartupType = "Disabled"
       }     
   
       # Disabling Themes service
       Service "Themes"
       {
         Name        = "Themes"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
       Service TabletInputService
       {
         Name        = "TabletInputService"
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
   
       # Disabling Windows Mobile Hotspot service
       Service "icssvc"
       {
       Name        = "icssvc"
         State       = "stopped"
         StartupType = "Disabled"
       }
   
      #  #Disabling Windows Search
      #  Service "WSearch"
      #  {
      #  Name        = "WSearch"
      #    State       = "stopped"
      #    StartupType = "Disabled"
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
   
    #Disabling Indexing Service
    Service "cisvc"
    {
        Name        = "cisvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # UI0Detect - Interactive Services Detection
    Service "UI0Detect"
    {
        Name        = "UI0Detect"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # iphlpsvc - IP Helper
    Service "iphlpsvc"
    {
        Name        = "iphlpsvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # ltdsvc - Link-Layer Topology Discovery Mapper
    Service "ltdsvc"
    {
        Name        = "ltdsvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # diagnosticshub.standardcollector.service - Microsoft [R] Diagnostics Hub Standard Collector Service
    Service "diagnosticshub.standardcollector.service"
    {
        Name        = "diagnosticshub.standardcollector.service"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # wlidsvc - Microsoft Account Sign-in Assistant
    Service "wlidsvc"
    {
        Name        = "wlidsvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # MSiSCSI - Microsoft iSCSI Initiator Service
    # Service "MSiSCSI"
    # {
    #     Name        = "MSiSCSI"
    #     State       = "stopped"
    #     StartupType = "Disabled"
    # }

    # smphost - Microsoft Storage Spaces SMP
    # Service "smphost"
    # {
    #     Name        = "smphost"
    #     State       = "stopped"
    #     StartupType = "Disabled"
    # }

    # NcbService - Network Connection Broker
    Service "NcbService"
    {
        Name        = "NcbService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # NcaSvc - Network Connectivity Assistant
    Service "NcaSvc"
    {
        Name        = "NcaSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Microsoft Passport Container
    Service "NgcCtnrSvc"
    {
        Name        = "NgcCtnrSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Microsoft Passport
    Service "NgcSvc"
    {
        Name        = "NgcSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # defragsvc - Optimize drives
    Service "defragsvc"
    {
        Name        = "defragsvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Sync Host
    Service "OneSyncSvc"
    {
        Name        = "OneSyncSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Quality Windows Audio Video Experience
    Service "QWAVE"
    {
        Name        = "QWAVE"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # wercplsupport - Problem Reports and Solutions Control Panel
    Service "wercplsupport"
    {
        Name        = "wercplsupport"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # PcaSvc - Program Compatibility Assistant Service
    Service "PcaSvc"
    {
        Name        = "PcaSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Printer Extensions and Notifications
    Service "PrintNotify"
    {
        Name        = "PrintNotify"
        State       = "Running"
        StartupType = "Automatic"
    }

    # RmSvc - Radio Management Service
    Service "RmSvc"
    {
        Name        = "RmSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # RasMan - Remote Access Connection Manager
    Service "RasMan"
    {
        Name        = "RasMan"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # SstpSvc - Secure Socket Tunneling Protocol Service
    # Service "SstpSvc"
    # {
    #     Name        = "SstpSvc"
    #     State       = "stopped"
    #     StartupType = "Disabled"
    # }

    # SensorDataService - Sensor Data Service
    Service "SensorDataService"
    {
        Name        = "SensorDataService"
        State       = "stopped"
        StartupType = "Disabled"
    }

  
    # SensorService - Sensor Service
    Service "SensorService"
    {
        Name        = "SensorService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # SNMPTRAP - SNMP Trap
    Service "SNMPTRAP"
    {
        Name        = "SNMPTRAP"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # sacsvr - Special Administration Console Helper
    Service "sacsvr"
    {
        Name        = "sacsvr"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # svsvc - Spot Verifier
    Service "svsvc"
    {
        Name        = "svsvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # User Data Storage
    Service "UnistoreSvc"
    {
        Name        = "UnistoreSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # User Data Access
    Service "UserDataSvc"
    {
        Name        = "UserDataSvc"
        State       = "stopped"
        StartupType = "Disabled"
    }


    # Windows Image Acquisition (WIA)
    Service "stisvc"
    {
        Name        = "stisvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # TieringEngineService - Storage Tiers Management
    Service "TieringEngineService"
    {
        Name        = "TieringEngineService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # wisvc - Windows Insider Service
    Service "wisvc"
    {
        Name        = "wisvc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # wuauserv - Windows Update
    Service "wuauserv"
    {
        Name        = "wuauserv"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # dot3svc - Wired AutoConfig
    Service "dot3svc"
    {
        Name        = "dot3svc"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # XblAuthManager - Xbox Live Auth Manager
    Service "XblAuthManager"
    {
        Name        = "XblAuthManager"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # XblGameSave - Xbox Live Game Save
    Service "XblGameSave"
    {
        Name        = "XblGameSave"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Windows Push Notifications System Service
    Service "WpnService"
    {
        Name        = "WpnService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Windows Push Notifications User Service
    Service "WpnUserService"
    {
        Name        = "WpnUserService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # WalletService
    Service "WalletService"
    {
        Name        = "WalletService"
        State       = "stopped"
        StartupType = "Disabled"
    }

    # Still Image Acquisition Events
    Service "WiaRpc"
    {
        Name        = "WiaRpc"
        State       = "stopped"
        StartupType = "Disabled"
    }
}