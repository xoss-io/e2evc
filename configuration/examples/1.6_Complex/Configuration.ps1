Configuration "Demo"{                                           # Äußerster Konfigurationsblock

    Import-DscResource -ModuleName PSDesiredStateConfiguration  # Import von Modulen

    Node $AllNodes.NodeName {                                   # Computer / Teilkonfigurationsblock

        
        foreach($part in Get-ChildItem ".\Partials")            # Aufruf aller Teilkonfigurationsblöcke
        {
            . "$($part.FullName)"
        }
    }
}

Demo -ConfigurationData  ".\Data.dev.psd1" -OutputPath ".\dev"
Demo -ConfigurationData  ".\Data.prd.psd1" -OutputPath ".\prd"