

---



\## `examples/03-sp-client-secret/README.md`

```markdown

\# 03 - Service Principal + Client Secret (Classic)



\## What this does

Logs in using an Entra \*\*Service Principal\*\* (App Registration) and a \*\*client secret\*\*, then sets the Azure subscription context.



\## Prerequisites

\- Azure CLI installed (`az`)

\- An Entra App Registration (Service Principal)

\- A client secret created for the app

\- RBAC assigned to the service principal at the required scope

\- Tenant ID + Subscription ID



\## Security note

Do \*\*NOT\*\* hardcode secrets. Use environment variables or a secure secret store.



\## Run (PowerShell)

```powershell

$TenantId = "<tenant-id>"

$ClientId = "<app-client-id>"

$ClientSecret = "<client-secret>"

$SubscriptionId = "<subscription-id>"



.\\login-sp-secret.ps1 `

&nbsp; -TenantId $TenantId `

&nbsp; -ClientId $ClientId `

&nbsp; -ClientSecret $ClientSecret `

&nbsp; -SubscriptionId $SubscriptionId



