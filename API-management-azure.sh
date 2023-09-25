#Creación de una instancia de API Management 
https://learn.microsoft.com/es-es/training/modules/explore-api-management/8-exercise-import-api

myApiName=az204-apim-$RANDOM
myLocation=eastus2
myEmail=greyes8408@gmail.com

#Creemos un grupo de recursos
az group create --name az204-apim-rg --location $myLocation  

#Creemos una instancia de API Management
az apim create -n $myApiName \
    --location $myLocation \
    --publisher-email $myEmail  \
    --resource-group az204-apim-rg \
    --publisher-name AZ204-APIM-Exercise \
    --sku-name Consumption

#1.En Azure Portal, busque y seleccione Servicios de API Management.
#2.En la pantalla API Management, seleccione la instancia de API Management que ha creado.
#3.Seleccione API en el panel de navegación Servicio API Management.
#4.Seleccione OpenAPI en la lista y, en el menú emergente, seleccione Completo
#5.seguimos los pasos de la pagina
https://learn.microsoft.com/es-es/training/modules/explore-api-management/8-exercise-import-api

#6.Terminado con los recursos que creó en este ejercicio, use el comando para eliminar el grupo de recursos y todos los recursos relacionados.
az group delete --name az204-apim-rg









