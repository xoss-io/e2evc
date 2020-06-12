# Configuration Management

## What is PowerShell DSC

„PowerShell DSC is an inbuild tool to configure target machines”

## History

### PowerShell v2

- Created from project "Monad"
- Introduction of remoting
- introduction of background jobs

### PowerShell v3

- automatic module detection
- scheduler
- module repositories
- OneGet PowerShell module

### PowerShell v4

- new execution policies
- extended roaming
- policy based configuration
- easier access to file structures
- DSC v1

### PowerShell v5

- DSC v2
- partial configurations
- encryption
- PowerShell classes
- deep integration with .NET framework

## Why should you use it

- classic domain environments are loosing importance
- rise of cloud native environments
- requirement of quick deployments
- detect configuration drifts
- push / pull configurations

## Alternatives

- Puppet
- Salt

## Why you really should use it

- configurationmanagement at scale
- simple proxy implementation (web proxy with https)
- environment specific configuration
- domain independent configuration
- runs in kernel mode
- use it natively on every Windows system with WMF 5.1
- dependency awareness between nodes and conditions
- extensibility because it is based on PowerShell
- Get rid of GPOs
- configuration sets
- no hierarchy or inheritance
- state is defined

> GPOs are so 90ies

## Infrastructure as Code

- PowerShell syntax
- descriptive configuration
- separation of configuration definition and implementation

## What if i miss functionality?

- extend with your own scripts
- universality
- extend with PowerShell

## CI /CD integration

- Azure DevOps Pipelines

## automatic testing

- [NUnit](https://nunit.org/)
- [Pester](https://pester.dev/)

## Terminology

### Configuration

This s the configuration block.

### Node

This is the configuration item within a configuration.

### Module

Independend module that can be imported for further usage.

### Pull mode

A node pulls a configuration from a configuration endpoint (e.g. DSC Pull server). Automated process with defined pull intervalls.

### Push mode

A configuration is send to a node. This is a manual process initiated by an administrator.

### Local Configuration Manager

The client component of DSC that configures the node.

### Pull server

The "management" server that serves as endpoint for nodes and manages modules and configurations.

## How to dive quickly into PowerShell DSC?

- [Lability](https://github.com/VirtualEngine/Lability)
- [PS-Autolab-Env](https://github.com/pluralsight/PS-AutoLab-Env)
- [XenDesktop7](https://github.com/VirtualEngine/XenDesktop7)
- [FSLogixDsc](https://github.com/VirtualEngine/FSLogixDsc)

# Desired State Configuration Cmdlets

| Action	                                                                                | Command                                                                                                       |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Disable-DscDebug	                                                                        | Stops debugging of DSC resources.                                                                             | 
| Enable-DscDebug	                                                                        | Starts debugging of all DSC resources.                                                                        | 
| Get-DscConfiguration	                                                                    | Gets the current configuration of the nodes.                                                                  | 
| Get-DscConfigurationStatus	                                                            | Retrieves data about completed configuration runs.                                                            | 
| Get-DscLocalConfigurationManager	                                                        | Gets LCM settings and states for the node.                                                                    | 
| Get-DscResource	                                                                        | Gets the DSC resources present on the computer.                                                               | 
| Invoke-DscResource	                                                                    | Runs a method of a specified DSC resource.                                                                    | 
| New-DSCCheckSum	                                                                        | Creates checksum files for DSC documents and DSC resources.                                                   | 
| Publish-DscConfiguration	                                                                | Publishes a DSC configuration to a set of computers.                                                          | 
| Remove-DscConfigurationDocument	                                                        | Removes a configuration document from the DSC configuration store.                                            | 
| Restore-DscConfiguration	                                                                | Reapplies the previous configuration for the node.                                                            | 
| Set-DscLocalConfigurationManager	                                                        | Applies LCM settings to nodes.                                                                                | 
| Start-DscConfiguration	                                                                | Applies configuration to nodes.                                                                               | 
| Stop-DscConfiguration	                                                                    | Stops a running configuration.                                                                                | 
| Test-DscConfiguration	                                                                    | Tests whether the actual configuration on the nodes matches the desired configuration.                        | 
| Update-DscConfiguration	                                                                | Checks the pull server for an updated configuration and applies it.                                           |

## Desired State Configurations Cmdlets for everyday usage

| Action	                                                                                | Command                                                                                                       |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Update-DSCConfiguration -Verbose -Wait                                                    | Update DSC configuration on local computer                                                                    |
| Start-DscConfiguration -verbose -wait -useexisting                                        | Run DSC configuration on local computer                                                                       |
| Get-DscLocalConfigurationManager | select -ExpandProperty ConfigurationDownloadManagers   | Get registration URL                                                                                          |
| Get-DscResource -Name XOSS* -Module XOSS*                                                 | Get all DSC resources from a DSC Module                                                                       |

## DSC Resources

Desired State Configuration (DSC) Resources provide the building blocks for a DSC configuration. A resource exposes properties that can be configured and contains the PowerShell script functions that the Local Configuration Manager (LCM) calls to apply the configuration.

A resource can create something as generic as a file or as specific as an IIS server setting. Groups of resources are combined into a DSC Module, which organizes all the required files into a structure that is portable and includes metadata to identify how the resources are intended to be used.

DSC is supplied with several resources which are listed with the Get- DSCResource cmdlet:

```
PS > Get-DscResource | select Name,Module,Properties | Ft -AutoSize

Name                        Module                      Properties                                                      
----                        ------                      ----------                                                      
File                                                    {DestinationPath, Attributes, Checksum, Contents...}            
SignatureValidation                                     {SignedItemType, TrustedStorePath}                              
cChocoFeature               cChoco                      {FeatureName, DependsOn, Ensure, PsDscRunAsCredential}          
cChocoInstaller             cChoco                      {InstallDir, ChocoInstallScriptUrl, DependsOn, PsDscRunAsCre... 
cChocoPackageInstaller      cChoco                      {Name, AutoUpgrade, chocoParams, DependsOn...}                  
cChocoPackageInstallerSet   cChoco                      {DependsOn, PsDscRunAsCredential, Name, Ensure...}              
cChocoSource                cChoco                      {Name, Credentials, DependsOn, Ensure...}                       
cNtfsAuditEntry             cNtfsAccessControl          {Path, Principal, AuditRuleInformation, DependsOn...}           
cNtfsAuditInheritance       cNtfsAccessControl          {Path, DependsOn, Enabled, PreserveInherited...}                
cNtfsPermissionEntry        cNtfsAccessControl          {Path, Principal, AccessControlInformation, DependsOn...}       
cNtfsPermissionsInheritance cNtfsAccessControl          {Path, DependsOn, Enabled, PreserveInherited...}                
Computer                    ComputerManagementDsc       {Name, Credential, DependsOn, Description...}                   
OfflineDomainJoin           ComputerManagementDsc       {IsSingleInstance, RequestFile, DependsOn, PsDscRunAsCredent... 
PendingReboot               ComputerManagementDsc       {Name, DependsOn, PsDscRunAsCredential, SkipCcmClientSDK...}    
PowerPlan                   ComputerManagementDsc       {IsSingleInstance, Name, DependsOn, PsDscRunAsCredential}       
PowerShellExecutionPolicy   ComputerManagementDsc       {ExecutionPolicy, ExecutionPolicyScope, DependsOn, PsDscRunA... 
RemoteDesktopAdmin          ComputerManagementDsc       {IsSingleInstance, DependsOn, Ensure, PsDscRunAsCredential...}  
ScheduledTask               ComputerManagementDsc       {TaskName, ActionArguments, ActionExecutable, ActionWorkingP... 
SmbServerConfiguration      ComputerManagementDsc       {IsSingleInstance, AnnounceComment, AnnounceServer, Asynchro... 
SmbShare                    ComputerManagementDsc       {Name, Path, CachingMode, ChangeAccess...}                      
TimeZone                    ComputerManagementDsc       {IsSingleInstance, TimeZone, DependsOn, PsDscRunAsCredential}
VirtualMemory               ComputerManagementDsc       {Drive, Type, DependsOn, InitialSize...}
WindowsCapability           ComputerManagementDsc       {Name, DependsOn, Ensure, LogLevel...}
WindowsEventLog             ComputerManagementDsc       {LogName, DependsOn, IsEnabled, LogFilePath...}
PackageManagement           PackageManagement           {Name, AdditionalParameters, DependsOn, Ensure...}
PackageManagementSource     PackageManagement           {Name, ProviderName, SourceUri, DependsOn...}
Archive                     PSDesiredStateConfiguration {Destination, Path, Checksum, Credential...}
Environment                 PSDesiredStateConfiguration {Name, DependsOn, Ensure, Path...}
Group                       PSDesiredStateConfiguration {GroupName, Credential, DependsOn, Description...}
GroupSet                    PSDesiredStateConfiguration {DependsOn, PsDscRunAsCredential, GroupName, Ensure...}
Log                         PSDesiredStateConfiguration {Message, DependsOn, PsDscRunAsCredential}
Package                     PSDesiredStateConfiguration {Name, Path, ProductId, Arguments...}
ProcessSet                  PSDesiredStateConfiguration {DependsOn, PsDscRunAsCredential, Path, Credential...}
Registry                    PSDesiredStateConfiguration {Key, ValueName, DependsOn, Ensure...}
Script                      PSDesiredStateConfiguration {GetScript, SetScript, TestScript, Credential...}
Service                     PSDesiredStateConfiguration {Name, BuiltInAccount, Credential, Dependencies...}
ServiceSet                  PSDesiredStateConfiguration {DependsOn, PsDscRunAsCredential, Name, StartupType...}
User                        PSDesiredStateConfiguration {UserName, DependsOn, Description, Disabled...}
WaitForAll                  PSDesiredStateConfiguration {NodeName, ResourceName, DependsOn, PsDscRunAsCredential...}
WaitForAny                  PSDesiredStateConfiguration {NodeName, ResourceName, DependsOn, PsDscRunAsCredential...}
WaitForSome                 PSDesiredStateConfiguration {NodeCount, NodeName, ResourceName, DependsOn...}
WindowsFeature              PSDesiredStateConfiguration {Name, Credential, DependsOn, Ensure...}
WindowsFeatureSet           PSDesiredStateConfiguration {DependsOn, PsDscRunAsCredential, Name, Ensure...}
WindowsOptionalFeature      PSDesiredStateConfiguration {Name, DependsOn, Ensure, LogLevel...}
WindowsOptionalFeatureSet   PSDesiredStateConfiguration {DependsOn, PsDscRunAsCredential, Name, Ensure...}
WindowsPackageCab           PSDesiredStateConfiguration {Ensure, Name, SourcePath, DependsOn...}
WindowsProcess              PSDesiredStateConfiguration {Arguments, Path, Credential, DependsOn...}
AccountPolicy               SecurityPolicyDsc           {Name, Account_lockout_duration, Account_lockout_threshold, ...
SecurityOption              SecurityPolicyDsc           {Name, Accounts_Administrator_account_status, Accounts_Block...
SecurityTemplate            SecurityPolicyDsc           {IsSingleInstance, Path, DependsOn, PsDscRunAsCredential}
UserRightsAssignment        SecurityPolicyDsc           {Identity, Policy, DependsOn, Ensure...}
xPrinter                    xPrinterManagement          {DriverName, Name, PortName, Comment...}
xPrinterDriver              xPrinterManagement          {DriverName, DependsOn, Ensure, Environment...}
xPrinterPort                xPrinterManagement          {Name, DependsOn, Ensure, PrinterHostAddress...}
HttpDownload                xRemoteDownload             {File, DependsOn, PsDscRunAsCredential}
S3Download                  xRemoteDownload             {AccessKey, Bucket, Destination, Force...}
Monitor                     xRemoteMonitor              {Url, DependsOn, PsDscRunAsCredential}
```

### Types of resources

Windows comes with built in resources and Linux has OS specific resources. There are resources for cross-node dependencies, package management resources, as well as community owned and maintained resources. 

#### Windows built-in resources

- [Archive Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/archiveresource?view=powershell-7)
- [Environment Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/environmentresource?view=powershell-7)
- [File Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/fileresource?view=powershell-7)
- [Group Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/groupresource?view=powershell-7)
- [GroupSet Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/groupsetresource?view=powershell-7)
- [Log Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/logresource?view=powershell-7)
- [Package Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/packageresource?view=powershell-7)
- [ProcessSet Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/processsetresource?view=powershell-7)
- [Registry Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/registryresource?view=powershell-7)
- [Script Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/scriptresource?view=powershell-7)
- [Service Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/serviceresource?view=powershell-7)
- [ServiceSet Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/servicesetresource?view=powershell-7)
- [User Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/userresource?view=powershell-7)
- [WindowsFeature Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsfeatureresource?view=powershell-7)
- [WindowsFeatureSet Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsfeaturesetresource?view=powershell-7)
- [WindowsOptionalFeature Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsoptionalfeatureresource?view=powershell-7)
- [WindowsOptionalFeatureSet Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsoptionalfeaturesetresource?view=powershell-7)
- [WindowsPackageCabResource Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowspackagecabresource?view=powershell-7)
- [WindowsProcess Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/windowsprocessresource?view=powershell-7)

#### Cross-Node dependency resources

- [WaitForAll Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/waitforallresource?view=powershell-7)
- [WaitForSome Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/waitforsomeresource?view=powershell-7)
- [WaitForAny Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/windows/waitforanyresource?view=powershell-7)

#### Package Management resources
- [PackageManagement Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/packagemanagement/packagemanagementdscresource?view=powershell-7)
- [PackageManagementSource Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/packagemanagement/packagemanagementsourcedscresource?view=powershell-7)

#### Linux resources

- [Linux Archive Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxarchiveresource?view=powershell-7)
- [Linux Environment Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxenvironmentresource?view=powershell-7)
- [Linux FileLine Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxfilelineresource?view=powershell-7)
- [Linux File Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxfileresource?view=powershell-7)
- [Linux Group Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxgroupresource?view=powershell-7)
- [Linux Package Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxpackageresource?view=powershell-7)
- [Linux Script Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxscriptresource?view=powershell-7)
- [Linux Service Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxserviceresource?view=powershell-7)
- [Linux SshAuthorizedKeys Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxsshauthorizedkeysresource?view=powershell-7)
- [Linux User Resource](https://docs.microsoft.com/en-us/powershell/scripting/dsc/reference/resources/linux/lnxuserresource?view=powershell-7)

With these resources you have the tools to configure for example Windows services, registry keys or to create local users. 

### Extend with further Modules

These few resources allow you to begin using DSC, but you are likely to need more functionality as your use of DSC increases.
At that point, it is possible to add extra resources from the  [PowerShell Gallery](https://www.powershellgallery.com/)

To install them, all you need to do is to copy and paste them into your PowerShell modules folder:

```
PS > Get-ChildItem -Path Env:\PSModulePath | select value | fl * 

Value : C:\Users\USERNAME\Documents\WindowsPowerShell\Modules;C:\Program
        Files\WindowsPowerShell\Modules;C:\Windows\system32\WindowsPowerShell\v1.0\Modules;C:\Program Files (x86)\AWS
        Tools\PowerShell\
```

### Extend with your own Modules

It is possible to create your own DSC resources by defining what you want to configure on the nodes.

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
