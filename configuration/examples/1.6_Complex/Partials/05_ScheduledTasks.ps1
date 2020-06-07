ScheduledTask "ProgramDataUpdater"
{
    TaskName = "ProgramDataUpdater"
    TaskPath = "\Microsoft\Windows\Application Experience\"
    Ensure = 'Absent'
}

ScheduledTask "StartupAppTask"
{
    TaskName = "StartupAppTask"
    TaskPath = "\Microsoft\Windows\Application Experience\"
    Ensure = 'Absent'
}

ScheduledTask Proxy
{
    TaskName = "Proxy"
    TaskPath = "\Microsoft\Windows\Autochk\"
    Ensure = 'Absent'
}

ScheduledTask "UninstallDeviceTask"
{
    TaskName = "UninstallDeviceTask"
    TaskPath = "\Microsoft\Windows\Bluetooth\"
    Ensure = 'Absent'
}

ScheduledTask "ProactiveScan"
{
    TaskName = "ProactiveScan"
    TaskPath = "\Microsoft\Windows\Chkdsk\"
    Ensure = 'Absent'
}

ScheduledTask "CreateObjectTask"
{
    TaskName = "CreateObjectTask"
    TaskPath = "\Microsoft\Windows\CloudExperienceHost\"
    Ensure = 'Absent'
}

ScheduledTask "Consolidator"
{
    TaskName = "Consolidator"
    TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
    Ensure = 'Absent'
}

ScheduledTask "UsbCeip"
{
    TaskName = "UsbCeip"
    TaskPath = "\Microsoft\Windows\Customer Experience Improvement Program\"
    Ensure = 'Absent'
}

ScheduledTask "ScheduledDefrag"
{
    TaskName = "ScheduledDefrag"
    TaskPath = "\Microsoft\Windows\Defrag\"
    Ensure = 'Absent'
}

ScheduledTask "Scheduled"
{
    TaskName = "Scheduled"
    TaskPath = "\Microsoft\Windows\Diagnosis\"
    Ensure = 'Absent'
}

ScheduledTask "Microsoft-Windows-DiskDiagnosticDataCollector"
{
    TaskName = "Microsoft-Windows-DiskDiagnosticDataCollector"
    TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
    Ensure = 'Absent'
}

ScheduledTask "Microsoft-Windows-DiskDiagnosticResolver"
{
    TaskName = "Microsoft-Windows-DiskDiagnosticResolver"
    TaskPath = "\Microsoft\Windows\DiskDiagnostic\"
    Ensure = 'Absent'
}

ScheduledTask "DmClient"
{
    TaskName = "DmClient"
    TaskPath = "\Microsoft\Windows\Feedback\Siuf\"
    Ensure = 'Absent'
}

ScheduledTask "WinSAT"
{
    TaskName = "WinSAT"
    TaskPath = "\Microsoft\Windows\Maintenance\"
    Ensure = 'Absent'
}

ScheduledTask "MapsToastTask"
{
    TaskName = "MapsToastTask"
    TaskPath = "\Microsoft\Windows\Maps\"
    Ensure = 'Absent'
}

ScheduledTask "MapsUpdateTask"
{
    TaskName = "MapsUpdateTask"
    TaskPath = "\Microsoft\Windows\Maps\"
    Ensure = 'Absent'
}

ScheduledTask "ProcessMemoryDiagnosticEvents"
{
    TaskName = "ProcessMemoryDiagnosticEvents"
    TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
    Ensure = 'Absent'
}

ScheduledTask "RunFullMemoryDiagnostic"
{
    TaskName = "RunFullMemoryDiagnostic"
    TaskPath = "\Microsoft\Windows\MemoryDiagnostic\"
    Ensure = 'Absent'
}

ScheduledTask "AnalyzeSystem"
{
    TaskName = "AnalyzeSystem"
    TaskPath = "\Microsoft\Windows\Power Efficiency Diagnostics\"
    Ensure = 'Absent'
}

ScheduledTask "RegIdleBackup"
{
    TaskName = "RegIdleBackup"
    TaskPath = "\Microsoft\Windows\Registry\"
    Ensure = 'Absent'
}

ScheduledTask "FamilySafetyMonitor"
{
    TaskName = "FamilySafetyMonitor"
    TaskPath = "\Microsoft\Windows\Shell\"
    Ensure = 'Absent'
}

ScheduledTask "SR"
{
    TaskName = "SR"
    TaskPath = "\Microsoft\Windows\SystemRestore\"
    Ensure = 'Absent'
}

ScheduledTask "UPnPHostConfig"
{
    TaskName = "UPnPHostConfig"
    TaskPath = "\Microsoft\Windows\UPnP\"
    Ensure = 'Absent'
}

ScheduledTask "QueueReporting"
{
    TaskName = "QueueReporting"
    TaskPath = "\Microsoft\Windows\Windows Error Reporting\"
    Ensure = 'Absent'
}

ScheduledTask "BfeonServiceStartTypeChange"
{
    TaskName = "BfeonServiceStartTypeChange"
    TaskPath = "\Microsoft\Windows\Windows Filtering Platform\"
    Ensure = 'Absent'
}

ScheduledTask "UpdateLibrary"
{
    TaskName = "UpdateLibrary"
    TaskPath = "\Microsoft\Windows\Windows Media Sharing\"
    Ensure = 'Absent'
}