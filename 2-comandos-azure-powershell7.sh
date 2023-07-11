#mirar maquinas mis virtuales
Get-AzVm

#Parar la maquina virtual
Stop-AzVm -Name "pwrsdemo" -ResourceGroupName "pwrsgroup"

#Comando para ver opciones de app services
get-command *AzWebApp

#comando para eliminar archivos
rm -r archivo

#Ingresamos al porweshell7 y colocamos el siguiente comando para crear el nuevo recurso se llamo pwrsgroup
New-AzResourceGroup -Name pwrsgroup -Location 'EastUs'

#Creación de la maquina virtual del recurso creado con el siguiente comando
#Se creo de las 2 formas con las mismas credenciales de las anterior VM, se hizo prueba con servidor web y funcionan
New-AzVM -REsourceGroupName 'pwrsgroup' -Location 'EastUs' -Name 'pwrsdemo' -PublicIpAddressName 'myPublicIP' -OpenPort 80,443,3389

#O tambien otra opcion se puede de esta forma
New-AzVm -ResourceGroupName pwrsgroup -Name pwrsdemo -Location 'EastUs' -VirtualNetworkName "mynewVNet" -SubnetName "default" -SecurityGroupName "mynewNSG" -PublicIpAddressName 'myPublicIP' -OpenPort 80,3389

#CREACIÓN DE UNA APLICACIÓN WEB CON POWERSHELL

#con el siguiente comando creo grupo de recurso de la aplicación y su localizacion
New-AzResourceGroup -Name "powershellwebapp2" -location "EastUs"

#Creación del plan de servicio de la aplicación
New-AzAppServicePlan -ResourceGroupName "powershellwebapp2" -Name "gregoryapp" -Location "EastUs" -Tier "Free"

#Poner la aplicación en el servicio
New-AzWebApp -ResourceGroupName "powershellwebapp2" -name "gregoryapp14" -location "EastUs" -AppServicePlan "gregoryapp"








