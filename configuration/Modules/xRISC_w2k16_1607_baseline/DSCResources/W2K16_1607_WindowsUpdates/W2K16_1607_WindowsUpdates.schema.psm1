Configuration W2K16_1607_WindowsUpdates
{
     <#
  #Disable using your machine for sending windows updates to others
        registry_value { 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode':
        ensure => present,
        path   => 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config\DownloadMode',
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

      #registry_value { 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate':
    #  path => 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU\NoAutoUpdate',
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
