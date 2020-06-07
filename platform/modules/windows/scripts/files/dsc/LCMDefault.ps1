[DscLocalConfigurationManager()]
Configuration LCMDefault
{

    param(
        [string[]]$ConfigName = "Empty",
        [string]$PullserverUrl = "https://config.infra-x0.com/api/dsc",
        [string]$RegistrationKey = '3e0cbed0-0b21-4e8e-874e-7577f9cda75f'
    )
        Settings
        {
            RefreshFrequencyMins            = 240;
            RefreshMode                     = "PULL";
            ConfigurationMode               = "ApplyAndAutocorrect";
            AllowModuleOverwrite            = $true;
            RebootNodeIfNeeded              = $true;
            ConfigurationModeFrequencyMins  = 60;
            
        }
        ConfigurationRepositoryWeb "RISC AWS"
        {
            ServerURL         				= $PullserverUrl
            RegistrationKey                 = $RegistrationKey
            ConfigurationNames              = $ConfigName
			AllowUnsecureConnection			= $true

        }
		ReportServerWeb ComplianceServer
        {
            ServerURL         				= $PullserverUrl
            RegistrationKey   = $RegistrationKey
            AllowUnsecureConnection = $true
        }   
}