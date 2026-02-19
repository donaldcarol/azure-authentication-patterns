

---



\## `examples/04-oidc-github-actions/README.md`

```markdown

\# 04 - OIDC Federation (GitHub Actions)



\## What this does

Uses `azure/login@v2` with \*\*OIDC\*\* (no secrets) to authenticate GitHub Actions to Azure.



\## Prerequisites (Azure / Entra)

1\) Create an \*\*App Registration\*\* in Entra ID

2\) Add a \*\*Federated credential\*\*:

&nbsp;  - Subject based on repo and branch (e.g. branch `main`)

3\) Grant RBAC to the service principal at the required scope (e.g. Reader or Contributor)



\## Prerequisites (GitHub)

Add these repository secrets:

\- `AZURE\_CLIENT\_ID` (Application / client ID)

\- `AZURE\_TENANT\_ID` (Directory / tenant ID)

\- `AZURE\_SUBSCRIPTION\_ID` (Subscription ID)



\## Run

GitHub repo → \*\*Actions\*\* → `Azure Login with OIDC (Example)` → \*\*Run workflow\*\*



\## Expected output

\- Successful login

\- `az account show`

\- A short list of resource groups (if permissions allow)



