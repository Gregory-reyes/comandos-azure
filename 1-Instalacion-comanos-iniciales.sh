#INSTALAR CLI AZURE WINDOWS WSL

#Instalar el cli de azure en el siguiente link versión mas reciente
https://learn.microsoft.com/es-es/cli/azure/install-azure-cli-windows?tabs=azure-cli

#Instalar el powershell 7 en el link
https://github.com/powershell/powershell

#seguir los pasos de instalación en
https://learn.microsoft.com/en-us/powershell/azure/install-azps-windows?view=azps-10.0.0&tabs=powershell&pivots=windows-psgallery

#Comando para verificar la versión de powershell
$PSVersionTable.PSVersion

#Instalamos el modulo
Install-Module -Name Az -Repository PSGallery -Force

#nos conectamos
Connect-AzAccount

#Se comprueba con el comando su instalación dentro de powershell
az --help

#Link de para la instalación de WSL
https://learn.microsoft.com/es-es/windows/wsl/install

#Comando para ver la lista de distribución de linux
wsl --list --online

#Instalando distribución de linux
wsl --install -d Ubuntu-20.04

#Creamos usuario y contraseña
usuario: abc
contraseña 123

#Con el comando verificamos la instalación de WSL a windows y entramos al sistema linux
bash

#Creamos una carpeta y abrimos VScode en el terminal creamos un archivo .bash
azurevmcli.bash

#posterior abrimos una terminal en VScode con la opción WSL y abrimos nuestro portal azure
#posterior ingresamos al terminal de VScode y colocamos el comando para logearnos
az login

#creación del grupo de recurso con bash en location tambien se puede colocar: westus
az group create --location westeurope --resource-group demoyoutube --tags creado_por=Gregory

#creación con maquina virtual con bash creación de admin-user debe ser mayor a "12" 1-mayus 1-minus 1-number 1-caracter
az vm create \
        --resource-group demoyoutube \
        --name vmdemoyoutube \
        --image Win2022AzureEditionCore \
        --public-ip-sku Standard \
        --admin-username "Demoyoutube.08" 

#Restablecer contraseña se puede cambiar si esta por defecto para poderse conectar a la VM en mi caso
#nos conectamos a la VM por RPD con las nuevas credenciales
Usuario: usuarioMaquinaVM
Contraseña: ContraseñaMaquinaVM

#comando para verificar la información de la VM en bash
az vm show --name "vmbclidemo" --resource-group "azure2023demo"

#Ingreso a la plataforma azure creación de Maquina virtual con el portal
Suscripción = por defecto
Grupo de recursos = Crear nuevo "Nombre"
Nombre de la máquina virtual = "Nombre"
Región = USA
Opciones de disponibilidad = No se requiere redundacia de la infraestructura
Tipo de seguridad = estandar
Imagen = windows server 2019 "pero puede variar"
Arquitectura de vm  = x64
ejecucición de azure spot con descuento = "selecciono el cuadro"
Tamaño = D2as_v4 2cpu, 8gb de memoria "o la free"
Usuario: usuarioMaquinaVM
Contraseña: ContraseñaMaquinaVM
Seleccionar puertos de entrada = "habiliatamos el 80, 443, 3389"

#siguiente pestaña
Disco del S.O = ssd estandar con redundancia
administrar claves = clave administrada plataforma

#siguiente pestaña dejamos la mayoria por defecto solo cambiamos
eliminiar IP pública  cuando se elimine la VM = la habilitamos
habilitar redes aceleradas = la deshabilitamos

#siguiente pestaña dejamos la mayoria por defecto solo cambiamos la hora de apagado para que no cobre de mas
Hora de apagado = "en mi caso lo deje a las 11:30pm hora de dormir de pruebas"

#siguiente pestaña en supervisión dejamos la mayoria por defecto.

#siguiente pestaña Opciones avanzadas en supervisión dejamos la mayoria por defecto solo cambiamos

#Siguiente pestaña
en etiquetas coloco en nombre : creado por y valor : mi nombre

#Siguiente pestaña
Listo asi ya creamos nuestra primera Máquina virtual

#Regreso a la plataforma azure
le damos ir a la  maquina ya creada.
si no esta iniciada le damos iniciar
posterior nos dirigimos conectar seleccionamos la opción RDP
damos descargar archivo RDP damos click para conectarnos al escritorio REMOTO
le damos agregar cuenta en el login y colocamos las credenciales de la VM
Usuario: usuarioMaquinaVM
Contraseña: ContraseñaMaquinaVM

#Ingresamos al dashboard de la windows server y damos click a Add roles and features
damos 3 veces next hasta llegar a select server roles
seleccione web server (IIS) y damos next
damos next hasta llegar a install
ya estará creada nuestro servidor WEB
copiamos la IP publica de la plataforma azure y lo abrimos en una nueva pagina y esté funcionará

#CREACIÓN DE UNA APLICACIÓN WEB

#Ingresamos en App services logo de mundo en la barra izquierda damos crear -> Aplicación Web -> Diligenciamos los datos básicos
Suscripción = "La creada por defecto"
Grupo de recursos = creamos nuevo

Nombre = nombre de mi app
Publicar = coloque la opción "codigo"
Pila del entorno = coloque el lenguaje a programar
región = escoja la región

Planes de precios
plan de windows = nombre de la app
Plan de precios = la gratis
damos siguiente

Implementacion github o por repositorio local

#CREACIÓN DE UNA APLICACIÓN DE FUNCIONES CON EL PORTAL

#en la parte principal damos en el + crear un recurso ->aplicación de funciones tiene un rayo damos crear
grupo de recursos = "el nombre del grupo de función"

Nombre de la aplicación de funciones = "nombre de la instancia de la función"
Desea implementar un código o imagen = codigo

pila del entorno = escogi node
versión = 16 lts
region = east US

Sistema operativo= windows

--le damos siguiente hasta llegar a supervisión dejamos por defecto el ajuste
--en la pestaña de Implementación no le vamos colocar nada de github damos siguiente
--llenamos los otros campos que son similares a las otras implementaciones y damos crear
--vamos al recurso creado y buscamos Funciones "Fx" y en el mas damos crear
--en Entorno de desarrollo colocamos Desarrollo en el portal
--en plantilla escojemos para prueba la HTTP trigger y damos crear
--Ingresamos a codigo y prueba y podemos inteactuar con el json o el index
--en la parte superior ingresamos a obtener la direccion URL de la función y copiamos la dirección
--la pegamos a un navegador y podemos ver que funciona
--pasamos un parametro nombre despues del interrogante = name=Gregory& y función funciona.
--superivición -> registro, permite ver el estado en azul de la función al dar actualizar  

#CREACIÓN DE APLICACIONES DURADERAS CON EL PORTAL

--dentro de la opción del rayito -> Editor de App Service ->abrimos el editor
--en el terminal de la pagina console creamos una package.json con el siguiente comando
touch package.json

--Ingresamos en package.json y colocamos el siguiente codigo
{
	"name": "myfuction",
	"version": "1.0.0"
}

--nos devolvemos e ingresamos a la consola de la plataforma y digitamos 
--el siguiente comando para ver lo que instalamos
ls 

--el siguiente comando es para mostrar lo que sta dentro del archivo json
cat package.json

--instalamos el paquete npm de funciones durables con el siguiente codigo
npm install durable-functions
npm install moment
npm install typescript

--Instalamos los paquetes y modulos node para poder trabajar en su entorno
--reiniciamos la aplicación de función 
--Ingresamos al Funciones "Fx" y le damos crear
--filtramos por durable y seleccionamos -> durable Functions http starter y damos crear
--en detalles de plantilla colocamos lo siguiente y damos crear
Nueva función = PrimeraFuncionPrueba
Nivel de autorización = Function  

--creamos la plantilla del orquestador por Funciones "Fx" y seguimos los pasos de durable
y le colocamos el nombre y le damos crear

#LABORATORIO DE MICROSOFT LEARN Y GITHUB PARA FUNCIÓN APP
https://docs.microsoft.com/en-us/learn/modules/create-serverless-logic-with-azure-functions/3-create-an-azure-functions-app-in-the-azure-portal?pivots=javascript

--Codigo de github para funciones durables
https://github.com/Azure-Samples/durablefunctions-apiscraping-dotnet






















