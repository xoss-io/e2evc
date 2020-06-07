# Desired State Configuration Cmdlets

| Action	                                                                                | Command                                                                                                       |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Disable-DscDebug	                                                                        | Stops debugging of DSC resources.                                                                             | 
| Enable-DscDebug	                                                                        | Starts debugging of all DSC resources.                                                                        | 
| Get-DscConfiguration	                                                                    | Gets the current configuration of the nodes.                                                                  | 
| Get-DscConfigurationStatus	                                                            | Retrieves data about completed configuration runs.                                                            | 
| Get-DscLocalConfigurationManager	                                                        | Gets LCM settings and states for the node.                                                                    | 
| Get-DscResource	                                                                        | Gets the DSC resources present on the computer.                                                               | 
| Invoke-DscResource	                                                                    | Runs a method of a specified DSC resource.                                                                    | 
| New-DSCCheckSum	                                                                        | Creates checksum files for DSC documents and DSC resources.                                                   | 
| Publish-DscConfiguration	                                                                | Publishes a DSC configuration to a set of computers.                                                          | 
| Remove-DscConfigurationDocument	                                                        | Removes a configuration document from the DSC configuration store.                                            | 
| Restore-DscConfiguration	                                                                | Reapplies the previous configuration for the node.                                                            | 
| Set-DscLocalConfigurationManager	                                                        | Applies LCM settings to nodes.                                                                                | 
| Start-DscConfiguration	                                                                | Applies configuration to nodes.                                                                               | 
| Stop-DscConfiguration	                                                                    | Stops a running configuration.                                                                                | 
| Test-DscConfiguration	                                                                    | Tests whether the actual configuration on the nodes matches the desired configuration.                        | 
| Update-DscConfiguration	                                                                | Checks the pull server for an updated configuration and applies it.                                           |

# Desired State Configurations Cmdlets for everyday usage

| Action	                                                                                | Command                                                                                                       |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| Update-DSCConfiguration -Verbose -Wait                                                    | Update DSC configuration on local computer                                                                    |
| Start-DscConfiguration -verbose -wait -useexisting                                        | Run DSC configuration on local computer                                                                       |
| Get-DscLocalConfigurationManager | select -ExpandProperty ConfigurationDownloadManagers   | Get registration URL                                                                                          |
| Get-DscResource -Name XOSS* -Module XOSS*                                                 | Get all DSC resources from a DSC Module                                                                       |
