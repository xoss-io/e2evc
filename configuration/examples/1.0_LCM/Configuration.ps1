[DscLocalConfigurationManager()]
Configuration LCMDefault
{

		$regKey 		= '3e0cbed0-0b21-4e8e-874e-xxxxxxxxx'
        Settings
        {
            RefreshFrequencyMins            = 240;
            RefreshMode                     = "PULL";
            ConfigurationMode               = "ApplyAndAutocorrect";
            AllowModuleOverwrite            = $true;
            RebootNodeIfNeeded              = $false;
            ConfigurationModeFrequencyMins  = 60;
            
        }
        ConfigurationRepositoryWeb "infraXO"
        {
            ServerURL         			= "https://config.infraxo.com/api/dsc"
            RegistrationKey                 = $regKey
            ConfigurationNames              = "infraxo_Default"
			AllowUnsecureConnection			= $true

        }
		ReportServerWeb ComplianceServer
        {
            ServerURL         			= "https://config.infraxo.com/api/dsc"
            RegistrationKey   = $regKey
            AllowUnsecureConnection = $true
        }   
}

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v2.0.50727' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

winrm quickconfig -quiet
Enable-PSRemoting -Force -SkipNetworkProfileCheck
Set-Item -Path WSMan:\localhost\MaxEnvelopeSizeKb -Value 16384
Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 4096

Write-Warning 'Restarting WinRM'
Restart-Service WinRM -Force

LCMDefault
Set-DSCLocalConfigurationManager  -Path .\LCMDefault\ -Verbose
Update-DscConfiguration -Verbose -Wait