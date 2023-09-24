#Cree variables que se usen en los comandos de la CLI de Azure bus 
myLocation=eastus2
myNameSpaceName=az204svcbus$RANDOM

#Creemos un grupo de recursos
az group create --name az204-svcbus-rg --location $myLocation

#Cree un espacio de nombres de mensajería de Service Bus
az servicebus namespace create \
    --resource-group az204-svcbus-rg \
    --name $myNameSpaceName \
    --location $myLocation

#Creación de una cola de Service Bus
az servicebus queue create --resource-group az204-svcbus-rg \
    --namespace-name $myNameSpaceName \
    --name az204-queue

#eliminar el grupo de recursos.    
az group delete --name az204-svcbus-rg --no-wait

