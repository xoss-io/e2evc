Configuration CTX_Application
{
    param(
        [Parameter(Mandatory)]
        [string] $Name,
        [Parameter(Mandatory)]
        [string] $Path,
        [ValidateSet('Published','Local')]
        [string] $Type = 'Published',
        [ValidateNotNullOrEmpty()]
        [Parameter(Mandatory)]
        [string] $DesktopGroupName,
        [AllowNull()]
        [string] $Arguments,
        [AllowNull()]
        [string] $WorkingDirectory,
        [AllowNull()]
        [string] $Description,
        [ValidateNotNullOrEmpty()]
        [string] $DisplayName = $Name,
        [ValidateNotNull()]
        [bool] $Enabled = $true,
        [ValidateNotNull()]
        [bool] $Visible = $true,
        [ValidateNotNull()]
        [PSCredential]
        $Credential
)

Import-DscResource -ModuleName XenDesktop7
Import-DscResource -ModuleName PSDesiredStateConfiguration


$resourceId = '{0}_{1}' -f $DesktopGroupName.Replace(' ','_'), $Name
XD7DesktopGroupApplication $resourceId {
    Name = $Name
    DesktopGroupName = $DesktopGroupName
    Path = $Path
    ApplicationType = if ($Type -eq 'Published') { 'HostedOnDesktop' } else { 'InstalledOnClient' }
    Arguments = $Arguments
    WorkingDirectory = $WorkingDirectory
    Description = $Description
    Enabled = $Enabled
    Visible = $Visible
    DisplayName = $DisplayName
    PsDscRunAsCredential = $Credential
}
}
