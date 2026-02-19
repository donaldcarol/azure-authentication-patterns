# Gets an ARM access token using the VM's System-Assigned Managed Identity (SAMI).
# Run this ON the Azure VM with SAMI enabled.

$ErrorActionPreference = "Stop"

$resource = "https://management.azure.com/"
$apiVersion = "2018-02-01"
$imds = "http://169.254.169.254/metadata/identity/oauth2/token"

$uri = "$imds?api-version=$apiVersion&resource=$([Uri]::EscapeDataString($resource))"

try {
  $resp = Invoke-RestMethod -Method GET -Uri $uri -Headers @{ Metadata = "true" } -TimeoutSec 10
  $token = $resp.access_token
  if (-not $token) { throw "No access_token in IMDS response." }

  Write-Host "Got ARM token (SAMI). Token length: $($token.Length)"
  # Example call to ARM:
  $subId = (Invoke-RestMethod -Headers @{Authorization="Bearer $token"} -Uri "https://management.azure.com/subscriptions?api-version=2020-01-01").value[0].subscriptionId
  Write-Host "Example subscriptionId from ARM: $subId"
}
catch {
  Write-Error $_
  exit 1
}
