\# Examples



This folder contains minimal, runnable examples for four Azure authentication models:



1\) \*\*SAMI on Azure VM (IMDS)\*\*  

&nbsp;  Folder: `01-sami-vm/`  

&nbsp;  Run on an Azure VM with \*\*System-Assigned Managed Identity\*\* enabled.



2\) \*\*UAMI on Azure VM (IMDS + client\_id)\*\*  

&nbsp;  Folder: `02-uami-vm/`  

&nbsp;  Run on an Azure VM with a \*\*User-Assigned Managed Identity\*\* attached.



3\) \*\*Service Principal + Client Secret (classic)\*\*  

&nbsp;  Folder: `03-sp-client-secret/`  

&nbsp;  Run anywhere with Azure CLI installed.



4\) \*\*OIDC Federation (GitHub Actions)\*\*  

&nbsp;  Folder: `04-oidc-github-actions/`  

&nbsp;  Run in GitHub Actions using `azure/login@v2` and Entra federated credentials.



