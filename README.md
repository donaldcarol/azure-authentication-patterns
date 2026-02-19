# 🔐 Azure Authentication Patterns

Comparative analysis of authentication mechanisms used in Azure workloads and CI/CD pipelines.

---

## 📌 Overview

This repository explains the most common authentication models used in Azure:

- System-Assigned Managed Identity (SAMI)
- User-Assigned Managed Identity (UAMI)
- Service Principal with Client Secret
- Service Principal with OIDC Federation

The goal is to clarify:

- When each model should be used
- How authentication flows work
- Security implications
- Token acquisition mechanisms
- RBAC integration patterns

---

## 1️⃣ System-Assigned Managed Identity (SAMI)

### When to use

- Workloads running inside Azure
- VM scripts
- Azure Functions
- App Services
- Internal service-to-service communication

### Authentication Flow

```mermaid
flowchart LR
    A[Azure VM<br/>System Assigned MI]
    B[IMDS<br/>169.254.169.254]
    C[Microsoft Entra ID]
    D[Azure Resource Manager]

    A -->|Request Token| B
    B -->|OAuth2| C
    C -->|Access Token| A
    A -->|Bearer Token| D
