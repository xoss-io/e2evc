Configuration "Demo"{

    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node "localhost" {

        
        foreach($part in Get-ChildItem ".\Partials")
        {
            . "$($part.FullName)"
        }
    }
}

Demo 