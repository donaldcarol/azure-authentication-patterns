# Gets an ARM access token using a User-Assigned Managed Identity (UAMI) via IMDS.
# Run this ON the Azure VM with the UAMI attached.

param(
  [Parameter(Mandatory=$true)]
  [ValidateNotNullOrEmpty()]
  [string] $UamiClientId
)

$ErrorActionPreference = "Stop"

$resource = "https://management.azure.com/"
$apiVersion = "2018-02-01"
$imds = "http://169.254.169.254/metadata/identity/oauth2/token"

$uri = "$imds?api-version=$apiVersion&resource=$([Uri]::EscapeDataString($resource))&client_id=$([Uri]::EscapeDataString($UamiClientId))"

try {
  $resp = Invoke-RestMethod -Method GET -Uri $uri -Headers @{ Metadata = "true" } -TimeoutSec 10
  $token = $resp.access_token
  if (-not $token) { throw "No access_token in IMDS response." }

  Write-Host "Got ARM token (UAMI). Token length: $($token.Length)"
}
catch {
  Write-Error $_
  exit 1
}
