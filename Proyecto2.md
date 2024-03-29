# Proyecto 2º Trimestre

## Se dará alojamiento a páginas web tanto estáticas como dinámicas con “php”

### Para instalar estos paquetes, ejecute lo siguiente:
sudo apt install php libapache2-mod-php php-mysql

### Una vez que la instalación se complete, podrá ejecutar el siguiente comando para confirmar su versión de PHP
php -v

### Cree el directorio para your_domain de la siguiente manera:
sudo mkdir /var/www/ejemplo

### A continuación, asigne la propiedad del directorio con la variable de entorno $USER, que hará referencia a su usuario de sistema actual:
![Imagen](imgproyecto/servidor2.png)

### Luego, abra un nuevo archivo de configuración en el directorio sites-available de Apache usando el editor de línea de comandos que prefiera. En este caso, utilizaremos nano:
sudo nano /etc/apache2/sites-available/your_domain.conf. Y nos debe salir algo asi
![Imagen](imgproyecto/servidor3.png)

### Ahora, puede usar a2ensite para habilitar el nuevo host virtual:
sudo a2ensite ejemplo

### Es necesario hacerlo si no se utiliza un nombre de dominio personalizado, dado que, en este caso, la configuración predeterminada de Apache sobrescribirá su host virtual. Para deshabilitar el sitio web predeterminado de Apache, escriba lo siguiente:
sudo a2dissite 000-default

### Para asegurarse de que su archivo de configuración no contenga errores de sintaxis, ejecute lo siguiente:
sudo apache2ctl configtest

### Por último, vuelva a cargar Apache para que estos cambios surtan efecto:
sudo systemctl reload apache2

### Cree un archivo index.html en esa ubicación para poder probar que el host virtual funcione según lo previsto:
nano /var/www/proyecto/index.html
![Imagen](imgproyecto/servidor4.png)

### Ahora, diríjase a su navegador y acceda al nombre de dominio o la dirección IP de su servidor una vez más:
http://proyecto_o_la_ip
![Imagen](imgproyecto/servidor5.png)


## Los clientes dispondrán de un directorio de usuario con una página web por defecto.

### Crea un directorio para cada usuario que tenga acceso al servidor web. Puedes hacerlo utilizando el siguiente comando:
sudo mkdir /home/<nombre-de-usuario>/public_html                                
### Asigna los permisos necesarios para que el usuario pueda acceder a su directorio web.Puedes hacerlo utilizando el siguiente comando:
sudo chown -R <nombre-de-usuario>:<nombre-de-usuario> /home/<nombre-de-usuario>/public_html

### Crea un archivo "index.html" en el directorio "public_html" del usuario para servir como la página web por defecto. Puedes hacerlo utilizando el editor de texto de tu preferencia, por ejemplo:
sudo nano /home/<nombre-de-usuario>/public_html/index.html
  
### Para Apache, edita el archivo "/etc/apache2/sites-available/000-default.conf" y agrega las siguientes líneas dentro de la sección <VirtualHost *:80>:
![Imagen](imgproyecto/apache22.png) 

### Para Nginx, edita el archivo "/etc/nginx/sites-available/default" y agrega las siguientes líneas dentro de la sección server:
  
location /~<nombre-de-usuario> {
    alias /home/<nombre-de-usuario>/public_html;
    index index.html;
    autoindex on;
}

### Reinicia el servidor web para que los cambios surtan efecto. Puedes hacerlo con el siguiente comando:
sudo service apache2 restart


## Además contarán con una base de datos sql que podrán administrar con phpmyadmin

### Primero, establezca conexión con la consola de MySQL usando la cuenta root:
sudo mysql

### Para crear una base de datos nueva, ejecute el siguiente comando desde su consola de MySQL:
CREATE DATABASE proyecto;

### El siguiente comando crea un usuario nuevo llamado user, que utiliza mysql_native_password como método de autenticación predeterminado. Definimos la contraseña de este usuario como 12345, pero debe sustituir este valor por una contraseña segura de su elección.
![Imagen](imgproyecto/mysql-crear-user.png)

### Ahora, debemos darle permiso a este usuario a la base de datos proyecto:
![Imagen](imgproyecto/mysql-privilegios.png)

### Ahora cerramos mysql con el comando exit

### Puede verificar si el usuario nuevo tiene los permisos adecuados al volver a iniciar sesión en la consola de MySQL, esta vez, con las credenciales de usuario personalizadas:
mysql -u user -p

### Observe el indicador -p en este comando, que le solicitará la contraseña que utilizó cuando creó el usuario user. Después de iniciar sesión en la consola de MySQL, confirme que tenga acceso a la base de datos proyecto:
![Imagen](imgproyecto/phpmyadmin.png)

### Ahora crearemos una tabla dentro de la base de datos
INSERT INTO proyecto.lista (content) VALUES ("Mi item");


## Los clientes podrán acceder mediante ftp para la administración de archivos configurando adecuadamente TLS

### Genera un certificado SSL/TLS para el servidor. Puedes hacerlo utilizando OpenSSL con el siguiente comando:
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt

### Configura el servidor FTP para utilizar TLS. Para ello, edita el archivo de configuración del servidor FTP "vsftpd.conf" ubicado en "/etc/" utilizando el editor de texto de tu preferencia. Por ejemplo, puedes usar nano con el siguiente comando:
sudo nano /etc/vsftpd.conf
![Imagen](imgproyecto/tls.png)

### Reinicia el servicio FTP para que los cambios surtan efecto. Puedes hacerlo con el siguiente comando:
sudo service vsftpd restart

### Con estos pasos, ya has configurado el servidor FTP para permitir el acceso seguro mediante TLS. Ahora los clientes pueden conectarse al servidor FTP utilizando un cliente FTP que soporte TLS, como FileZilla, y configurando adecuadamente el cliente para que utilice TLS para la conexión 


## Se habilitará el acceso mediante ssh y sftp. 

### Instala los servicios SSH y FTP en tu servidor Ubuntu. Puedes hacerlo con los siguientes comandos:
sudo apt-get update
sudo apt-get install openssh-server vsftpd

### Configura el acceso SSH en tu servidor. Para ello, edita el archivo de configuración del servidor SSH "sshd_config" ubicado en "/etc/ssh/" utilizando el editor de texto de tu preferencia. Por ejemplo, puedes usar nano con el siguiente comando:
sudo nano /etc/ssh/sshd_config
![Imagen](imgproyecto/ssh_nano.png)

### Reinicia el servicio SSH para que los cambios surtan efecto. Puedes hacerlo con el siguiente comando:
sudo service ssh restart

### Configura el acceso FTP en tu servidor. Para ello, edita el archivo de configuración del servidor FTP "vsftpd.conf" ubicado en "/etc/" utilizando el editor de texto de tu preferencia. Por ejemplo, puedes usar nano con el siguiente comando:
sudo nano /etc/vsftpd.conf
![Imagen](imgproyecto/confg_vsftpd.png)

### Reinicia el servicio FTP para que los cambios surtan efecto. Puedes hacerlo con el siguiente comando:
sudo service vsftpd restart

### Con estos pasos, ya has habilitado el acceso mediante SSH y FTP en tu servidor Ubuntu. Ahora puedes conectarte al servidor utilizando un cliente SSH o FTP desde otro equipo en la red utilizando la dirección IP del servidor y el puerto correspondiente (por defecto el puerto 22 para SSH y el puerto 21 para FTP). Recuerda que debes configurar la autenticación y la seguridad de los servicios SSH y FTP de acuerdo a tus necesidades y políticas de seguridad.
![Imagen](imgproyecto/ssh_activo.png)


## DNS

### Instalar BIND en servidores DNS
En ambos servidores DNS, ns1 y ns2, actualice la caché del paquete apt escribiendo lo siguiente: sudo apt-get update

Ahora instale BIND:sudo apt-get install bind9 bind9utils bind9-doc

### Configurar Bind para el modo IPv4
Antes de continuar, configuraremos BIND para el modo IPv4, ya que nuestra red privada utiliza IPv4 exclusivamente. En ambos servidores, edite la configuración predeterminada de bind9 escribiendo lo siguiente:
sudo nano /etc/default/bind9
![Imagen](imgproyecto/nano_bind.png)

Reinicie BIND para implementar los cambios:
sudo systemctl restart bind9

### Configurar el servidor DNS primario
En ns1, abra el archivo named.conf.options para editarlo:
sudo nano /etc/bind/named.conf.options
![Imagen](imgproyecto/dns1.png)

Y Tenemos que modificarlo para que nos quede asi:
![Imagen](imgproyecto/dns2.png)

En ns1, abra el archivo named.conf.options para editarlo:
sudo nano /etc/bind/named.conf.options
![Imagen](imgproyecto/dns2.png)
En ns1, abra el archivo named.conf.options para editarlo:
![Imagen](imgproyecto/dns3.png)

### Crearemos el directorio en el que se alojarán nuestros archivos de zona.

Según nuestra configuración de named.conf.local, esa ubicación debería ser /etc/bind/zones:
sudo mkdir /etc/bind/zones

Basaremos nuestro archivo de la zona de reenvío en el archivo de zona db.local de muestra. Cópielo a la ubicación adecuada con los siguientes comandos:
sudo cp /etc/bind/db.local /etc/bind/zones/db.nyc3.proyecto.com

Ahora, editaremos nuestro archivo de la zona de reenvío:
Y nos quedara algo así:
![Imagen](imgproyecto/dns6.png)

### Y para la zona inversa, lo mismo y tendremos algo asi
![Imagen](imgproyecto/dns7.png)

### Para comprobar la configuración de la zona de reenvío “nyc3.example.com”, ejecute el siguiente comando (cambie los nombres para que coincidan con su zona y archivo de reenvío).
![Imagen](imgproyecto/dns8.png)

### Reiniciamos BIND 
sudo systemctl restart bind9
Si configuró el firewall UFW, abra el acceso a BIND escribiendo lo siguiente:
sudo ufw allow Bind9



































































