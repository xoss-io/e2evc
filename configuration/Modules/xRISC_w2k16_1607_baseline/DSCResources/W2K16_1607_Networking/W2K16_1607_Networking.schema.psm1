Configuration W2K16_1607_Networking
{

    param(
        [string]$NetAdapter = "Ethernet"
    )
    Import-DscResource -ModuleName NetworkingDsc -ModuleVersion 6.3.0.0

    NetBios DisableNetBios
    {
        InterfaceAlias = "$NetAdapter"
        Setting        = "Disable"
    }

    # Disable Network Location
    Registry DisableNetworkLocation
    {
        Key         = "HKLM\System\CurrentControlSet\Control\Network"
        ValueName   = "NewNetworkWindowOff"
        ValueType   = "dword"
        ValueData   = "1"
        Ensure      = "Present"

    }
  
    # Disable TCP/IP Task Offload
    Registry DisableTCPTaskOffload
    {
        Key         = "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters"
        Ensure      = "Present"
        ValueName   = "DisableTaskOffload"
        ValueType   = "dword"
        ValueData   = "1"
      }

    # LanmanServer - Asynchronous Credits
    Registry LanmanServerAsynchronousCredits
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "AsynchronousCredits"
        ValueType   = "dword"
        ValueData   = "512"
      }

    # LanmanServer - Max MpxCt
    Registry LanmanServerMaxMpxCt
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "MaxMpxCt"
        ValueType   = "dword"
        ValueData   = "50"
      }

    # LanmanServer - Max Threads Per Queue
    Registry LanmanServerMaxThreadsPerQueue
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "MaxThreadsPerQueue"
        ValueType   = "dword"
        ValueData   = "20"
      }

    # LanmanServer - Require Security Signature
    Registry LanmanServerRequiereSecuritySignature
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "RequireSecuritySignature"
        ValueType   = "dword"
        ValueData   = "1"
      }

    # LanmanServer - Samba 2 Credits Max
    Registry LanmanServerSamba2CreditsMax
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "Smb2CreditsMax"
        ValueType   = "dword"
        ValueData   = "1024"
      }

    # LanmanServer - Samba 2 Credits Min
    Registry LanmanServerSamba2CreditsMin
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "Smb2CreditsMin"
        ValueType   = "dword"
        ValueData   = "64"
      }

    # LanmanServer - Treat host as stable storage
    Registry LanmanServerTreatHostAsStableStorage
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanServer\Parameters"
        Ensure      = "Present"
        ValueName   = "TreatHostAsStableStorage"
        ValueType   = "dword"
        ValueData   = "1"
      }

  
    # NTFS - 8dot3 Name Creation - Disable
    Registry Disable8dot3NameCreation
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem"
        Ensure      = "Present"
        ValueName   = "NtfsDisable8dot3NameCreation"
        ValueType   = "Dword"
        ValueData   = "1"
      }

    # Disable NotificationCenter
    Registry DisableNotificationCenter
    {
        Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell"
        Ensure      = "Present"
        ValueName   = "UseActionCenterExperience"
        ValueType   = "Dword"
        ValueData   = "0"
      }
}
