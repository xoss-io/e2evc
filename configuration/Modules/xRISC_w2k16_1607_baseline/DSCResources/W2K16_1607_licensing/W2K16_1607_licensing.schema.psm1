Configuration licensing
{
    Registry RDSLicenseServer
    {
    Key       = 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService\Parameters\LicenseServers'
    ValueName = 'SpecifiedLicenseServers'
    ValueData = $Citrix.RDSlicenseserver
    ValueType = 'MultiString'
    }

    Registry RDSLicensingMode
    {
    Key       = 'HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Terminal Server\RCM\Licensing Core'
    ValueName = 'LicensingMode'
    ValueData = '4'
    ValueType = 'Dword'
    }
}
