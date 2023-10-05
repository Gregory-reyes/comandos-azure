# link para mas información
https://learn.microsoft.com/en-us/troubleshoot/azure/app-service/faqs-app-service-linux

#Creamos los recursos en el portal de azure normalmente
#En access keys copiamos el username y el password del container registry 
#Ingresamos a app service settings -> configuration -> DOCKER_REGISTRY_SERVER_USERNAME -> Lapiz -> copiamos el username del container registry
#Ingresamos a app service settings -> configuration -> DOCKER_REGISTRY_SERVER_PASSWORD -> Lapiz -> copiamos el password del container registry
#Agregamos una variable "Opcional depende del puerto personalizado que tenga el microservicio"
#New aplication settings -> WEBSITE_PORT -> 7080 -> Save

#Creación de la Imagen azure devops -> ingresamos al Repo -> project settings -> service coneectons -> new service connection -> docker registry -> next -> docker registry -> next -> azure container registry ->
#-> seleccionamos el  nombre container registry -> details colocamos un nombre cualquiera -> damos check -> save

#agregamos un nuevo fichero en el repositorio -> tres puntos -> new file -> nombre del fichero -> Dockerfile ->copiamos el codigo de abajo

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
FROM openjdk:11.0.11-jre-slim-buster
RUN addgroup -system digitalthinking && adduser -system admin --ingroup digitalthinking
RUN apt-get update && apt-get install -y curl
USER admin:digitalthinking
VOLUME /tmp
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java -Duser.timezone=CET $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

#commit -> save

#Para crear un nuevo archivo.yml con la configuración del docker creado en azure devops
#Pipelines -> new pipeline -> azure repos git -> seleccionamos el docker build container registry -> seleccionamos la suscripcion -> continue -> seleccionamos container registry azure-> dejamos los valores por defecto -> save

#Para verificar su creación ingresamos container registry -> repositories -> verificamos su creación
#creación del pipeline para desplegar la app service en azure
#Pipeline -> Releases -> New -> azure app service deployment -> seleccionamos un nombre -> cerramos en la x
# Tasks -> unlink all -> confirm -> Damos click en la tarea creada -> colocamos la suscripcion -> web app for container linux -> colocamos el app services name que vamos a desplegar ->
# -> En registry name space copiamos el link del contenedor -> Image -> el que tengo en repositories de azure -> tag -> latest -> ok
# Create realease -> create -> ok
# para verificar su cración lo podemos validar -> app services -> seleccionamos el app service creado -> overview -> url debe funcionar

#link para cachear los pipelines
https://learn.microsoft.com/en-us/azure/devops/pipelines/release/caching?view=azure-devops


