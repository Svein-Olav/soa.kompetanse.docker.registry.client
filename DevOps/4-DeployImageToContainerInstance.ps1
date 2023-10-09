$passord = az acr credential show -n $acr_name --resource-group $resourceGroup --query "passwords[0].value" -o json
$username = az acr credential show -n $acr_name --resource-group $resourceGroup --query "username" -o json

az container create `
    --resource-group $resourceGroup `
    --name acr-tasks `
    --image "$acr_name.azurecr.io/klient:v1" `
    --registry-login-server "$acr_name.azurecr.io" `
    --ip-address Public `
    --location westeurope `
    --registry-username $username `
    --registry-password $passord