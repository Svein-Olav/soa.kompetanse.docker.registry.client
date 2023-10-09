# Opprette et nytt container registry
$global:acr_name= "sveinregistrycr"
az acr create --resource-group $resourceGroup --name $acr_name --sku Standard --location westeurope --admin-enabled true