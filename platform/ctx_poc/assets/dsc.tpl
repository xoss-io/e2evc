#Requires -RunAsAdministrator
[DscLocalConfigurationManager()]
Configuration LCMDefault
{

        Settings
        {
            RefreshFrequencyMins            = 60;
            RefreshMode                     = 'PULL';
            ConfigurationMode               = 'ApplyAndMonitor';
            AllowModuleOverwrite            = $true;
            RebootNodeIfNeeded              = $true;
            ConfigurationModeFrequencyMins  = 15;

        }
        ConfigurationRepositoryWeb 'infra XO'
        {
            ServerURL         			    = 'https://config.infraxo-dev.com/api/dsc'
            RegistrationKey                 = '3e0cbed0-0b21-4e8e-874e-7577f9cda75f'
            ConfigurationNames              = '${configuration}'
            AllowUnsecureConnection			= $true

        }
        ReportServerWeb 'infra XO'
        {
            ServerURL = 'https://config.infraxo-dev.com/api/dsc'
            RegistrationKey   = '3e0cbed0-0b21-4e8e-874e-7577f9cda75f'
            AllowUnsecureConnection = $true
        }
}
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
LCMDefault
Set-DSCLocalConfigurationManager  -Path .\LCMDefault\ -Verbose
Update-DscConfiguration -Verbose