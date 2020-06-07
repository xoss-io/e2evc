Configuration "Demo"{                                           # Äußerster Konfigurationsblock

    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node $AllNodes.NodeName {

        . ".\partials\CreateFilestructure.ps1"
    }
}

Demo -ConfigurationData  ".\Data.dev.psd1" -OutputPath ".\dev"
Demo -ConfigurationData  ".\Data.prd.psd1" -OutputPath ".\prd"