Configuration W10_1809_ScheduledTasks
{
    Import-DscResource -ModuleName ComputerManagementDsc 

 
    ScheduledTask "SmartScreenSpecific"
    {
      TaskName = "SmartScreenSpecific"
      TaskPath = "\Microsoft\Windows\AppID\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "MicrosoftCompatibilityAppraiser"
    {
      TaskName = "Microsoft Compatibility Appraiser"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "ProgramDataUpdater"
    {
      TaskName = "ProgramDataUpdater"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "StartupAppTask"
    {
      TaskName = "StartupAppTask"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask Proxy
    {
      TaskName = "Proxy"
      TaskPath = "\Microsoft\Windows\Autochk\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "UninstallDeviceTask"
    {
      TaskName = "UninstallDeviceTask"
      TaskPath = "\Microsoft\Windows\Bluetooth\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "ProactiveScan"
    {
      TaskName = "ProactiveScan"
      TaskPath = "\Microsoft\Windows\Chkdsk\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "CreateObjectTask"
    {
      TaskName = "CreateObjectTask"
      TaskPath = "\Microsoft\Windows\CloudExperienceHost\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Consolidator"
    {
      TaskName = "Consolidator"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "KernelCeipTask"
    {
      TaskName = "KernelCeipTask"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "UsbCeip"
    {
      TaskName = "UsbCeip"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "ScheduledDefrag"
    {
      TaskName = "ScheduledDefrag"
      TaskPath = "\Microsoft\Windows\Defrag\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Scheduled"
    {
      TaskName = "Scheduled"
      TaskPath = "\Microsoft\Windows\Diagnosis\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Microsoft-Windows-DiskDiagnosticDataCollector"
    {
      TaskName = "Microsoft-Windows-DiskDiagnosticDataCollector"
      TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Microsoft-Windows-DiskDiagnosticResolver"
    {
      TaskName = "Microsoft-Windows-DiskDiagnosticResolver"
      TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "DmClient"
    {
      TaskName = "DmClient"
      TaskPath = "\Microsoft\Windows\Feedback\Siuf\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "FileHistory"
    {
      TaskName = "File History (maintenance mode)"
      TaskPath = "\Microsoft\Windows\FileHistory\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Notifications"
    {
      TaskName = "Notifications"
      TaskPath = "\Microsoft\Windows\Location\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WinSAT"
    {
      TaskName = "WinSAT"
      TaskPath = "\Microsoft\Windows\Maintenance\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "MapsToastTask"
    {
      TaskName = "MapsToastTask"
      TaskPath = "\Microsoft\Windows\Maps\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "MapsUpdateTask"
    {
      TaskName = "MapsUpdateTask"
      TaskPath = "\Microsoft\Windows\Maps\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "ProcessMemoryDiagnosticEvents"
    {
      TaskName = "ProcessMemoryDiagnosticEvents"
      TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "RunFullMemoryDiagnostic"
    {
      TaskName = "RunFullMemoryDiagnostic"
      TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "MNOMetadataParse"
    {
      TaskName = "MNO Metadata Parser"
      TaskPath = "\Microsoft\Windows\Mobile Broadband Accounts\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "AnalyzeSystem"
    {
      TaskName = "AnalyzeSystem"
      TaskPath = "\Microsoft\Windows\Power Efficiency Diagnostics\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "MobilityManager"
    {
      TaskName = "MobilityManager"
      TaskPath = "\Microsoft\Windows\Ras\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "RegIdleBackup"
    {
      TaskName = "RegIdleBackup"
      TaskPath = "\Microsoft\Windows\Registry\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "FamilySafetyMonitor"
    {
      TaskName = "FamilySafetyMonitor"
      TaskPath = "\Microsoft\Windows\Shell\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "FamilySafetyRefresh"
    {
      TaskName = "FamilySafetyRefreshTask"
      TaskPath = "\Microsoft\Windows\Shell\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "SR"
    {
      TaskName = "SR"
      TaskPath = "\Microsoft\Windows\SystemRestore\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "Tpm-Maintenance"
    {
      TaskName = "Tpm-Maintenance"
      TaskPath = "\Microsoft\Windows\TPM\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "UPnPHostConfig"
    {
      TaskName = "UPnPHostConfig"
      TaskPath = "\Microsoft\Windows\UPnP\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "ResolutionHost"
    {
      TaskName = "ResolutionHost"
      TaskPath = "\Microsoft\Windows\WDI\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WindowsDefenderCacheMaintenance"
    {
      TaskName = "Windows Defender Cache Maintenance"
      TaskPath = "\Microsoft\Windows Defender\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WindowsDefenderCleanup"
    {
      TaskName = "Windows Defender Cleanup"
      TaskPath = "\Microsoft\Windows Defender\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WindowsDefenderScheduledScan"
    {
      TaskName = "Windows Defender Scheduled Scan"
      TaskPath = "\Microsoft\Windows\Windows Defender\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WindowsDefenderVerification"
    {
      TaskName = "Windows Defender Verification"
      TaskPath = "\Microsoft\Windows\Windows Defender\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "QueueReporting"
    {
      TaskName = "QueueReporting"
      TaskPath = "\Microsoft\Windows\Windows Error Reporting\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "BfeonServiceStartTypeChange"
    {
      TaskName = "BfeonServiceStartTypeChange"
      TaskPath = "\Microsoft\Windows\Windows Filtering Platform\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "UpdateLibrary"
    {
      TaskName = "UpdateLibrary"
      TaskPath = "\Microsoft\Windows\Windows Media Sharing\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WIM-Hash-Management"
    {
      TaskName = "WIM-Hash-Management"
      TaskPath = "\Microsoft\Windows\WOF\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "WIM-Hash-Validation"
    {
      TaskName = "WIM-Hash-Validation"
      TaskPath = "\Microsoft\Windows\WOF\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "XblGameSaveTask"
    {
      TaskName = "XblGameSaveTask"
      TaskPath = "\Microsoft\XblGameSave\"
      Enable = $false
      Ensure = 'Absent'
    }

    ScheduledTask "XblGameSaveTaskLogon"
    {
      TaskName = "XblGameSaveTaskLogon"
      TaskPath = "\Microsoft\XblGameSave\"
      Enable = $false
      Ensure = 'Absent'
    }
}
