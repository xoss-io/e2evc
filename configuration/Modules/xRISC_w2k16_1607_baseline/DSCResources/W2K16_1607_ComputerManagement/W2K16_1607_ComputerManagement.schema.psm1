Configuration W2K16_1607_ComputerManagement
{
    Import-DscResource -ModuleName ComputerManagementDsc
    Import-DscResource -ModuleName xWinEventLog -ModuleVersion 1.2.0.0
    
    PowerPlan "SetPlanHighPerformance"
    {
        Name             = "High performance"
        IsSingleInstance = "Yes"
    }

  

    VirtualMemory "PagingSettings"
    {
        Type        = "CustomSize"
        Drive       = "C"
        InitialSize = "8192"
        MaximumSize = "8192"
    }

    xWinEventLog "ApplicationEventlogMode"
    {
        LogName            = "Application"
        IsEnabled          = $true
        LogMode            = "Circular"
        MaximumSizeInBytes = 64kb
    }

    xWinEventLog "SystemEventlogMode"
    {
        LogName            = "System"
        IsEnabled          = $true
        LogMode            = "Circular"
        MaximumSizeInBytes = 64kb
    }

    xWinEventLog "SecurityEventlogMode"
    {
        LogName            = "Security"
        IsEnabled          = $true
        LogMode            = "Circular"
        MaximumSizeInBytes = 64kb
    }

    xWinEventLog "Enable-DscAnalytic"
    {
        LogName             = "Microsoft-Windows-Dsc/Analytic"
        IsEnabled           = $True
        LogMode             = "Circular"
        MaximumSizeInBytes  = 64kb
        LogFilePath         = "%SystemRoot%\System32\Winevt\Logs\Microsoft-Windows-DSC-Analytic.evtx"
    }
}
