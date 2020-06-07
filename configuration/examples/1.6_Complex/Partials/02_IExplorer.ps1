Registry DisableIEFirstRun
{
    Key               = "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\InternetExplorer\Main"
    Ensure            = "Present"
    ValueName         = "DisableFirstRunCustomize"
    ValueType         = "Dword"
    ValueData        = "00000001"
}

#Reduce Internet Explorer Temp File
Registry IETempPath
{
      Key             = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Paths"
      Ensure          = "Present"
      ValueName       = "Paths"
      ValueType       = "Dword"
      ValueData       = "000000004"
}

#Reduce Internet Explorer Temp File
Registry IETempPath1
{
      Key             = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\path1"
      Ensure          = "Present"
      ValueName       = "CacheLimit"
      ValueType       = "Dword"
      ValueData       = "000000100"
}

#Reduce Internet Explorer Temp File
Registry "IETempPath2"
{
      Key             = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\path2"
      Ensure          = "Present"
      ValueName       = "CacheLimit"
      ValueType       = "Dword"
      ValueData       = "000000100"
}

#Reduce Internet Explorer Temp File
Registry "IETempPath3"
{
      Key             = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\path3"
      Ensure          = "Present"
      ValueName       = "CacheLimit"
      ValueType       = "Dword"
      ValueData       = "000000100"
}

#Reduce Internet Explorer Temp File
Registry "IETempPath4"
{
      Key             = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\path4"
      Ensure          = "Present"
      ValueName       = "CacheLimit"
      ValueType       = "Dword"
      ValueData       = "000000100"
}