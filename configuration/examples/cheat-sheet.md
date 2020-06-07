---
title: "PowerShell DSC Cheat Sheet"
date: 2018-12-29T11:02:05+06:00
weight: 13
---

### Windows PowerShell Desired State Configuration Overview

Windows PowerShell Desired State Configuration (DSC) is a new management system in Windows
PowerShell that enables the deployment and management of configuration data for software services
and the environment on which these services run. To use DSC, first create a configuration script as
shown below. Note that Configuration is a new keyword, which is part of the Windows PowerShell
extensions for DSC. Each Configuration must have at least one Node block. Each Node block can have
one or more resource blocks. You can use the same resource more than once in the same Node block,
if you wish.

```
Configuration MyWebConfig
{
 # Parameters are optional
 param ($MachineName, $WebsiteFilePath)
 # A Configuration block can have one or more Node blocks
 Node $MachineName
 {
 # Next, specify one or more resource blocks
 # WindowsFeature is one of the resources you can use in a Node block
 # This example ensures the Web Server (IIS) role is installed
 WindowsFeature IIS
 {
 Ensure = "Present" # To uninstall, set Ensure to "Absent"
 Name = "Web-Server“ # Name property from Get-WindowsFeature
 }
 # You can use the File resource to manage files and folders
 # "WebDirectory" is the name you want to use to refer to this instance
 File WebDirectory
 {
 Ensure = "Present" # You can also set Ensure to "Absent“
 Type = "Directory“ # Default is “File”
 Recurse = $true
 SourcePath = $WebsiteFilePath
 DestinationPath = "C:\inetpub\wwwroot"
 DependsOn = "[WindowsFeature]IIS" # Use for dependencies
 }
 }
}
```

To create a configuration, invoke the Configuration block the same way you would invoke a Windows
PowerShell function, passing in any expected parameters you may have defined (two in the example
above). For example, in this case:

```
MyWebConfig -MachineName "TestMachine" –WebsiteFilePath "\\filesrv\WebFiles" ` -OutputPath "C:\MyFolder" # OutputPath is optional
```

This creates a MOF file known as the configuration instance document at the path you specify. You
can run it using the Start-DscConfiguration cmdlet (more on that cmdlet on the flipside of this sheet).

### Archive Resource Example

The Archive resource gives you a mechanism to unpack archive (.zip) files at a specific path.

```
Archive ArchiveExample {
 Ensure = "Present" # You can also set Ensure to "Absent"
 Path = "C:\Users\Public\Documents\Test.zip"
 Destination = "C:\Users\Public\Documents\ExtractionPath"
}
```


### Script Resource Example

The Script resource gives you a mechanism to run Windows PowerShell script blocks on target
nodes. The TestScript block runs first. If it returns False, the SetScript block will run. The GetScript
block will run when you invoke the Get-DscConfiguration cmdlet (more on that cmdlet on the
flipside of this sheet). GetScript must return a hash table.

```
Script ScriptExample
{
 SetScript = {
 $sw = New-Object System.IO.StreamWriter("C:\TempFolder\TestFile.txt")
 $sw.WriteLine("Some sample string")
 $sw.Close()
 }
 TestScript = { Test-Path "C:\TempFolder\TestFile.txt" }
 GetScript = { <# This must return a hash table #> }
}
```

### Registry Resource Example

The Registry resource gives you a mechanism to manage registry keys and values.

```
Registry RegistryExample
{
 Ensure = "Present" # You can also set Ensure to "Absent"
 Key = "HKEY_LOCAL_MACHINE\SOFTWARE\ExampleKey"
 ValueName ="TestValue"
 ValueData ="TestData"
}
```

### Package Resource Example

The Package resource gives you a mechanism to install and manage packages, such as MSI and
setup.exe packages, on a target node.

```
Package PackageExample
{
 Ensure = "Present" # You can also set Ensure to "Absent"
 Path = "$Env:SystemDrive\TestFolder\TestProject.msi"
 Name = "TestPackage"
 ProoductId = "663A8209-89E0-4C48-898B-53D73CA2C14B"
}
```

### Environment Resource Example

The Environment resource gives you a mechanism to manage system environment variables.

```
Environment EnvironmentExample
{
 Ensure = "Present" # You can also set Ensure to "Absent"
 Name = "TestEnvironmentVariable"
 Value = "TestValie"
}
```

### Group Resource Example

The Group resource gives you a mechanism to manage local groups on the target node.

```
Group GroupExample
{
 # This will remove TestGroup, if present
 # To create a new group, set Ensure to "Present"
 Ensure = "Absent"
 GroupName = "TestGroup"
}
```

### User Resource Example

The User resource gives you a mechanism to manage local user accounts on the target node.

```
User UserExample
{
 Ensure = "Present" # To delete a user account, set Ensure to "Absent"
 UserName = "SomeName"
 Password = $passwordCred # This needs to be a credential object
 DependsOn = “[Group]GroupExample" # Configures GroupExample first
}
```

### Service Resource Example

The Service resource gives you a mechanism to manage services on the target node.

```
Service ServiceExample
{
 Name = "TermService"
 StartupType = "Manual"
}
```
