#CREACIÓN DE UNA MÁQUINA VIRTUAL PARA USAR WORDPRESS 

#creación de la maquina virtual en azure con los parametros de la maquina en linux

#actualización de la maquina virtual
sudo apt-get update

#descargamos el paquete de wordpress en nuestro directorio
sudo wget http://wordpress.org/latest.tar.gz 

#descomprimimos el paquete de wordpress
sudo tar -xzvf latest.tar.gz

#instalar el paquete php
sudo apt-get install php -y

#Ingresamos a la carpeta de wordpress
cd wordpress

#copiamos el archivo de configuración de wordpress
sudo cp -r * /var/www/html

#ingresamos al directorio de wordpress
cd /var/www/html

#removemos el archivo index.html
sudo rm -rf index.html

#instalamos paquete mysql librerias necesarias php la instalación de wordpress
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql php-cgi php-cli php-gd -y

#reiniciamos el servicio de apache
sudo systemctl restart apache2

#cambiar de propietario el directorio de wordpress
sudo chown -R www-data:www-data /var/www/

#ingresamos a la base de datos de mysql
sudo mysql -u root -p

#creamos la base de datos de wordpress
CREATE DATABASE wordpress;

#creamos el usuario de la base de datos de wordpress
CREATE USER wordpressuser@localhost IDENTIFIED BY 'Gregory';

#damos privilegios al usuario de la base de datos de wordpress
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;

#salimos de la base de datos de wordpress
exit

#configurar el archivo de la base de datos de wordpress
ls

#ejecutamos el siguiente comando para copiar el archivo de configuración de wordpress
sudo cp wp-config-sample.php wp-config.php

#editamos el archivo de configuración de wordpress
sudo nano wp-config.php

#modificamos las siguientes lineas del archivo de configuración de wordpress
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'wordpressuser' );

/** Database password */
define( 'DB_PASSWORD', 'Gregory' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

#Ingresamos a la IP publica creada en azure en el navegador y siguimos los pasos de instalción de wordpress
#Ingresamos el nombre de la base de datos, el usuario y la contraseña creada en la base de datos de mysql
#Ingresamos el nombre del sitio web, el usuario y la contraseña de wordpress
#Ingresamos a la pagina de wordpress creada en la IP publica de azure














































