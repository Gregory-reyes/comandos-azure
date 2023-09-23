#!/bin/bash

#Establezcamos algunas variables para que las utilicen los comandos de la CLI de Azure
myKeyVault=az204vault-$RANDOM
myLocation=westus

#Creemos un grupo de recursos
az group create --name az204-rg-cli --location $myLocation

#Creemos un almacén de claves
az keyvault create --name $myKeyVault --resource-group az204-rg-cli --location $myLocation

#Cree un secreto. Vamos a agregar una contraseña que una aplicación podría usar. La contraseña es ExamplePassword y almacenará el valor hVFkk965BuUv.
#az keyvault secret set --vault-name $myKeyVault --name "ExamplePassword" --value "hVFkk965BuUv"

#Use el comando az keyvault secret show para recuperar el secreto.
#az keyvault secret show --name "ExamplePassword" --vault-name $myKeyVault

#Cuando ya no necesite los recursos de este ejercicio, use el siguiente comando para eliminar el grupo de recursos y la instancia de Key Vault asociada
#az group delete --name az204-rg-cli --no-wait









