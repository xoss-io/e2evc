@{
    AllNodes = @(
        @{
            NodeName = 'SRV-01'
            DestinationPath = "C:\HelloWorld.ps1"
            Content = "Hello from DSC"
        }
        @{
            NodeName = 'SRV-02'
            DestinationPath = "C:\HelloWorld.ps1"
            Content = "Hello from DSC"
        }
        @{
            NodeName = 'SRV-03'
            DestinationPath = "C:\HelloWorld.ps1"
            Content = "Hello from DSC"
        }
    )
}
