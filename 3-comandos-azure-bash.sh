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

#EJECUTANDO EL SCRIPT: Vm-linux-cli-bash

#comando para arrancar el script de la Vm-linux-cli-bash.sh 
bash Vm-linux-cli-bash.sh

#Definir las variables de entorno para que se pueda mostrar la ip publica de la VM
export RESOURCE_GROUP_NAME="demoyoutubevmlinux"
export LOCATION="westus"
export VM_NAME="vmdemoyoutubelinux"
export VM_IMAGE="debian"
export VM_SIZE="Standard_B1ls"
export ADMIN_USERNAME="demoyoutubevmlinux"

#abrira el puerto 22 para poder acceder a la VM
az vm open-port --port 22 --resource-group $RESOURCE_GROUP_NAME --name $VM_NAME

#hacer el ssh de la VM con el siguiente comando damos yes y colocamos la contraseña
ssh demoyoutubevmlinux@20.228.122.70

#entramos al modo super usuario para actualizar la VM
sudo su

#actualizamos la VM
apt-get update -y && apt-get upgrade -y

#EJECUTANDO EL SCRIPT: Vm-linux-cli-nginx

#comando para arrancar el script de la Vm-linux-cli-nginx.sh 
bash Vm-linux-cli-nginx.sh

#comando para arrancar el script de la Vm-linux-cli-nginx.sh
export RESOURCE_GROUP_NAME="nginxdemoyoutube"
export LOCATION="westus"
export VM_NAME="vmnginxdemoyoutube"
export VM_IMAGE="debian"
export VM_SIZE="Standard_B1ls"
export ADMIN_USERNAME="nginxdemoyoutube"

#abrira el puerto 80 para poder acceder a la VM ***************OJO********************
#pero en este caso se pego en el script directamente al bash del portal azure lo coloco como muestra
#pero al arrancar se debe comentar la linea de codigo del puerto 80 del script ***************OJO********************
az vm open-port --port 80 --resource-group $RESOURCE_GROUP_NAME --name $VM_NAME

#hacer el ssh de la VM con el  nombre que esta en ADMIN_USERNAME, siguiente comando damos yes y colocamos la contraseña
ssh nginxdemoyoutube@20.237.162.224

#entramos al modo super usuario para actualizar la VM
sudo su

#actualizamos la VM y listo ya podemos abrir el navegador y colocar la ip publica de la VM y estara funcionando el servidor web nginx
apt-get update -y && apt-get upgrade -y


#INSTALANDO EXPRESS 

#instalando express se crea una carpeta
mkdir prueba_express_azure

#entramos a la carpeta con cd y instalamos express
npx express-generator --view ejs

#instalamos las dependencias
npm install

#corremos el servidor en el puerto localhost:3000 
npm start

#ingresamos al entorno de wsl y desplegamos la carpeta creada en azure
az webapp up --sku f1 --name prueba-express-azure 

#comando para eliminar un grupo de recursos
az group delete --resource-group greg_8408_rg_9485 --yes

#Comando para subir los cambios 
az webapp up 


















