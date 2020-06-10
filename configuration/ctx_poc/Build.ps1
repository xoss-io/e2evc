. .\Configuration.ps1
CTX_POC -OutputPath .\output -ConfigurationData .\Data.psd1 -Verbose
New-DscChecksum -Path .\output -OutPath .\output