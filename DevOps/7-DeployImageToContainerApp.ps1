$passord = az acr credential show -n $acr_name --resource-group $resourceGroup --query "passwords[0].value" -o json
$username = az acr credential show -n $acr_name --resource-group $resourceGroup --query "username" -o json

az containerapp up `
	--name frontend `
	--image "$acr_name.azurecr.io/klient:v1" `
	--resource-group $resourceGroup `
    --environment MyAppContainerEnv `
    --registry-server $acr_name `
	--registry-username $username `
	--registry-password $passord `
    --target-port 80 `
	--ingress 'external' `
	--query properties.configuration.ingress.fqdn

az containerapp up `
	--name backend `
	--image "$acr_name.azurecr.io/server:v1" `
	--resource-group $resourceGroup `
    --environment MyAppContainerEnv `
    --registry-server $acr_name `
	--registry-username $username `
	--registry-password $passord `
    --target-port 80 `
	--ingress 'external' `
	--query properties.configuration.ingress.fqdn
