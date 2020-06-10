<powershell>
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\.NetFramework\v4.0.30319' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\.NetFramework\v2.0.50727' -Name 'SchUseStrongCrypto' -Value '1' -Type DWord
Get-NetAdapter | Rename-NetAdapter -NewName "internal"


Set-Item -Path WSMan:\localhost\MaxEnvelopeSizeKb -Value 16384
Set-Item WSMan:\localhost\Shell\MaxMemoryPerShellMB 4096

$Password = "${password}" | ConvertTo-SecureString -AsPlainText -Force
New-LocalUser "${username}" -Password $Password -FullName "${username}" -Description "Installer account."
Add-LocalGroupMember -Group "Administrators" -Member "${username}"



Set-MpPreference -DisableRealtimeMonitoring $false
Uninstall-WindowsFeature -Name Windows-Defender

Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

winrm quickconfig -quiet
Enable-PSRemoting -Force -SkipNetworkProfileCheck
winrm set winrm/config/service/Auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

Rename-Computer -NewName "${hostname}" -Force
Restart-Computer -Force
</powershell>