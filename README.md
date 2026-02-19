🔐 Azure Authentication Patterns

Comparative analysis of authentication mechanisms used in Azure workloads and CI/CD pipelines.

📌 Overview

This repository demonstrates and explains the most common authentication models used in Azure:

System-Assigned Managed Identity (SAMI)

User-Assigned Managed Identity (UAMI)

Service Principal with Client Secret

Service Principal with Certificate

Service Principal with OIDC Federation (GitHub Actions)

The goal is to clarify:

When each model should be used

How authentication flows work

Security implications

Token acquisition mechanisms

RBAC integration patterns

🧠 1️⃣ System-Assigned Managed Identity (SAMI)
When to use

Workloads running inside Azure

VM scripts

Azure Functions

App Services

Internal service-to-service communication

Key Characteristics

Identity tied to a single Azure resource

No credential management

Token retrieved from IMDS endpoint

Automatically deleted with the resource

Authentication Flow
flowchart LR
    A[Azure VM<br/>System Assigned MI]
    B[IMDS<br/>169.254.169.254]
    C[Microsoft Entra ID]
    D[Azure Resource Manager]

    A -->|Request Token| B
    B -->|OAuth2| C
    C -->|Access Token| A
    A -->|Bearer Token| D

🧠 2️⃣ User-Assigned Managed Identity (UAMI)
When to use

Multiple Azure resources share same identity

Separation of compute and identity lifecycle

Controlled identity reuse

Key Characteristics

Identity independent from resource

Can be attached to multiple VMs

Can be explicitly selected via client_id

Requires RBAC assignment

Authentication Flow
flowchart LR
    A[Azure VM<br/>User Assigned MI]
    B[IMDS]
    C[Microsoft Entra ID]
    D[Azure Resource Manager]

    A -->|Request Token<br/>client_id optional| B
    B --> C
    C -->|Access Token| A
    A --> D

🧠 3️⃣ Service Principal + Client Secret
When to use

External applications

Legacy CI/CD

Non-OIDC compatible systems

Key Characteristics

Requires secret management

Secret expiration and rotation required

Uses OAuth2 Client Credentials Flow

Authentication Flow
flowchart LR
    A[Application / CI Pipeline]
    B[Client ID + Secret]
    C[Microsoft Entra ID]
    D[Azure Resource Manager]

    A --> B
    B -->|OAuth2 Client Credentials| C
    C -->|Access Token| A
    A --> D

🧠 4️⃣ Service Principal + OIDC Federation (Modern CI/CD)
When to use

GitHub Actions

Azure DevOps (OIDC)

External CI/CD platforms supporting OpenID Connect

Key Characteristics

No stored secrets

Token exchange model

Federated identity configuration

Short-lived tokens

Recommended modern pattern

Authentication Flow
flowchart LR
    A[GitHub Actions Runner]
    B[OIDC Token from GitHub]
    C[Microsoft Entra ID<br/>Federated Credential]
    D[Azure Access Token]
    E[Azure Resource Manager]

    A -->|Request OIDC Token| B
    B -->|Token Exchange| C
    C -->|Access Token| D
    D --> E

📊 Comparison Table
Feature	SAMI	UAMI	SP + Secret	SP + OIDC
Runs inside Azure only	✔	✔	❌	❌
Requires secret	❌	❌	✔	❌
Credential rotation	❌	❌	✔	❌
Reusable across resources	❌	✔	✔	✔
Recommended for CI/CD	❌	❌	⚠️ Legacy	✔
Security level	High	High	Medium	Very High
🔎 Token Acquisition Method
Model	Token Source
Managed Identity	IMDS endpoint
Service Principal	Azure AD OAuth2
OIDC	Federated token exchange
🛡 Security Considerations
Managed Identity

Best for Azure-hosted workloads

Eliminates secret exposure

Minimal attack surface

Service Principal + Secret

Secret leakage risk

Requires rotation policy

Avoid when OIDC available

OIDC Federation

No static credentials

Strong identity binding

Short-lived tokens

Modern best practice

🎯 Best Practice Recommendations
Scenario	Recommended Model
Azure VM automation	Managed Identity
Shared identity across services	User-Assigned MI
GitHub → Azure deployment	OIDC Federation
Legacy system	Service Principal + Certificate
📚 Practical Examples

This repository may include:

VM script using Managed Identity

GitHub workflow using OIDC

Example of SP with client secret

RBAC assignment examples

🧠 Key Insight

Managed Identity is technically a Service Principal.
The difference is lifecycle and credential management are handled automatically by Azure.

OIDC is also based on a Service Principal — but uses token federation instead of static credentials.

👤 Author

Designed as a practical identity architecture lab for Azure automation scenarios.

🔥 Next Level Upgrade (Optional)

If you want, we can also add:

Token lifetime comparison

ARM vs Microsoft Graph audience explanation

RBAC vs Entra roles difference

OAuth2 grant types breakdown

Attack surface comparison diagram
