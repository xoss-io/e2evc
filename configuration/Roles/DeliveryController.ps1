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