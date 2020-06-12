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
        DnsResolutionEnabled = $true
        PsDscRunAsCredential   = $Credential 
        DependsOn = '[XD7Site]Site'
    }

    Script "EnableXmltrust" {
        GetScript = {
            Add-PSSnapin Citrix.*
            Get-BrokerSite
        }
        SetScript = {
            Add-PSSnapin Citrix.*
            Set-BrokerSite -TrustRequestsSentToTheXmlServicePort $true
        }
        TestScript = {
            Add-PSSnapin Citrix.*
            $brokerSite = Get-BrokerSite
            $brokerSite.TrustRequestsSentToTheXmlServicePort -eq $true
        }
        PsDscRunAsCredential   = $Credential 
        DependsOn = '[XD7Site]Site'
    }

    foreach($catalog in $ConfigurationData.Citrix.DeliveryController.Catalogs){
        XD7Catalog "Catalog_$($catalog.Name)" {
            Name = $catalog.Name
            Description = $catalog.Description
            Allocation = $catalog.Allocation
            Provisioning = $catalog.Provisioning
            Persistence = $catalog.Persistence
            IsMultisession = $catalog.IsMultiSession
            MinimumFunctionalLevel = $catalog.MinimumFunctionalLevel
            PsDscRunAsCredential   = $Credential 
            DependsOn = "[XD7Site]Site"
        }
        XD7CatalogMachine "Catalog_$($catalog.Name)_Machines" {
            Name = $catalog.Name
            Members = $catalog.Machines
            DependsOn = "[XD7Catalog]Catalog_$($catalog.Name)"
            PsDscRunAsCredential   = $Credential 
        }

    }

    foreach($group in $ConfigurationData.Citrix.DeliveryController.DeliveryGroups){
        XD7DesktopGroup "DesktopGroup_$($group.Name)" {
            Name = $group.Name
            DisplayName = $group.Name
            Description = $group.Description
            DeliveryType = $group.DeliveryType
            DesktopType = $group.DesktopType
            IsMultiSession = $ConfigurationData.Citrix.DeliveryController["$($group.MachineCatalog)"].IsMultiSession
            PsDscRunAsCredential = $Credential 
            DependsOn = "[XD7Catalog]Catalog_$($group.MachineCatalog)"
        }

        XD7DesktopGroupMember "DesktopGroup_$group_Machines" {
            Name = $group.Name
            Members = $ConfigurationData.Citrix.DeliveryController["$($group.MachineCatalog)"].Machines
            PsDscRunAsCredential = $Credential 
            DependsOn = "[XD7DesktopGroup]DesktopGroup_$($group.Name)";
        }

        if ($group.DeliveryType -in 'DesktopsAndApps','DesktopsOnly') {

            XD7EntitlementPolicy "DesktopGroup_$($group.Name)_DesktopEntitlement" {
                DeliveryGroup = $group.Name
                Name = $group.Name
                EntitlementType = 'Desktop'
                PsDscRunAsCredential = $Credential 
                DependsOn = "[XD7DesktopGroup]DesktopGroup_$($group.Name)"
            }
        }

        if ($group.DeliveryType -in 'DesktopsAndApps','AppsOnly') {

            XD7EntitlementPolicy "DesktopGroup_$($group.Name)_ApplicationEntitlement" {
                DeliveryGroup = $group.Name
                Name = $group.Name
                EntitlementType = 'Application'
                PsDscRunAsCredential   = $Credential 
                DependsOn = "[XD7DesktopGroup]DesktopGroup_$($group.Name)"
            }
        }

        XD7AccessPolicy "DesktopGroup_$($group.Name)_Direct" {
            DeliveryGroup = $group.Name
            AccessType = 'Direct';
            IncludeUsers = $Users;
            PsDscRunAsCredential = $Credential 
            DependsOn = "[XD7DesktopGroup]DesktopGroup_$($group.Name)";

        }

        XD7AccessPolicy "DesktopGroup_$($group.Name)_AG" {
            DeliveryGroup = $group.Name
            AccessType = 'AccessGateway';
            IncludeUsers = $Users;
            PsDscRunAsCredential = $Credential 
            DependsOn = "[XD7DesktopGroup]DesktopGroup_$($group.Name)"

        }

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