#CREACIÓN DE UNA MÁQUINA VIRTUAL PARA USAR WORDPRESS 

#creación de la maquina virtual en azure con los parametros de la maquina en linux

#actualización de la maquina virtual
sudo apt-get update

#instalar librerias necesarias para la instalación de wordpress
sudo apt-get install apache2 mysql-server php libapache2-mod-php php-mysql -y

#creamos el directorio de wordpress
sudo mkdir /var/www/html/wordpress

#cambiar los permisos del directorio
sudo chown www-data:www-data /var/www/html/wordpress

#descargamos el paquete de wordpress en nuestro directorio
cd /var/www/html/wordpress

#descargamos el paquete de wordpress en nuestro directorio
sudo wget http://wordpress.org/latest.tar.gz 

#modificar el archivo de configuración de apache
sudo nano /etc/apache2/sites-available/wordpress.conf

#agregar las siguientes lineas al archivo de configuración de apache
#<Directory /var/www/html/wordpress/>
#    AllowOverride All
#</Directory>

#activar el archivo de configuración de wordpress
sudo a2ensite wordpress

#activar el modulo de apache
sudo a2enmod rewrite

#reiniciar el servicio de apache
sudo systemctl restart apache2

#creamos la base de datos de wordpress
sudo mysql -u root -p

#creamos la base de datos de wordpress
CREATE DATABASE wordpress;

#creamos el usuario de la base de datos de wordpress
CREATE USER wordpressuser@localhost IDENTIFIED BY 'Gregory';

#otorgamos los permisos al usuario de la base de datos de wordpress
GRANT ALL PRIVILEGES ON wordpress.* TO wordpressuser@localhost;

#salimos de la base de datos de wordpress
exit    







































