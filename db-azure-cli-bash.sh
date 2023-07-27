
rgname=pruebadbazure01
location=westus
servername=pruebadbazure8408

#Crear grupo de recursos
az group create --name $rgname --location $location

#crear servidor de base de datos
az sql server create --name $servername --resource-group $rgname --location $location --admin-user demoyoutube --admin-password D!emoyoutube!!.1234!!!X

#crear firewall rule para permitir conexiones desde cualquier ip
az sql server firewall-rule create --resource-group $rgname --server $servername --name Reglaconexion --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

#crear base de datos
az sql db create --resource-group $rgname --server $servername --name demoyoutube --zone-redundant false

#ruta para hacer la consulta de la base de datos
#En grupo de recurso ingresamos a la database y en la parte de la izquierda seleccionamos query editor y colocamos la contraseña y damos ok
#Seleccionamos la base de datos y creo la tabla y las consulta tipo management studio y le damos a ejecutar
#en la parte izquierda dentro de la tabla damos click derecho select top 1000 rows y nos mostrara los datos de la tabla




