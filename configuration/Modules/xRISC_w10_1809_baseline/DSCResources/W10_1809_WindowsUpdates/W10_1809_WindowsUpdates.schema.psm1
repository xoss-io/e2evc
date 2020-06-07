Configuration W10_1809_WindowsUpdates
{

    # Disable Windows Updates
    Registry DisableWU
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
        Ensure      = "Present"
        ValueName   = "NoAutoUpdate"
        ValueType   = "dword"
        ValueData   = "00000001"
    }

    # Disable Send Windows Updates
    Registry DisableSendWU
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
        Ensure      = "Present"
        ValueName   = "DownloadMode"
        ValueType   = "dword"
        ValueData   = "00000000"
    }

    # Restrict Windows Delivery Optimization Updates
    Registry DisableSendWUOptimization
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
        Ensure      = "Present"
        ValueName   = "DownloadModeRestricted"
        ValueType   = "dword"
        ValueData   = "00000001"
    }

    # Restrict Windows Delivery Optimization Updates
    Registry DisableSendWUOptimizationUpdates
    {
        Key = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config"
        Ensure      = "Present"
        ValueName   = "DODownloadMode"
        ValueType   = "dword"
        ValueData   = "00000000"
    }
     <#
  #Disable using your machine for sending windows updates to others
        registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode':
        ensure => present,
        path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode',
        type   => 'dword',
        data   => '0',
      }

      Disable Windows Autoupdate
      [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update]
      "NoAutoUpdate"=dword:00000001
      "AUOptions"=dword:00000001
      "ScheduledInstallDay"=dword:00000000
      "ScheduledInstallTime"=dword:00000003

      Disable Windows Autoupdate
      [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\
      WindowsUpdate\Auto Update]
      "AUOptions"=dword:00000001
      "ScheduledInstallDay"=dword:00000000
      "ScheduledInstallTime"=dword:00000003
      [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
      "Start"=dword:00000004

      #registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate':
    #  path => 'HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate',
    #  ensure => present,
    #  type   => 'dword',
    #  #data   => '',
    #}

    registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\NoAutoUpdate':
    ensure => present,
    path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\NoAutoUpdate',
    type   => 'dword',
    data   => '1',
  }

  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AUOptions':
    ensure => present,
    path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\AUOptions',
    type   => 'dword',
    data   => '1',
  }

  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallDay':
    ensure => present,
    path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallDay',
    type   => 'dword',
    data   => '0',
  }

  registry_value { 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallTime':
    ensure => present,
    path   => 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\ScheduledInstallTime',
    type   => 'dword',
    data   => '3',
    }
    #>
}
