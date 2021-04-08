docker login myregistry.azurecr.io
docker tag gitserver myregistry.azurecr.io/gitserver:v0.2
docker push myregistry.azurecr.io/gitserver:v0.2
