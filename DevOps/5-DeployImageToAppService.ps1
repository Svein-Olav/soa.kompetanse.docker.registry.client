# Oppgi navn på plan for hvilke ressurser du vil bruker
$planname = "svein-acr-plan"

# Oppgi navn på applikasjonen
$app_name = "sveinapp"

# Lag applikasjonen plan som beskriver ressurser du vil bruke
az appservice plan create --name $planname --resource-group $resourceGroup --sku B1 --is-linux --location westeurope

# Lag en webapp som bruker planen du lagde
az webapp create `
     --resource-group $resourceGroup `
     --plan $planname `
     --name $app_name `
     --deployment-container-image-name "$acr_name.azurecr.io/klient:v1" 

# Hent ut brukernavn og passord for å kunne logge inn i ACR
$passord = az acr credential show -n $acr_name --resource-group $resourceGroup --query "passwords[0].value" -o json
$username = az acr credential show -n $acr_name --resource-group $resourceGroup --query "username" -o json

# Sett opp webappen til å bruke ACR
az webapp config container set `
    --resource-group $resourceGroup `
    --name $app_name `
    --docker-custom-image-name "$acr_name.azurecr.io/klient:v1" `
    --docker-registry-server-url "$acr_name.azurecr.io" `
    --docker-registry-server-user $username `
    --docker-registry-server-password $passord