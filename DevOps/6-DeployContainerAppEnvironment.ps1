$passord = az acr credential show -n $acr_name --resource-group $resourceGroup --query "passwords[0].value" -o json
$username = az acr credential show -n $acr_name --resource-group $resourceGroup --query "username" -o json

write-host "Username: $username"
write-host "Password: $passord"

az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights  --wait


# Create a container application environment
az containerapp env create `
    --name MyAppContainerEnv `
    --resource-group $resourceGroup `
    --location westeurope 

