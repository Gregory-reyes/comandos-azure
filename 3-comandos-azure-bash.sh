#CREACIÓN DE UNA APLICACIÓN WEB CON BASH

#Entramos al entorno de Bash por el CLI de Azure y creamos la carpeta con el siguiente comando
mkdir newwebapp

#miramos que este creada en el directorio con el sigueinte comando
ls -al

#Ingresamos a la carpeta con el comando
cd newwebapp

#clonamos el repositorio que queremos desplegar
git clone https://github.com/Gregory-reyes/restaurante_en_casa.git

#miramos que este creada en el directorio entramos al repositorio con el siguiente comando
ls -al

#Ingresamos a la carpeta con el comando
cd "nombre del respositorio"

#con el siguiente comando hacemos el despliegue y el adaptara el plan y recursos que no fueron creados
az webapp up --location eastus --name restaurante-marleny --html

#






