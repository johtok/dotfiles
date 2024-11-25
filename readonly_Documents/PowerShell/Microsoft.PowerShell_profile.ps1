Invoke-Expression (& { (zoxide init powershell | Out-String) })
New-Alias sudo gsudo

# Microsoft.PowerShell_profile.ps1
$Env:KOMOREBI_CONFIG_HOME = "$($Env:USERPROFILE)\.config\komorebi"

