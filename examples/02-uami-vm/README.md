

---



\## `examples/02-uami-vm/README.md`

```markdown

\# 02 - User-Assigned Managed Identity (UAMI) on Azure VM



\## What this does

Retrieves an \*\*ARM access token\*\* from IMDS using a \*\*User-Assigned Managed Identity\*\* selected by `client\_id`.



\## Prerequisites

\- An \*\*Azure VM\*\* with the \*\*UAMI attached\*\*

\- RBAC granted to that UAMI (e.g. Reader on a scope you will query)

\- The UAMI \*\*Application (client) ID\*\* (often called "clientId" / "appId")

\- PowerShell on the VM



\## Run

On the VM:

```powershell

.\\get-arm-token-uami.ps1 -UamiClientId "<UAMI-CLIENT-ID>"



