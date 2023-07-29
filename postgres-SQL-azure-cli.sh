name=pruebadbpostgres
location=westus
servername=pruebadbpostgres8408
adminpassword=D!emoyoutube!!.1234!!!X
dbname=pruebadbpostgres

#crear grupo de recursos
az group create --name $name --location $location

#crear postgres server
az postgres server create --resource-group $name --name $servername --location $location \
    --admin-user pruebapostgres --admin-password $adminpassword --sku-name GP_Gen5_2 --version 11

#crear base de datos postgres
az postgres db create --resource-group $name --server-name $servername --name $dbname

#Dentro de la base de datos en el portal -> seguridad de la conexión agregamos la dirección ip del cliente actual que dice el portal
#Agregamos nombre de regla firewall nombre -> Ip inicial 0.0.0.0 y final 255.255.255.255 ne mi caso coloque todas
#damos "sí" permiso al acceso al servicio de azure despues damos guardar
#conectarnos al gestor de base de datos DBeaver
#damos en el boton de enchufe y seleccionamos postgresql ->next 
#HOST: nombre del servidor de base de datos
#PORT: 5432
#DATABASE: nombre de la base de datos creada nombredbpostgres
#Nombre de usuario: nombredbpostgres@pruebadbpostgres8408
#Contraseña: contrasena creada
#Damos test connection y si todo esta bien nos mostrara el mensaje de que la conexión fue exitosa

#Creación de tabla en DBeaver 
#Damos click derecho en la panckes y seleccionamos nueva script SQL
#colocamos el script de creación de la tabla y damos en el boton de ejecutar -> triangulo
#creamos un nuevo script para insertar los datos en la tabla y damos en el boton de ejecutar -> triangulo
#para ver el funcionamiento de la base de datos vamos al portal azure -> metricas












