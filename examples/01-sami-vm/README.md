\# 01 - System-Assigned Managed Identity (SAMI) on Azure VM



\## What this does

Retrieves an \*\*ARM access token\*\* from the Azure Instance Metadata Service (IMDS) using the VM's \*\*System-Assigned Managed Identity\*\*, then performs a simple ARM call.



\## Prerequisites

\- An \*\*Azure VM\*\* with \*\*System assigned managed identity = On\*\*

\- RBAC granted to the VM's managed identity (e.g. Reader on a subscription or resource group)

\- PowerShell on the VM



\## Run

On the VM:

```powershell

.\\get-arm-token.ps1



