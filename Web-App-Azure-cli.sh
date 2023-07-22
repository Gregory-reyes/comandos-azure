#!/bin/bash

#variables de entorno
LOCATION="westeurope"
NAME="rg-webapp-azure-cli2"
PLAN="plan-webapp-azure-cli2"

#crear grupo de recursos
az group create --name $NAME --location $LOCATION

#definir el app service plan
az appservice plan create --name $PLAN --resource-group $NAME 

#creamos la webapp
az webapp create --resource-group $NAME --plan $PLAN --name webapp-azure-cli85



