Configuration W2K16_1607_System
{
<#
  #Disable new lock screen
  registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen"
      ValueType = "dword"
      ValueData = "1"
    }

    #Disable Cortana
  ->registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowCortana"
      ValueType = "dword"
      ValueData = "0"
    }

    #Disable search web when searching pc
  ->registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\ConnectedSearchUseWeb"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\ConnectedSearchUseWeb"
      ValueType = "dword"
      ValueData = "0"
    }

    #Disable Web Search in search bar
  ->registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableWebSearch"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search\DisableWebSearch"
      ValueType = "dword"
      ValueData = "1"
    }

    #Disable send settings to cloud
    registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSync"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSync"
      ValueType = "dword"
      ValueData = "2"
    }

    ##OneDrive registry key creation
    registry_key { "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
      ensure = present
    }

    #Disable synchronizing files to onedrive
  ->registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive\DisableFileSyncNGSC"
      ValueType = "dword"
      ValueData = "1"
    }

    #Disable synchronizing files to cloud
    registry_value { "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSyncUserOverride"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\Windows\SettingSync\DisableSettingSyncUserOverride"
      ValueType = "dword"
      ValueData = "1"
    }

    ##WindowsStore registry key creation
    registry_key { "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore"
      ensure = present
    }

    #Disable Windows Store
  ->registry_value { "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore\RemoveWindowsStore"
      ensure = present
      Key = "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore\RemoveWindowsStore"
      ValueType = "dword"
      ValueData = "1"
    }

    #Disable Move to Recycle Bin
    registry_value { "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecycleFiles"
      ensure = present
      Key = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRecycleFiles"
      ValueType = "dword"
      ValueData = "1"
    }
#>
}
