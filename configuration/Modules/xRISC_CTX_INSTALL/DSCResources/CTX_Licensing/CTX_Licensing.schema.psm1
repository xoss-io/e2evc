Configuration CTX_Licensing
{
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [System.String] $MediaPath,
        [Parameter()]
        [ValidateNotNull()]
        [bool] $InstallRDSLicensingRole = $true,
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string[]] $CitrixLicensePath
    )

    Import-DscResource -ModuleName XenDesktop7
    Import-DscResource -ModuleName PSDesiredStateConfiguration

   

    XD7Feature 'XD7License' {
        Role = 'Licensing';
        SourcePath = $MediaPath;
    }

    if ($IsCitrixLicensePathDirectory) {

        $fileType = 'Directory';
        $fileRecurse = $true;
    }
    else {

        $fileType = 'File';
        $fileRecurse = $false;
    }

    foreach ($licenseFile in $CitrixLicensePath) {

        $counter = 1;
            File "XDLicenseFile_$counter" {
                Type = $fileType;
                Recurse = $fileRecurse;
                SourcePath = $licenseFile;
                DestinationPath = "${env:ProgramFiles(x86)}\Citrix\Licensing\MyFiles";
                PsDscRunAsCredential = $Credential;
            }
       
        $counter++;
    }
}
