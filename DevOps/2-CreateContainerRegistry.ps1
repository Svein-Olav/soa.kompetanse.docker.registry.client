#Lage en global variable som holder navn på azure container registry
$global:acr_name= "sveinregistrycr"

# Opprette et nytt container registry
az acr create --resource-group $resourceGroup --name $acr_name --sku Standard --location westeurope --admin-enabled true