#mirar maquinas mis virtuales
Get-AzVm

#Parar la maquina virtual
Stop-AzVm -Name "pwrsdemo" -ResourceGroupName "pwrsgroup"

#Comando para ver opciones de app services
get-command *AzWebApp

#comando para eliminar archivos
rm -r archivo

#Para mirar la suscripción 
Get-AzSubscription

#Este comando podrás ver los grupos de recursos que tienes en esa suscripción
Get-AzResourceGroup

#Este comando lista todas las suscripciones disponibles para tu cuenta
Get-AzSubscription | Select-Object Name, Id, State, TenantId

#Ingresamos al porweshell7 y colocamos el siguiente comando para crear el nuevo recurso se llamo pwrsgroup
New-AzResourceGroup -Name pwrsgroup -Location 'EastUs'

#Creación de la maquina virtual del recurso creado con el siguiente comando
#Se creo de las 2 formas con las mismas credenciales de las anterior VM, se hizo prueba con servidor web y funcionan
New-AzVM -REsourceGroupName 'NOMBRE-GRUPO-RECURSOS' -Location 'EastUs' -Name 'coloca-name-vm' -PublicIpAddressName 'myPublicIP' -OpenPort 80,443,3389

#tambien otra opcion se puede de esta forma
New-AzVm -ResourceGroupName NOMBRE-GRUPO-RECURSOS -Name coloca-name-vm -Location 'EastUs' -VirtualNetworkName "mynewVNet" -SubnetName "default" -SecurityGroupName "mynewNSG" -PublicIpAddressName 'myPublicIP' -OpenPort 80,3389


#CREACIÓN DE UNA VM CON NGINX
#script para crear vm 
az vm create --resource-group "NOMBRE-GRUPO-RECURSOS" --name coloca-name-vm --public-ip-sku Standard --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys

#Instalación de NGINX
az vm extension set --resource-group "COLOCA-GRUPO-RECURSOS" --vm-name coloca-name-vm --name customScript --publisher Microsoft.Azure.Extensions --version 2.1 --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'

#configurar grupo de seguridad de red - reglas de entrada - agregar puerto http

#Nos conectamos con la ip publica Y LISTO


#CREACIÓN DE UNA APLICACIÓN WEB CON POWERSHELL

#con el siguiente comando creo grupo de recurso de la aplicación y su localizacion
New-AzResourceGroup -Name "powershellwebapp2" -location "EastUs"

#Creación del plan de servicio de la aplicación
New-AzAppServicePlan -ResourceGroupName "powershellwebapp2" -Name "gregoryapp" -Location "EastUs" -Tier "Free"

#Poner la aplicación en el servicio
New-AzWebApp -ResourceGroupName "powershellwebapp2" -name "gregoryapp14" -location "EastUs" -AppServicePlan "gregoryapp"








