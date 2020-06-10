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