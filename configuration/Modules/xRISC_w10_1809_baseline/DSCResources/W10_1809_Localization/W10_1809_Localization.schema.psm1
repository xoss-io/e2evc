Configuration W10_1809_Localization
{

    param(
        
        [string] $Locale = "de-DE",
        [string] $TimeZone = "W. Europe Standard Time"
    )
    Import-DscResource -ModuleName ComputerManagementDsc 
    Import-DscResource -ModuleName SystemLocaleDsc

    SystemLocale "Locale"
    {
        SystemLocale     =  "$Locale"
        IsSingleInstance = "Yes"
    }

    TimeZone "Time Zone"
    {
        TimeZone         = "$TimeZone"
        IsSingleInstance = "Yes"
    }
}
