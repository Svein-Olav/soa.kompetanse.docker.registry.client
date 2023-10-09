# Vi logger p� container registry for � kunne pushe image. Az hjelper oss til � logge p� som windows bruker
az acr login --name $acr_name

# Vi bygger image lokalt
docker build -t "$acr_name.azurecr.io/klient:v1" -f .\..\BlazorAppClient\Dockerfile ..

# Vi pusher image til container registry
docker push "$acr_name.azurecr.io/klient:v1"