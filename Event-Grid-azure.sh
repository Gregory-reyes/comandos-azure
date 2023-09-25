#Ejecute los comandos siguientes para crear las variables
let rNum=$RANDOM*$RANDOM
myLocation=eastus2
myTopicName="az204-egtopic-${rNum}"
mySiteName="az204-egsite-${rNum}"
mySiteURL="https://${mySiteName}.azurewebsites.net"

#Creemos un grupo de recursos
az group create --name az204-evgrid-rg --location $myLocation

#Registre el proveedor de recursos de Event Grid mediante el comando
az provider register --namespace Microsoft.EventGrid

#Para comprobar el estado, ejecute el comando siguiente
az provider show --namespace Microsoft.EventGrid --query "registrationState"

#Cree un tema personalizado mediante el comando
az eventgrid topic create --name $myTopicName \
    --location $myLocation \
    --resource-group az204-evgrid-rg

#Cree un punto de conexión para el mensaje
az deployment group create \
    --resource-group az204-evgrid-rg \
    --template-uri "https://raw.githubusercontent.com/Azure-Samples/azure-event-grid-viewer/main/azuredeploy.json" \
    --parameters siteName=$mySiteName hostingPlanName=viewerhost

echo "Your web app URL: ${mySiteURL}"

#Suscríbase a un tema personalizado mediante el comando az eventgrid event-subscription create. 
#El script siguiente capta el identificador de suscripción necesario de su cuenta y lo usa en la creación de la suscripción al evento.

endpoint="${mySiteURL}/api/updates"
subId=$(az account show --subscription "" | jq -r '.id')

az eventgrid event-subscription create \
    --source-resource-id "/subscriptions/$subId/resourceGroups/az204-evgrid-rg/providers/Microsoft.EventGrid/topics/$myTopicName" \
    --name az204ViewerSub \
    --endpoint $endpoint

#Recupere la dirección URL y la clave para el tema personalizado
topicEndpoint=$(az eventgrid topic show --name $myTopicName -g az204-evgrid-rg --query "endpoint" --output tsv)
key=$(az eventgrid topic key list --name $myTopicName -g az204-evgrid-rg --query "key1" --output tsv)

#Cree los datos del evento que se enviarán. Normalmente, una aplicación o un servicio de Azure enviaría los datos del evento, pero vamos a crear datos para el ejercicio
event='[ {"id": "'"$RANDOM"'", "eventType": "recordInserted", "subject": "myapp/vehicles/motorcycles", "eventTime": "'`date +%Y-%m-%dT%H:%M:%S%z`'", "data":{ "make": "Contoso", "model": "Monster"},"dataVersion": "1.0"} ]'

#Use curl para enviar el evento al tema.
curl -X POST -H "aeg-sas-key: $key" -d "$event" $topicEndpoint

#comando para eliminar el grupo de recursos y los recursos asociados.
az group delete --name az204-evgrid-rg --no-wait



