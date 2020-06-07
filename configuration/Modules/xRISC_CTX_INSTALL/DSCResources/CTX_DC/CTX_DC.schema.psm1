Configuration CTX_DC
{
    param(        
        [Parameter(Mandatory = $true)]
        [string] $MediaPath,
        [Parameter(Mandatory = $true)]
        [string] $SiteName,
        [Parameter(Mandatory = $true)]
        [bool] $IsPrimary,
        [Parameter(Mandatory = $false)]
        [string] $DatabaseServer,
        [Parameter(Mandatory = $false)]
        [string] $SiteDatabase,
        [Parameter(Mandatory = $false)]
        [string] $LoggingDatabase,
        [Parameter(Mandatory = $false)]
        [string] $MonitoringDatabase,
        [Parameter(Mandatory = $false)]
        [PSCredential] $Credential,        
        [Parameter(Mandatory = $false)]
        [string] $PrimaryController,
        [Parameter(Mandatory = $false)]
        [string]$LicenseServer,
        [Parameter(Mandatory = $false)]
        [int]$LicenseServerPort,
        [Parameter(Mandatory = $false)]
        [ValidateSet("MPS", "XDT")]
        [string]$Product,
        [Parameter(Mandatory = $false)]
        [ValidateSet("ADV", "ENT", "PLT")]
        [string]$Edition,
        [Parameter(Mandatory = $false)]
        [ValidateSet("Concurrent", "UserDevice")]
        [string]$LicenseModel,
        [Parameter(Mandatory = $false)]
        [string]$Administrators
        )

    Import-DscResource -ModuleName XenDesktop7 
    Import-DscResource -ModuleName xPSDesiredStateConfiguration -ModuleVersion 8.4.0.0
    Import-DscResource -ModuleName xCredSSP
    Import-DscResource -ModuleName xWebAdministration
        xWindowsFeature "Web-Server" 
        {
            Name = "Web-Server"
            Ensure = 'Present'
        }
    
        XD7Features XD7Controller 
        {
            Role = @('Studio','Controller','Director')
            SourcePath = $MediaPath
            IsSingleInstance = "Yes"
        }
        xCredSSP CredSSPServer {
            Role = 'Server';

        }

        xCredSSP CredSSPClient {
            Role = 'Client';
            DelegateComputers = "*";
        }

    if($IsPrimary){
        
    
        XD7Database 'XD7SiteDatabase' {
            SiteName = $SiteName
            DatabaseServer = $DatabaseServer
            DatabaseName = $SiteDatabase
            PsDscRunAsCredential   = $Credential 
            DataStore = 'Site'
            DependsOn = '[XD7Features]XD7Controller'
        }
    
        XD7Database 'XD7SiteLoggingDatabase' {
            SiteName = $SiteName
            DatabaseServer = $DatabaseServer
            DatabaseName = $LoggingDatabase
            PsDscRunAsCredential   = $Credential 
            DataStore = 'Logging'
            DependsOn = '[XD7Features]XD7Controller'
        }
    
        XD7Database 'XD7SiteMonitorDatabase' {
            SiteName = $SiteName
            DatabaseServer = $DatabaseServer
            DatabaseName = $MonitoringDatabase
            PsDscRunAsCredential   = $Credential 
            DataStore = 'Monitor'
            DependsOn = '[XD7Features]XD7Controller'
        }
    
        XD7Site 'Site' {
            SiteName = $SiteName
            DatabaseServer = $DatabaseServer
            SiteDatabaseName = $SiteDatabase
            LoggingDatabaseName = $LoggingDatabase
            MonitorDatabaseName = $MonitoringDatabase
            PsDscRunAsCredential   = $Credential 
            DependsOn = '[XD7Features]XD7Controller','[XD7Database]XD7SiteDatabase','[XD7Database]XD7SiteLoggingDatabase','[XD7Database]XD7SiteMonitorDatabase'
        }

        XD7SiteConfig XD7GlobalSiteSetting {
            IsSingleInstance = 'Yes'
            TrustRequestsSentToTheXmlServicePort = $true
            ConnectionLeasingEnabled = $true
            DnsResolutionEnabled = $true
            PsDscRunAsCredential   = $Credential 
            DependsOn = '[XD7Site]Site'
        }

       XD7SiteLicense "License"{
            LicenseServer = $LicenseServer
            Ensure = 'Present'
            LicenseServerPort = $LicenseServerPort
            LicenseModel = $LicenseModel
            LicenseProduct = $Product
            LicenseEdition = $Edition
            TrustLicenseServerCertificate = $true
            PsDscRunAsCredential = $Credential
            DependsOn = '[XD7Site]Site'
       }
       XD7Administrator "Default_Admins"
        {
            Name = $Administrators
            Enabled = $true
            Ensure = "Present"
            Credential = $Credential
            DependsOn = '[XD7Site]Site'
        }
    }
    else 
    {
     
        XD7WaitForSite 'WaitForXD7Site' {
            SiteName = $SiteName
            ExistingControllerName = $PrimaryController
            PsDscRunAsCredential  = $Credential 
            DependsOn = '[XD7Features]XD7Controller'
        }
    
        XD7Controller 'XD7ControllerJoin' {
            SiteName = $SiteName
            ExistingControllerName = $PrimaryController
            PsDscRunAsCredential  = $Credential 
            Ensure = 'Present'
            DependsOn = '[XD7Features]XD7Controller','[XD7WaitForSite]WaitForXD7Site'
        }    
    }
}
