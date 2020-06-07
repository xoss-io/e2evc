Configuration W2K16_1607_Citrix_PVS_Optimizer
{

    # via https://support.citrix.com/article/CTX125874
    # Disable Offline Files
    Registry DisableOfflineFiles
    {              
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\NetCache"
        Ensure      = "Present"
        ValueName   = "Enabled"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Background Layout Service
    Registry BackgroundLayoutService
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout"
        Ensure      = "Present"
        ValueName   = "EnableAutoLayout"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Last Access Timestamp
    Registry LastAccessTimestamp
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem"
        Ensure      = "Present"
        ValueName   = "NtfsDisableLastAccessUpdate"
        ValueType   = "dword"
        ValueData   = "00000001"
    }

    Registry IgnorePageFileSize
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl]"
        Ensure      = "Present"
        ValueName   = "IgnorePagefileSize"
        ValueType   = "dword"
        ValueData   ="00000001"
    }

    # Disable Indexing Service
    # Deactivated in services resource
    # Registry IndexingService
    # {
    #     Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\cisvc"
    #     ValueName   = "Start"
    #     ValueType   = "Dword"
    #     ValueData   = "00000004"
    # }

    # Disable Move to Recycle Bin
    Registry DisableMoveToRecycleBin
    {
        Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Ensure      = "Present"
        ValueName   = "NoRecycleFiles"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Clear Page File at Shutdown
    Registry DisableClearPageFileAtShutdown
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management"
        Ensure      = "Present"             
        ValueName   = "ClearPageFileAtShutdown"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Windows SuperFetch
    Registry DisableWindowsSuperFetch
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain"
        Ensure      = "Present"
        ValueName   = "Start"
        ValueType   = "Dword"
        ValueData   ="00000004"
    }

    # # Disable Windows Search
    # Registry DisableWindowsSearch
    # {
    #     Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch"
    #     Ensure      = "Present"
    #     ValueName   = "Start"
    #     ValueType   = "Dword"
    #     ValueData   = "00000004"
    # }

    # Disable Machine Account Password Changes
    Registry DisableMachineAccountPasswordChanges
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"
        Ensure      = "Present"
        ValueName   = "DisablePasswordChange"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Per https://virtualfeller.com/2017/05/11/optimize-vdi-windows-10-user-interface-and-runtime-original-anniversary-and-creator-updates/
    # Disable the Windows 10 first logon animation
    Registry DisableFirstLogonAnimation
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
        Ensure      = "Present"
        ValueName   = "EnableFirstLogonAnimation"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Hide Hard Error Messages
    Registry DisableHardErrorMessages
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Windows"
        Ensure      = "Present"
        ValueName   = "ErrorMode"
        ValueType   = "Dword"
        ValueData   = "00000002"
    }

    # Disable Memory Dump Creation
    Registry DisableDump
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl"
        Ensure      = "Present"
        ValueName   = "CrashDumpEnabled"
        ValueType   = "dword"
        ValueData   = "00000000"
    }

    Registry DisableDumpLogEvent
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl"
        Ensure      = "Present"
        ValueName   = "LogEvent"
        ValueType   = "dword"
        ValueData   = "00000000"
    }

    Registry DisableDumpAlert
    {
        Key         = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\CrashControl"
        Ensure      = "Present"
        ValueName   = "SendAlert"
        ValueType   = "dword"
        ValueData   = "00000000"
    }

    # Disable Background Disk Defragmentation
    Registry DefragBootOptimizeFunction
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction"
        Ensure      = "Present"
        ValueName   = "Enable"
        ValueType   = "String"
        ValueData   = "N"
    }

    # Disable Background Auto-Layout
    Registry DefragBootOptimizeFunction
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout"
        Ensure      = "Present"
        ValueName   = "EnableAutoLayout"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Increase Disk I/O Timeout to 200 seconds
    Registry IncreaseDiskIOTimeout
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Disk"
        Ensure      = "Present"
        ValueName   = "TimeOutValue"
        ValueType   = "Dword"
        ValueData   = "000000C8"
    }

    # Further Optimizations
    # Disable Logon Background Image
    Registry DisableLogonBackgroundImage
    {
        Key         = "HKLM\SOFTWARE\Policies\Microsoft\Windows\System"
        Ensure      = "Present"
        ValueName   = "DisableLogonBackgroundImage"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Keep drivers and kernel on physical memory
    Registry MemoryManagement
    {
        Key         = "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management"
        Ensure      = "Present"
        ValueName   = "DisablePagingExecutive"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Hide Action Center Icon
    Registry HideActionCenter
    {
        Key         = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Ensure      = "Present"
        ValueName   = "HideSCAHealth"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Turn off change notify events for file and folder changes
    Registry DisableChangeNotifyEvents
    {
        Key         = "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        Ensure      = "Present"
        ValueName   = "NoRemoteRecursiveEvents"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Hide VMware Tools
    Registry HideVMwareTools
    {
        Key         = "HKLM\SOFTWARE\VMware, Inc.\VMware Tools"
        Ensure      = "Present"
        ValueName   = "ShowTray"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Offline Files
    Registry DisableOfflineFiles
    {
        Key         = "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\NetCache"
        Ensure      = "Present"
        ValueName   = "Enabled"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Background Images
    Registry DisableBackgroundImages
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System"
        Ensure      = "Present"
        ValueName   = "DisableLogonBackgroundImage"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Cortana
    Registry DisableCortana
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Ensure      = "Present"
        ValueName   = "AllowCortana"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Crash Control - Automatically Reboot - Enable
    Registry CrashControl
    {
        Key         = "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl"
        Ensure      = "Present"
        ValueName   = "AutoReboot"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # IPv6 - Disable 
    Registry IPv6Disable
    {
        Key         = "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
        Ensure      = "Present"
        ValueName   = "DisabledComponents"
        ValueType   = "Dword"
        ValueData   = "00000255"
    }

    # Disable new lock screen
    Registry DisableLockScreen
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization"
        Ensure      = "Present"
        ValueName   = "NoLockScreen"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Notification Center
    Registry DisableNotificationCenter
    {
        Key         = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell"
        Ensure      = "Present"
        ValueName   = "UseActionCenterExperience"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Remove previous versions capability
    Registry RemovePreviousVersions
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer"
        Ensure      = "Present"
        ValueName   = "NoPreviousVersionsPage"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Sync Files To OneDrive
    Registry DisableSyncFilesToOneDrive
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
        Ensure      = "Present"
        ValueName   = "DisableFileSyncNGSC"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Sync Files To Cloud
    Registry DisableSyncFilesToCloud
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\SettingSync"
        Ensure      = "Present"
        ValueName   = "DisableSettingSyncUserOverride"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Remove turn off hard disk after
    Registry RemoveTurnOffHardDisk
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\0012ee47-9041-4b5d-9b77-535fba8b1442\6738e2c4-e8a5-4a42-b16a-e040e769756e"
        Ensure      = "Present"
        ValueName   = "Attributes"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Web Search in search bar
    Registry DisableWebSearchInSearchBar
    {
        Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Ensure      = "Present"
        ValueName   = "DisableWebSearch"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Boot Optimize Function
    Registry DisableBootOptimization
    {
        Key         = "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction"
        Ensure      = "Present"
        ValueName   = "Enable"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Disable Memory Compression
    Registry DisableMemoryCompression
    {
        Key         = "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters"
        Ensure      = "Present"
        ValueName   = "EnablePrefetcher"
        ValueType   = "Dword"
        ValueData   = "00000000"
    }

    # Server specific Optimizations

    # Turn off Microsoft consumer experiences
    Registry DisableConsumerExperience
    {
        Key         = "HKLM\Software\Policies\Microsoft\Windows\CloudContent"
        Ensure      = "Present"
        ValueName   = "DisableWindowsConsumerFeatures"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Turn off Action Center
    Registry DisableActionCenter
    {
        Key         = "HKLM\Software\Policies\Microsoft\Windows\Explorer"
        Ensure      = "Present"
        ValueName   = "DisableNotificationCenter"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }

    # Disable Spooler Warnings
    Registry DisableSpoolerWarnings
    {
        Key         = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Providers"
        Ensure      = "Present"
        ValueName   = "EventLog"
        ValueType   = "Dword"
        ValueData   = "00000001"
    }
}