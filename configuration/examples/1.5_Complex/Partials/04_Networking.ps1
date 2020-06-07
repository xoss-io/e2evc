 # Disable Network Location
 Registry DisableNetworkLocation
 {
     Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Network"
     Ensure      = "Present"
     ValueName   = "NewNetworkWindowOff"
     ValueType   = "dword"
     ValueData   = "1"
 }

 # Disable TCP/IP Task Offload
 Registry DisableTCPTaskOffload
 {
     Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP\Parameters\"
     Ensure      = "Present"
     ValueName   = "DisableTaskOffload"
     ValueType   = "dword"
     ValueData   = "1"
   }