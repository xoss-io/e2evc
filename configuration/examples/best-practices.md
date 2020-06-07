### Use en-US for all your base images

There are a few things that need to be considered when writing language independent DSC configurations. There are a lot of errors that can occur if you try to assign a DSC configuration that was written for a de-DE node to a en-US bases node.
See this example:

```
    cNtfsPermissionEntry PermissionSet1
    {
        Ensure = 'Present'
        Path = "C:\Windows\Temp"
        # Principal = 'Jeder' > never hardocde principals, use SIDs instead
        Principal = "S-1-1-0"
        AccessControlInformation = @(
            cNtfsAccessControlInformation
            {
                AccessControlType = 'Allow'
                FileSystemRights = 'ReadAndExecute'
                Inheritance = 'ThisFolderSubfoldersAndFiles'
                NoPropagateInherit = $false
            }
        )
    }
```

> This will lead to errors because on a en-US based node there won´t be a principal with the name 'Jeder'. As stated above use SIDs instead.

We recommend setting the following language settings in your DSC baseline configuration for all your servers and clients:

```
 Language "ConfigureLanguage"
        {
            IsSingleInstance = "Yes"
            LocationID = 94
            MUILanguage = "de-DE"
            MUIFallbackLanguage = "en-US"
            SystemLocale = "en-US"
            AddInputLanguages = @("0407:00000407")
            #RemoveInputLanguages = @("0409:00000409")
            UserLocale = "en-US"
            CopySystem = $true
            CopyNewUser = $true
            
        }
```

Please take care to have the language files installed that you need for your specific use-case. The above setting sets the system locale to en-US and the other options to the desired frontend language.

> This approach leads to reduced errors in DSC configurations and much less troubleshooting in customer environments.

### Multiple Configuration Blocks in one DSC Configuration

While it's technically possible to include multiple configuration blocks in a single .ps1 file, avoid doing so. For one, Azure DSC doesn't like it. 
For another, we like to have the DSC configuration script filenames match the configuration names.

### Naming Conventions for DSC Modules

Module names should follow a strict naming guideline. For further information also see [StyleGuidelines](https://github.com/PowerShell/DscResources/blob/master/StyleGuidelines.md)

- Only alphanumeric characters a-z, A-Z and numbers
- Pascal case (first letter capitalized next combined word letter in capital)
i.e. Get-Item would be GetItem,etc.
Bad: test_Function
Good: TestFunction
- small module configuration packages, if the package gets too big - separate it!
- New Modules will begin by version 0.1.0, since they are pre beta and havent been approved by coding standards

### Implement Staging for all your infrastructure development and improvement processes

All DevOps strategies depend on a strict separation of the development and production environment. Even the best automation processes sometimes cannot expect all potential changes that could lead to a broken deployment pipeline.

> The TLS 1.2 change implemented by Microsoft, AWS and other major providers created a lot of headaches with PowerShell DSC and other technologies. Running deployment tests in different stages gives you the chance to find potential problems before running changes in production.

While some customers start with three stages:

- development
- acceptance
- production

Other customers tend to have more:

- sandbox
- development
- integration
- internal acceptance
- client acceptance
- production

We cannot make a suggestion here because the level of stages depends highly on your specific needs. But we suggest a minimum of three stages for most of the customer workloads.

> Using and implementing Infrastructure as Code (as we provide on all of our products) should make it an easy task the create multiple environments on-demand.
 
### Even automation must be tested regularly

As described in the chapter before. Test and run your automated infrastructure deployment periodically. If you run it on a daily basis with your CI/CD pipeline or monthly depends on your own expectation and needs.
