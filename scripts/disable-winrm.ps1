Write-Output "Disabling WinRM over HTTP..."
  Disable-NetFirewallRule -Name "WINRM-HTTP-In-TCP"
  Disable-NetFirewallRule -Name "WINRM-HTTP-In-TCP-PUBLIC"
  Get-ChildItem WSMan:\Localhost\listener | Remove-Item -Recurse
  
$winrmService = Get-Service -Name WinRM
if ($winrmService.Status -eq "Running"){
    Disable-PSRemoting -Force
}
Stop-Service winrm
Set-Service -Name winrm -StartupType Disabled
