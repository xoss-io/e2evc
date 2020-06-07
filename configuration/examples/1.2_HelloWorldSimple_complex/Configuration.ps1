$configuration = 
@{
    AllNodes = @(
        @{
            NodeName = 'localhost'
            DestinationPath = "C:\Temp\HelloWorld.ps1"
            Content = "Hello from DSC"
        }
    )
}


Configuration "Demo"{

    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node $AllNodes.NodeName {

        File "HelloWorld"{
            Ensure = "Present"
            DestinationPath = $Node.DestinationPath
            Contents = $Node.Content
            Force = $true
        }
    }
}

Demo -ConfigurationData  $configuration