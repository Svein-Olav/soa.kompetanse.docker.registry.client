# Vi logger på container registry for å kunne pushe image. Az hjelper oss til å logge på som windows bruker
az acr login --name $acr_name

# Vi bygger image lokalt
docker build -t "$acr_name.azurecr.io/klient:v1" -f .\..\BlazorAppClient\Dockerfile ..

# Vi pusher image til container registry
docker push "$acr_name.azurecr.io/klient:v1"