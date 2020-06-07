Configuration CTX_MachineCatalog
{
    param(
        
        [Parameter(Mandatory = $true)]
        [string] $Name,
        [Parameter(Mandatory = $true)]
        [string] $Description,
        [Parameter(Mandatory = $true)]
        [string] $Allocation,
        [Parameter(Mandatory = $true)]
        [string] $Provisioning,
        [Parameter(Mandatory = $true)]
        [string[]] $Members,
        [Parameter(Mandatory = $true)]
        [PSCredential] $credential
    )
    Import-DscResource -ModuleName XenDesktop7 
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    $resourceName = $Name.Replace(' ','_');
    XD7Catalog "Catalog_$resourceName" {
        Name = $Name;
        Description = $Description;
        Allocation = $Allocation;
        Provisioning = $Provisioning;
        IsMultiSession = $true;
        Persistence = 'Local'
        PsDscRunAsCredential   = $Credential ;
    }

    XD7CatalogMachine "Catalog_$($resourceName)_Machines" {
        Name = $Name;
        Members = $Members;
        PsDscRunAsCredential   = $Credential ;
        DependsOn = "[XD7Catalog]Catalog_$resourceName";
    }
}
