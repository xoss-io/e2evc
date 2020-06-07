Configuration W10_1809_Office
{
    Import-DscResource -ModuleName ComputerManagementDsc 

    ScheduledTask "Office15Heartbeat"
    {
      TaskName = "Office 15 Subscription Heartbeat"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "OfficeTelemetryAgentFallBack2016"
    {
      TaskName = "OfficeTelemetryAgentFallBack2016"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "OfficeTelemetryAgentLogOn2016"
    {
      TaskName = "OfficeTelemetryAgentLogOn2016"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "OfficeTelemetryAgentFallBack"
    {
      TaskName = "OfficeTelemetryAgentFallBack"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
      Ensure = "Absent"
    }

    ScheduledTask "OfficeTelemetryAgentLogOn"
    {
      TaskName = "OfficeTelemetryAgentLogOn"
      TaskPath = "\Microsoft\Office\"
      Enable = $false
      Ensure = "Absent"
    }


    # Registry bootedrtm
    # {
    #     ValueName   = "bootedrtm"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\firstrun"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry disablemovie
    # {
    #     ValueName   = "disablemovie"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\firstrun"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry enablefileobfuscation
    # {
    #     ValueName   = "enablefileobfuscation"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry enablelogging
    # {
    #     ValueName   = "enablelogging"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }

    # Registry enableupload
    # {
    #     ValueName   = "enableupload"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }

    # Registry accesssolution
    # {
    #     ValueName   = "accesssolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }


    # Registry olksolution
    # {
    #     ValueName   = "olksolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry onenotesolution
    # {
    #     ValueName   = "onenotesolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry pptsolution
    # {
    #     ValueName   = "pptsolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry Projectsolution
    # {
    #     ValueName   = "projectsolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry publishersolution
    # {
    #     ValueName   = "publishersolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry visiosolution
    # {
    #     ValueName   = "visiosolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry wdsolution
    # {
    #     ValueName   = "wdsolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry xlsolution
    # {
    #     ValueName   = "xlsolution"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedapplications"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry agave
    # {
    #     ValueName   = "agave"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry appaddins
    # {
    #     ValueName   = "appaddins"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry comaddins
    # {
    #     ValueName   = "comaddins"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry documentfiles
    # {
    #     ValueName   = "documentfiles"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry templatefiles
    # {
    #     ValueName   = "templatefiles"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\osm\preventedsolutiontypes"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # #Disable saving/login to OneDrive in Office
    # Registry skydrivesigninoption
    # {
    #     ValueName   = "skydrivesigninoption"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\common\general"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }

    # Registry signinoptions
    # {
    #     ValueName   = "signinoptions"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\common\signin"
    #     ValueType   = "dword"
    #     ValueData   = "3"
    # }

    # #Disable external content by default in Outlook emails
    # Registry blockextcontent
    # {
    #     ValueName   = "blockextcontent"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\outlook\options\mail"
    #     ValueType   = "dword"
    #     ValueData   = "1"
    # }

    # Registry junkmailenablelinks
    # {
    #     ValueName   = "junkmailenablelinks"
    #     Ensure      = "Present"
    #     Key         = "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\office\16.0\outlook\options\mail"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }

    # #Disable online repair in Office
    # Registry onlinerepair
    # {
    #     ValueName   = "onlinerepair"
    #     Ensure      = "Present"
    #     Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }

    # Registry fallbacktocdn
    # {
    #     ValueName   = "fallbacktocdn"
    #     Ensure      = "Present"
    #     Key         = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\office\16.0\common\officeupdate"
    #     ValueType   = "dword"
    #     ValueData   = "0"
    # }
}
