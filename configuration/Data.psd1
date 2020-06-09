@{
    AllNodes = 
    @(
        @{
            NodeName = "*"
            PsDscAllowPlainTextPassword = $true
            PsDscAllowDomainUser = $true
        },
        @{
            NodeName = "ctx-ddc-01"
            IsPrimary = $true
            Roles = @("DeliveryController")
        },      
        @{
            NodeName = "ctx-ddc-02"
            Roles = @("DeliveryController")
        },
        @{
            NodeName = "ctx-stf-01"
            IsPrimary = $true
            Roles = @("Storefront")
        },
        @{
            NodeName = "ctx-stf-02"
            Roles = @("Storefront")
        }   
    )

    Domain = @{
        Name = "demo.e2evc"
        Server = "172.31.6.56"
        Administrator = "DEMO\demo.admin"
        Password = 'n0R1$C,n0Fun'
    }

    Citrix = @{
        SiteName = "Demo"
        License =@{
            Server = "ctx-ddc-01"
            Model = ""
            Product = ""
            Edition = ""
        }
        Database = @{
            Server = "ctx-ddc-01"
            Schemas = @{
                Logging = "DEMO_LOG"
                Monitoring = "DEMO_MON"
                Site = "DEMO_SITE"
            }
        }
        DeliveryController =@{
            AutoJoin = $true
            ControllerForJoin = "ctx-ddc-01"
        }
        Storefront = @{
            AutoJoin = $true
            ControllerForJoin = "ctx-stf-01"
            SiteId = 1
            BaseUrl = "https://storefront.demo.infraxo-dev.com"
            AuthenticationMethods = @("ExplicitForms","HttpBasic","IntegratedWindows")
            Stores = @(
                @{
                    Name = "Demo"
                    PooledSockets = $false
                    AuthenticationMethods = @('ExplicitForms','IntegratedWindows')
                    IsDefaultPNA = $true
                    ClassicExperience = $false
                    DefaultIISSite = $true
                    Loopback = "OnUsingHttp"
                    
                }
            )
        }
    }
}