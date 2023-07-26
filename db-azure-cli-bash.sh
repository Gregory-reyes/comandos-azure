
rgname=pruebadbazure01
location=westus
servername=pruebadbazure8408

#Crear grupo de recursos
az group create --name $rgname --location $location

#crear servidor de base de datos
az sql server create --name $servername --resource-group $rgname --location $location --admin-user demoyoutube --admin-password D!emoyoutube!!.1234!!!X

#crear base de datos
az sql db create --resource-group $rgname --server $servername --name demoyoutube --zone-redundant false



