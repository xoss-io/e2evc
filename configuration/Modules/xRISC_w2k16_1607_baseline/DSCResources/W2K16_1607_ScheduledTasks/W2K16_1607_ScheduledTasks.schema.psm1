Configuration W2K16_1607_ScheduledTasks
{
    Import-DscResource -ModuleName ComputerManagementDsc 

    ScheduledTask "Office15Heartbeat"
    {
      TaskName = "Office 15 Subscription Heartbeat"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
    }

    ScheduledTask "OfficeTelemetryAgentFallBack2016"
    {
      TaskName = "OfficeTelemetryAgentFallBack2016"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
    }

    ScheduledTask "OfficeTelemetryAgentLogOn2016"
    {
      TaskName = "OfficeTelemetryAgentLogOn2016"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
    }

    ScheduledTask "OfficeTelemetryAgentFallBack"
    {
      TaskName = "OfficeTelemetryAgentFallBack"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
    }

    ScheduledTask "OfficeTelemetryAgentLogOn"
    {
      TaskName = "OfficeTelemetryAgentLogOn"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
    }

    ScheduledTask "SmartScreenSpecific"
    {
      TaskName = "SmartScreenSpecific"
      TaskPath = "\Microsoft\Windows\AppID\"
      Enable = $false
    }

    ScheduledTask "MicrosoftCompatibilityAppraiser"
    {
      TaskName = "Microsoft Compatibility Appraiser"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
    }

    ScheduledTask "ProgramDataUpdater"
    {
      TaskName = "ProgramDataUpdater"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
    }

    ScheduledTask "StartupAppTask"
    {
      TaskName = "StartupAppTask"
      TaskPath = "\Microsoft\Windows\Application Experience\"
      Enable = $false
    }

    ScheduledTask Proxy
    {
      TaskName = "Proxy"
      TaskPath = "\Microsoft\Windows\Autochk\"
      Enable = $false
    }

    ScheduledTask "UninstallDeviceTask"
    {
      TaskName = "UninstallDeviceTask"
      TaskPath = "\Microsoft\Windows\Bluetooth\"
      Enable = $false
    }

    ScheduledTask "ProactiveScan"
    {
      TaskName = "ProactiveScan"
      TaskPath = "\Microsoft\Windows\Chkdsk\"
      Enable = $false
    }

    ScheduledTask "CreateObjectTask"
    {
      TaskName = "CreateObjectTask"
      TaskPath = "\Microsoft\Windows\CloudExperienceHost\"
      Enable = $false
    }

    ScheduledTask "Consolidator"
    {
      TaskName = "Consolidator"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
    }

    ScheduledTask "KernelCeipTask"
    {
      TaskName = "KernelCeipTask"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
    }

    ScheduledTask "UsbCeip"
    {
      TaskName = "UsbCeip"
      TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
      Enable = $false
    }

    ScheduledTask "ScheduledDefrag"
    {
      TaskName = "ScheduledDefrag"
      TaskPath = "\Microsoft\Windows\Defrag\"
      Enable = $false
    }

    ScheduledTask "Scheduled"
    {
      TaskName = "Scheduled"
      TaskPath = "\Microsoft\Windows\Diagnosis\"
      Enable = $false
    }

    ScheduledTask "Microsoft-Windows-DiskDiagnosticDataCollector"
    {
      TaskName = "Microsoft-Windows-DiskDiagnosticDataCollector"
      TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
      Enable = $false
    }

    ScheduledTask "Microsoft-Windows-DiskDiagnosticResolver"
    {
      TaskName = "Microsoft-Windows-DiskDiagnosticResolver"
      TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
      Enable = $false
    }

    ScheduledTask "DmClient"
    {
      TaskName = "DmClient"
      TaskPath = "\Microsoft\Windows\Feedback\Siuf\"
      Enable = $false
    }

    ScheduledTask "FileHistory"
    {
      TaskName = "File History"
      TaskPath = "\Microsoft\Windows\FileHistory\"
      Enable = $false
    }

    ScheduledTask "Notifications"
    {
      TaskName = "Notifications"
      TaskPath = "\Microsoft\Windows\Location\"
      Enable = $false
    }

    ScheduledTask "WinSAT"
    {
      TaskName = "WinSAT"
      TaskPath = "\Microsoft\Windows\Maintenance\"
      Enable = $false
    }

    ScheduledTask "MapsToastTask"
    {
      TaskName = "MapsToastTask"
      TaskPath = "\Microsoft\Windows\Maps\"
      Enable = $false
    }

    ScheduledTask "MapsUpdateTask"
    {
      TaskName = "MapsUpdateTask"
      TaskPath = "\Microsoft\Windows\Maps\"
      Enable = $false
    }

    ScheduledTask "ProcessMemoryDiagnosticEvents"
    {
      TaskName = "ProcessMemoryDiagnosticEvents"
      TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
      Enable = $false
    }

    ScheduledTask "RunFullMemoryDiagnostic"
    {
      TaskName = "RunFullMemoryDiagnostic"
      TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
      Enable = $false
    }

    ScheduledTask "MNOMetadataParser"
    {
      TaskName = "MNO Metadata Parser"
      TaskPath = "\Microsoft\Windows\Mobile Broadband Accounts\"
      Enable = $false
    }

    ScheduledTask "AnalyzeSystem"
    {
      TaskName = "AnalyzeSystem"
      TaskPath = "\Microsoft\Windows\Power Efficiency Diagnostics\"
      Enable = $false
    }

    ScheduledTask "MobilityManager"
    {
      TaskName = "MobilityManager"
      TaskPath = "\Microsoft\Windows\Ras\"
      Enable = $false
    }

    ScheduledTask "RegIdleBackup"
    {
      TaskName = "RegIdleBackup"
      TaskPath = "\Microsoft\Windows\Registry\"
      Enable = $false
    }

    ScheduledTask "FamilySafetyMonitor"
    {
      TaskName = "FamilySafetyMonitor"
      TaskPath = "\Microsoft\Windows\Shell\"
      Enable = $false
    }

    ScheduledTask "FamilySafetyRefresh"
    {
      TaskName = "FamilySafetyRefresh"
      TaskPath = "\Microsoft\Windows\Shell\"
      Enable = $false
    }

    ScheduledTask "SR"
    {
      TaskName = "SR"
      TaskPath = "\Microsoft\Windows\SystemRestore\"
      Enable = $false
    }

    ScheduledTask "Tpm-Maintenance"
    {
      TaskName = "Tpm-Maintenance"
      TaskPath = "\Microsoft\Windows\TPM\"
      Enable = $false
    }

    ScheduledTask "UPnPHostConfig"
    {
      TaskName = "UPnPHostConfig"
      TaskPath = "\Microsoft\Windows\UPnP\"
      Enable = $false
    }

    ScheduledTask "ResolutionHost"
    {
      TaskName = "ResolutionHost"
      TaskPath = "\Microsoft\Windows\WDI\"
      Enable = $false
    }

    ScheduledTask "WindowsDefenderCacheMaintenance"
    {
      TaskName = "Windows Defender Cache Maintenance"
      TaskPath = "\Microsoft\Windows Defender\"
      Enable = $false
    }

    ScheduledTask "WindowsDefenderCleanup"
    {
      TaskName = "Windows Defender Cleanup"
      TaskPath = "\Microsoft\Windows Defender\"
      Enable = $false
    }

    ScheduledTask "WindowsDefenderScheduledScan"
    {
      TaskName = "Windows Defender Scheduled Scan"
      TaskPath = "\Microsoft\Windows\Windows Defender\"
      Enable = $false
    }

    ScheduledTask "WindowsDefenderVerification"
    {
      TaskName = "Windows Defender Verification"
      TaskPath = "\Microsoft\Windows\Windows Defender\"
      Enable = $false
    }

    ScheduledTask "QueueReporting"
    {
      TaskName = "QueueReporting"
      TaskPath = "\Microsoft\Windows\Windows Error Reporting\"
      Enable = $false
    }

    ScheduledTask "BfeonServiceStartTypeChange"
    {
      TaskName = "BfeonServiceStartTypeChange"
      TaskPath = "\Microsoft\Windows\Windows Filtering Platform\"
      Enable = $false
    }

    ScheduledTask "UpdateLibrary"
    {
      TaskName = "UpdateLibrary"
      TaskPath = "\Microsoft\Windows\Windows Media Sharing\"
      Enable = $false
    }

    ScheduledTask "WIM-Hash-Management"
    {
      TaskName = "WIM-Hash-Management"
      TaskPath = "\Microsoft\Windows\WOF\"
      Enable = $false
    }

    ScheduledTask "WIM-Hash-Validation"
    {
      TaskName = "WIM-Hash-Validation"
      TaskPath = "\Microsoft\Windows\WOF\"
      Enable = $false
    }

    ScheduledTask "XblGameSaveTask"
    {
      TaskName = "XblGameSaveTask"
      TaskPath = "\Microsoft\XblGameSave\"
      Enable = $false
    }

    ScheduledTask "XblGameSaveTaskLogon"
    {
      TaskName = "XblGameSaveTaskLogon"
      TaskPath = "\Microsoft\XblGameSave\"
      Enable = $false
    }

    ScheduledTask "VerifyWinRE"
    {
      TaskName = "VerifyWinRE"
      TaskPath = "RecoveryEnvironment\VerifyWinRE\"
      Enable = $false
    }
}
