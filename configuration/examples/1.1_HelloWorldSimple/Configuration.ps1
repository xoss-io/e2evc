Configuration "Demo"{                                           # Äußerster Konfigurationsblock

    Import-DscResource -ModuleName PSDesiredStateConfiguration  # Import von Modulen

    Node "localhost" {                                          # Computer / Teilkonfigurationsblock

        File "HelloWorld"{                                      # Resourcenblock
            Ensure = "Present"
            DestinationPath = "C:\Temp\HelloWorld.ps1"
            Contents = "Hello from DSC"
            Force = $true
        }
    }
}

Demo -OutputPath .\1.1_HelloWorld_Simple