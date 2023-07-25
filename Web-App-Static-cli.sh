#!/bin/bash

GITHUBTOKEN=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
RESOURCE_GROUP_NAME="prueba_static_07-23"
LOCATION="westus2"

#crear grupo de recursos
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

#create webapp
az staticwebapp create --resource-group $RESOURCE_GROUP_NAME --name cronometro-webapp-azure-static -s https://github.com/Gregory-reyes/Cronometro.git \
  --location $LOCATION --branch main \
  --token $GITHUBTOKEN --app-location "/"

















