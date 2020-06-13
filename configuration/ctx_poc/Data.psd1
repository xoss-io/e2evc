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
        },
        @{
            NodeName = "E2EVC_VDA"
            Roles = @("VDA")
        }   
    )

    Domain = @{
        Name = "demo.infraxo-dev.com"
        Server = "172.31.5.28"
        Administrator = "DEMO\demo.admin"
    }

    Citrix = @{
        SiteName = "Demo"
        Administrators = @("demo\ADM_CTX")
        License =@{
            Server = "ctx-ddc-01"
            Model = ""
            Product = ""
            Edition = ""
        }
        Database = @{
            Server = "ctx-ddc-01\SQLExpress"
            Schemas = @{
                Logging = "DEMO_LOG"
                Monitoring = "DEMO_MON"
                Site = "DEMO_SITE"
            }
        }
        DeliveryController =@{
            AutoJoin = $true
            ControllerForJoin = "ctx-ddc-01"
            Catalogs = @(
                @{
                    Name = "E2EVC"
                    Description = "Machine catalog for demo purpose, will be build through terraform"
                    Allocation = "Random"
                    Provisioning = "Manual"
                    Persistence = "Local"
                    IsMultiSession = $true
                    MinimumFunctionalLevel = "LMAX"
                    Machines = @(
                        "DEMO\VDA-01", 
                        "DEMO\VDA-02", 
                        "DEMO\VDA-03", 
                        "DEMO\VDA-04")
                }
            )
            DeliveryGroups = @(
                @{
                    Name = "E2EVC_Demo"
                    Description = "Delivery group for demo purpose"
                    DeliveryType = "DesktopsAndApps"
                    DesktopType = "Shared"
                    MachineCatalog = "E2EVC"
                    Users = "demo\CTX_Users"
                    DesktopUsers = "demo\CTX_Desktop_Users"
                }
            )
        }
        Storefront = @{
            AutoJoin = $true
            ControllerForJoin = "ctx-stf-01"
            SiteId = 1
            BaseUrl = "http://storefront.demo.infraxo-dev.com"
            AuthenticationMethods = @("ExplicitForms","IntegratedWindows")
            Stores = @(
                @{
                    Name = "Demo"
                    PooledSockets = $false
                    AuthenticationMethods = @('ExplicitForms','IntegratedWindows')
                    IsDefaultPNA = $true
                    ClassicExperience = $false
                    DefaultIISSite = $true
                    Loopback = "OnUsingHttp"
                    XmlServices = @("ctx-ddc-01.demo.infraxo-dev.com","ctx-ddc-02.demo.infraxo-dev.com")
                    TransportType = "HTTP"
                    Port = 80
                    Type = "XenDesktop"
                    Html5Mode = "Fallback"

                }
            )
        }
        VDA = @{
            DeliveryController =  @("ctx-ddc-01.demo.infraxo-dev.com","ctx-ddc-02.demo.infraxo-dev.com")
        }
    }
}