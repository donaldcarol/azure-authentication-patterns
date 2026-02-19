# Login to Azure using Service Principal + Client Secret (classic).
# Run anywhere with Azure CLI installed.

param(
  [Parameter(Mandatory=$true)]
  [string] $TenantId,

  [Parameter(Mandatory=$true)]
  [string] $ClientId,

  [Parameter(Mandatory=$true)]
  [string] $ClientSecret,

  [Parameter(Mandatory=$true)]
  [string] $SubscriptionId
)

$ErrorActionPreference = "Stop"

try {
  az login --service-principal -u $ClientId -p $ClientSecret --tenant $TenantId | Out-Null
  az account set --subscription $SubscriptionId | Out-Null

  $sub = az account show --query "{name:name,id:id,user:user}" -o jsonc
  Write-Host "Logged in with SP + secret. Context:"
  Write-Host $sub
}
catch {
  Write-Error $_
  exit 1
}
