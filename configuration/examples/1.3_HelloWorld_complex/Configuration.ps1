Configuration "Demo"{                                           # Äußerster Konfigurationsblock

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

Demo -ConfigurationData  ".\Data.dev.psd1" -OutputPath ".\dev"
Demo -ConfigurationData  ".\Data.prd.psd1" -OutputPath ".\prd"
