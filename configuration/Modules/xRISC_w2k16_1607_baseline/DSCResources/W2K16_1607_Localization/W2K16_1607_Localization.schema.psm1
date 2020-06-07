Configuration W2K16_1607_Localization
{

    param(
        
        [string] $Locale = "de-DE",
        [string] $TimeZone = "Western European Time"
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
