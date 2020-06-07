Configuration CTX_StoreFront
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$MediaPath,
        [Parameter(Mandatory = $true)]
        [string[]]$Features,
        [Parameter(Mandatory = $true)]
        [string] $BaseUrl,
        [Parameter(Mandatory = $true)]
        [string] $Name,
        [Parameter(Mandatory = $true)]
        [string[]] $DeliveryController,
        [Parameter(Mandatory = $true)]
        [ValidateSet("XenApp","XenDesktop")]
        [string] $Type,
        [Parameter(Mandatory = $true)]
        [bool] $SSL,
        [Parameter(Mandatory = $true)]
        [int] $ServicePort,
        [Parameter(Mandatory)] 
        [ValidateNotNullOrEmpty()]
        [string] $StoreVirtualPath,
        [Parameter(Mandatory)] 
        [ValidateNotNullOrEmpty()]
        [string] $AuthenticationVirtualPath,
        [ValidateNotNullOrEmpty()]
        [string] $XmlLb,
        $Primary = $false,
        [Parameter(Mandatory = $true)]
        [PSCredential] $Credential
       
    )   
    Import-DscResource -ModuleName XenDesktop7
    Import-DscResource -ModuleName xPSDesiredStateConfiguration -ModuleVersion 8.4.0.0



      foreach($d in $DeliveryController){
          Write-Host "Found DDC $d for Storeffront"
      }

    if($SSL){
        $Transport = "HTTPS"
    }
    else{
        $Transport = "HTTP"
    }
   

    foreach ($feature in $Features) {
        Write-Host "Adding feature $feature"
        xWindowsFeature "$feature" {
            Name = $feature
            Ensure = 'Present'
            
        }
    }

    XD7Feature 'Install' {
        Role = 'Storefront'
        SourcePath = $MediaPath
        DependsOn = '[xWindowsFeature]Web-Server'
        Ensure = "Present"
        PsDscRunAsCredential   = $Credential 
    }
    
   if($Primary){

        XD7StoreFrontFarmConfiguration "STF_Farm" 
        {
            StoreName = $Name
            PooledSockets = $false
        }


        XD7StoreFrontBaseUrl 'SF_BaseUrl' 
        {
                BaseUrl = $BaseUrl
                PsDscRunAsCredential   = $Credential
        } 

        XD7StoreFront "SF"
        {
            SiteId = 1
            HostBaseUrl = $BaseUrl
            PsDscRunAsCredential   = $Credential 
            DependsOn = '[XD7Feature]Install'
        }

        XD7StoreFrontAuthenticationService "SF_Auth_Service" {
            VirtualPath = "/Citrix/${Name}Web"
            FriendlyName = 'AuthService'
            SiteId = 1
        }


        #  XD7StoreFrontAuthenticationServiceProtocol "SF_Auth" {
        #     VirtualPath = '/Citrix/Authentication'
        #     AuthenticationProtocol= 'ExplicitForms','IntegratedWindows','CitrixAGBasic'
        #     SiteId = 1
        #     Ensure = 'Present'
        # }
        XD7StoreFrontAuthenticationMethod "SF_Auth" 
        {
            VirtualPath = '/Citrix/Authentication'
            AuthenticationMethod = 'CitrixAGBasic', 'ExplicitForms'
            SiteId = 1
            Ensure = 'Present'
        }
        XD7StoreFrontStore "SF_Store" 
        {
            FarmName = "$Name"
            StoreName = $Name
            Servers = $DeliveryController 
            AuthType = "Explicit"
            DependsOn = '[XD7StoreFront]SF'

            PsDscRunAsCredential   = $Credential 
        }

        XD7StoreFrontWebReceiverService "SF_WebRecv" 
        {
            StoreName = $Name
            VirtualPath = "/Citrix/${Name}Web"
            DependsOn = "[XD7StoreFrontStore]SF_Store"
            PsDscRunAsCredential   = $Credential 
        }
      

        XD7StoreFrontWebReceiverUserInterface "SF_WebRecv_UI" 
        {
            StoreName = $Name
           
            DependsOn = "[XD7StoreFrontWebReceiverService]SF_WebRecv"
            PsDscRunAsCredential   = $Credential 
        }
         
       


         XD7StoreFrontReceiverAuthenticationMethod "SF_ReceiverAuth" {
            VirtualPath = "/Citrix/${Name}Web"
            SiteId = 1
            AuthenticationMethod = 'ExplicitForms','CitrixAGBasic'
            DependsOn = "[XD7StoreFrontWebReceiverService]SF_WebRecv"
            PsDscRunAsCredential   = $Credential 
        }
        XD7StoreFrontPNA "PNA"
        {
            StoreName = "$Name"
            DefaultPnaService = $true
            Ensure = 'Present'
        }
        XD7StoreFrontWebReceiverCommunication "SF_WebRecv_Comm" 
        {
            StoreName = $Name
            DependsOn = "[XD7StoreFrontWebReceiverService]SF_WebRecv"
            PsDscRunAsCredential   = $Credential 
        }
       
        XD7StoreFrontUnifiedExperience "SF_UnifiedExp" 
        {
            VirtualPath = "/Citrix/${Name}"
            WebReceiverVirtualPath = "/Citrix/${Name}Web"
            SiteId = 1
            Ensure = 'Present'
        }

     
        $STas = @()
        $STas += "$XmlLb/scripts/ctxsta.dll"

        Write-Host "Adding $STAs to Secure Ticket Authorities"
        Write-Host "$BaseUrl"
        XD7StoreFrontRoamingGateway "STF_NS_GW" 
        {
            Name = 'F5'
            LogonType = 'Domain'
            GatewayUrl = $BaseUrl
            Version = 'Version10_0_69_4'
            SecureTicketAuthorityUrls = $STas
            SessionReliability = $true
            Ensure = 'Present'
            PsDscRunAsCredential   = $Credential
        }
    
        XD7StoreFrontRegisterStoreGateway "CTX_NS_GW_REG"
        {
            StoreName = $Name
            GatewayName = @("F5")
            AuthenticationProtocol = 'CitrixAGBasic', 'ExplicitForms'
            EnableRemoteAccess = $True
            Ensure = 'Present'
            PsDscRunAsCredential   = $Credential
            DependsOn = "[XD7StoreFrontRoamingGateway]STF_NS_GW"
        }
       
   }
}
