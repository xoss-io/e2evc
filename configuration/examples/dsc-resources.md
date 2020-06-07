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
