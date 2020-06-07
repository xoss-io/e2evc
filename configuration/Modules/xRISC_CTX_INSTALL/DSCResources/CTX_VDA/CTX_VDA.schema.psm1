Configuration CTX_VDA
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$MediaPath,
        [Parameter(Mandatory = $true)]
        [string]$Domain,
        [Parameter(Mandatory = $true)]
        [string[]]$Features,
        [Parameter(Mandatory = $true)]
        [string[]]$Controllers,
        [Parameter(Mandatory = $true)]
        [PSCredential]$Credential
    )
    
    Import-DscResource -ModuleName XenDesktop7 

    # foreach ($feature in $Features) {

    #     WindowsFeature "$feature" {
    #         Name   = "$feature";
    #         Ensure = 'Present';
    #     }
    #     $featureDependsOn = @()
    #     $featureDependsOn += "[WindowsFeature]$feature";
    # }
    
    XD7VDAFeature 'XD7SessionVDA' {
        Role       = 'SessionVDA';
        SourcePath = $MediaPath;
        Optimize = $false
        ExcludeTelemetryService = $true
        EnableRealTimeTransport = $true
        EnableRemoteAssistance = $true
        PsDscRunAsCredential  = $Credential;
        # DependsOn  = $featureDependsOn;
    }

   foreach($c in $Controllers)
   {
        XD7VDAController "XD7VDA_$c" {
            Name = "${c}.$Domain";
            DependsOn = '[XD7VDAFeature]XD7SessionVDA';
            }
   }
}
