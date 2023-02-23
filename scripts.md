----SCRIPT----

- Crear usuario de phpmyadmin 
CREATE USER 'PMAUSER'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON . TO 'PMAUSER'@'localhost';

----SCRIPT----

-Crear alojamiento web

mkdir /var/www/[nombre]

touch /var/www/[nombre]/index.html

echo [contenido.html] >> /var/www/[nombre]/index.html

- Crear usuario de phpmyadmin 
- 
CREATE USER 'PMAUSER'@'localhost' IDENTIFIED BY '12345';

GRANT ALL PRIVILEGES ON . TO 'PMAUSER'@'localhost';
-FTP

sudo adduser [nombre_de_usuario]

sudo service vsftpd restart

[contenido] = <!DOCTYPE html><html><head><title>Bienvenido a mi sitio web</title></head><body><p>Esta es mi página de bienvenida por defecto.</p></body></html>

----SCRIPT----

echo "$user.localnet.net.   IN   A   [ip]" > /etc/bind/db.localnet.net

----SCRIPT----

DNS inverso

echo "43      IN      PTR      $user.localnet.net." >> /etc/bind/db.1.168.192

systemctl reload bind9
