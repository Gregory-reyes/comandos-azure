#!/bin/bash

RESOURCE_GROUP_NAME="prueba_static"
LOCATION="westus2"

#crear grupo de recursos
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

#create webapp
az webapp create --resource-group $RESOURCE_GROUP_NAME --name webapp-azure-static  
















