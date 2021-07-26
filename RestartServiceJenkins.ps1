$PASSWORD = ConvertTo-SecureString "$($ENV:PASSWORD)" -AsPlainText -Force
$Credential = New-Object System.Management.Automation.PSCredential ("$ENV:USERNAME", $PASSWORD)
$service = Get-Service BITS -ErrorAction SilentlyContinue
    if ($service.Status -eq "stopped")
    {
        Start-Service -Name BITS | where ($_.credential -eq  $Credential)
    }