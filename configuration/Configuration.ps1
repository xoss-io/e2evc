Configuration "CTX_POC"{

    Import-DscResource -ModuleName ComputerManagementDsc 
    Import-DscResource -ModuleName XenDesktop7
    Import-DscResource -ModuleName XOSSBaselineModuleDSC
    Import-DscResource -ModuleName NetworkingDSC

    $Password = $ConfigurationData.Domain.Password | ConvertTo-SecureString -AsPlainText -Force
    $Administrator = $ConfigurationData.Domain.Administrator
    $Credential =  New-Object System.Management.Automation.PSCredential ($Administrator, $Password)


    Node $AllNodes.NodeName {
       
        DnsServerAddress "Domaincontroller" {
            Address = $ConfigurationData.Domain.Server
            InterfaceAlias = "internal"
            AddressFamily  = 'IPv4'
            Validate       = $true
        }
        Computer "Defaults" {
            Name = $Node.NodeName
            DomainName = $ConfigurationData.Domain.Name
            PsDscRunAsCredential =  $Credential
            DependsOn =  "[DnsServerAddress]Domaincontroller"
        }


        PendingReboot "CheckReboot" {
            Name = "CheckComponents"
            SkipComponentBasedServicing = $false
            SkipWindowsUpdate = $false
            SkipPendingFileRename = $false
            SkipPendingComputerRename = $false
        }

        PowerPlan SetPlanHighPerformance
        {
          IsSingleInstance = 'Yes'
          Name             = 'High performance'
        }

        RemoteDesktopAdmin RemoteDesktopSettings
        {
            IsSingleInstance   = 'yes'
            Ensure             = 'Present'
            UserAuthentication = 'Secure'
        }
        XOSSPackageInstaller "Host" #ResourceName
        {
            Id = [GUID]::NewGuid()
            InstallationScope = "Host"
            PackageManagementUrl = "https://packages.infraxo-dev.com/api/packages"
            ConfigurationManagementUrl = "https://config.infraxo-dev.com/api/dsc"
        }
       if($Node.Roles -contains "DeliveryController"){
        if($Node.IsPrimary -eq $True){

            XD7Database 'XD7SiteDatabase' {
                SiteName = $ConfigurationData.Citrix.Sitename
                DatabaseServer = $ConfigurationData.Citrix.Database.Server
                DatabaseName =  $ConfigurationData.Citrix.Database.Schemas.Site
                PsDscRunAsCredential   = $Credential 
                DataStore = 'Site'
                DependsOn = "[XOSSPackageInstaller]Host"
            }
        
            XD7Database 'XD7SiteLoggingDatabase' {
                SiteName = $ConfigurationData.Citrix.Sitename
                DatabaseServer = $ConfigurationData.Citrix.Database.Server
                DatabaseName = $ConfigurationData.Citrix.Database.Schemas.Logging
                PsDscRunAsCredential   = $Credential 
                DataStore = 'Logging'
                DependsOn = "[XOSSPackageInstaller]Host"
        
            }
        
            XD7Database 'XD7SiteMonitorDatabase' {
                SiteName = $ConfigurationData.Citrix.Sitename
                DatabaseServer = $ConfigurationData.Citrix.Database.Server
                DatabaseName = $ConfigurationData.Citrix.Database.Schemas.Monitoring
                PsDscRunAsCredential   = $Credential 
                DataStore = 'Monitor'
                DependsOn = "[XOSSPackageInstaller]Host"
        
            }
        
            XD7Site 'Site' {
                SiteName = $ConfigurationData.Citrix.Sitename
                DatabaseServer = $ConfigurationData.Citrix.Database.Server
                SiteDatabaseName = $ConfigurationData.Citrix.Database.Schemas.Site
                LoggingDatabaseName = $ConfigurationData.Citrix.Database.Schemas.Logging
                MonitorDatabaseName = $ConfigurationData.Citrix.Database.Schemas.Monitoring
                PsDscRunAsCredential   = $Credential 
                DependsOn = '[XD7Database]XD7SiteDatabase','[XD7Database]XD7SiteLoggingDatabase','[XD7Database]XD7SiteMonitorDatabase'
            }
        
            XD7SiteConfig XD7GlobalSiteSetting {
                IsSingleInstance = 'Yes'
                TrustRequestsSentToTheXmlServicePort = $true
                ConnectionLeasingEnabled = $true
                DnsResolutionEnabled = $true
                PsDscRunAsCredential   = $Credential 
                DependsOn = '[XD7Site]Site'
            }
        }
        else {
            
            XD7WaitForSite 'WaitForXD7Site' {
                SiteName = $ConfigurationData.Citrix.Sitename
                ExistingControllerName = $ConfigurationData.Citrix.DeliveryController.ControllerForJoin
                PsDscRunAsCredential  = $Credential 
                DependsOn = "[XOSSPackageInstaller]Host"
        
            }
        
            XD7Controller 'XD7ControllerJoin' {
                SiteName = $ConfigurationData.Citrix.Sitename
                ExistingControllerName = $ConfigurationData.Citrix.DeliveryController.ControllerForJoin
                PsDscRunAsCredential  = $Credential 
                Ensure = 'Present'
                DependsOn = '[XD7WaitForSite]WaitForXD7Site'
            }    
        }
       }

       if($Node.Roles -contains "Storefront"){
        if($Node.IsPrimary){
            XD7StoreFront "Default"
            {
                SiteId = $ConfigurationData.Citrix.Storefront.SiteId
                HostBaseUrl = $ConfigurationData.Citrix.Storefront.BaseUrl
                Ensure = "Present"
                DependsOn = "[XOSSPackageInstaller]Host"
        
            }
            XD7StoreFrontAuthenticationMethod XD7StoreFrontAuthenticationMethods {
                VirtualPath = '/Citrix/Authentication'
                SiteId = $ConfigurationData.Citrix.Storefront.SiteId
                AuthenticationMethod = $ConfigurationData.Citrix.Storefront.AuthenticationMethods
                Ensure = 'Present'
                DependsOn = "[XD7StoreFront]Default"
            }
        
            foreach($store in $ConfigurationData.Citrix.Storefront.Stores){
                XD7StoreFrontStore "Store_$($Store.Name)" {
                    StoreName = 'Store'
                    AuthType = 'Explicit'
                    StoreVirtualPath = '/Citrix/Store'
                    AuthVirtualPath = '/Citrix/Authentication'
                    Ensure = 'Present'
                    DependsOn = "[XD7StoreFront]Default"
                }
        
                XD7StoreFrontFarmConfiguration "Store_$($Store.Name)" 
                {
                    StoreName = $Store.Name
                    PooledSockets = $Store.PooledSockets
                    DependsOn = "[XD7StoreFrontStore]Store_$($Store.Name)" 
                }
        
                XD7StoreFrontAuthenticationService "AuthService_$($Store.Name)"
                {
                    VirtualPath = "/Citrix/$($Store.Name)Web"
                    FriendlyName = "$($Store.Name)Auth"
                    SiteId = $ConfigurationData.Citrix.Storefront.SiteId
                    DependsOn = "[XD7StoreFrontStore]Store_$($Store.Name)"
                }
        
                XD7StoreFrontPNA "PNA_$($Store.Name)" {
                    StoreName = $Store.Name
                    DefaultPnaService = $Store.IsDefaultPNA
                    DependsOn = "[XD7StoreFrontStore]Store_$($Store.Name)"
                 }
        
                 XD7StoreFrontReceiverAuthenticationMethod "AuthMethods_$($Store.Name)" {
                    VirtualPath = "/Citrix/$($Store.Name)Web"
                    SiteId = $ConfigurationData.Citrix.Storefront.SiteId
                    AuthenticationMethod = $Store.AuthenticationMethods
                    DependsOn = "[XD7StoreFrontAuthenticationService]AuthService_$($Store.Name)"
                }
        
                XD7StoreFrontExplicitCommonOptions "ExplicitAuth_$($Store.Name)" 
                {
                    StoreName = $Store.Name
                    Domains =  $ConfigurationData.Domain.Name
                    DefaultDomain = $ConfigurationData.Domain.Name
                    HideDomainField = $true
                    DependsOn = "[XD7StoreFrontReceiverAuthenticationMethod]AuthMethods_$($Store.Name)"
                }
        
                XD7StoreFrontWebReceiverService "WebReceiver_$($Store.Name)"
                {
                    StoreName = $Store.Name
                    VirtualPath = "/Citrix/$($Store.Name)Web"
                    SiteId = $ConfigurationData.Citrix.Storefront.SiteId
                    ClassicReceiverExperience = $Store.ClassicExperience
                    DefaultIISSite = $Store.DefaultIISSite
                    DependsOn = "[XD7StoreFrontStore]Store_$($Store.Name)"
        
                }
        
                XD7StoreFrontWebReceiverCommunication "WebReceiver_$($Store.Name)"
                {
                    StoreName = $Store.Name
                    Attempts = 3
                    Loopback = $Store.Loopback
                    DependsOn = "[XD7StoreFrontWebReceiverService]WebReceiver_$($Store.Name)"
                }
        
                XD7StoreFrontWebReceiverPluginAssistant "WebReceiver_$($Store.Name)"
                {
                    StoreName = $Store.Name
                    Enabled = $true
                    DependsOn = "[XD7StoreFrontWebReceiverService]WebReceiver_$($Store.Name)"
                }
            }
        }
       }
    }
}
