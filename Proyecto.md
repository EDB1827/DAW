# Proyecto 1.er Trimestre

## Instalación del servidor apache y creacion de los dominios.
Actualizamos el software con un sudo apt update y seguido de ello, haremos un sudo apt install apache2 y ya tendríamos el servidor apache2 instalado.

Ahora crearemos los dominios.
Con sudo mkdir /var/www/html/centro_intranet y sudo mkdir /var/www/html/departamentos_centro_intranet

![Imagen](imgproyecto/apache1.PNG)

Introducimos el siguiente comando

![Imagen](imgproyecto/apache2.PNG)

Y una vez dentro tendrá que quedarnos algo tal que así
![Imagen](imgproyecto/apache3.PNG)

Reiniciamos el apache2 para aplicar los cambios
![Imagen](imgproyecto/apache4.PNG)

Y por último haremos lo siguiente

![Imagen](imgproyecto/apache5.PNG)


## Instalación de WordPress
Iniciamos sesión root en mysql

![Imagen](imgproyecto/word1.PNG)

Una vez que reciba la instrucción de MySQL, puede actualizar la contraseña del user root

Creamos la base de datos para WordPress con el siguiente comando

![Imagen](imgproyecto/word2.PNG)

Ahora reiniciamos el servidor y descargamos las extensiones necesarias para WordPress

![Imagen](imgproyecto/word3.PNG)

![Imagen](imgproyecto/word4.PNG)

Extraemos el archivo comprimido para así crear la estructura de directorios de WordPress

![Imagen](imgproyecto/word5.PNG)

Moveremos estos archivos a nuestro root de documentos por ahora. Antes de hacerlo, podemos añadir un archivo ficticio .htaccess de modo que esté disponible para que 
WordPress lo use más adelante. Creamos el archivo con touch, Copiaremos sobre el archivo de configuración de muestra al nombre de archivo que lee WordPress. También podemos crear el directorio de actualización

![Imagen](imgproyecto/word6.PNG)

Seguido de lo anterior, realizaremos los ajustes de propiedad y permisos

![Imagen](imgproyecto/word7.PNG)

A continuación, abriremos el archivo de configuración de WordPress

![Imagen](imgproyecto/word8.PNG)

Y ahora introduciremos lo siguiente

![Imagen](imgproyecto/word9.PNG)

Y finalmente escribiendo en el navegador http://centro.intranet debería salir la siguiente imagen

![Imagen](imgproyecto/word10.PNG)

![Imagen](imgproyecto/word11.PNG)


## Módulo WSGI
Iniciamos con el siguiente comando

![Imagen](imgproyecto/ws1.PNG)

![Imagen](imgproyecto/ws2.PNG)

![Imagen](imgproyecto/ws3.PNG)

Damos los permisos

![Imagen](imgproyecto/ws4.PNG)

![Imagen](imgproyecto/ws5.PNG)

![Imagen](imgproyecto/ws6.PNG)

![Imagen](imgproyecto/ws7.PNG)

Y en el navegador ponemos la ruta http://centro.intranet.wsgi

![Imagen](imgproyecto/ws8.PNG)

## Aplicación Python
![Imagen](imgproyecto/ws8.PNG)

## Proteger aplicación Python con creedenciales
nstalamos el paquete de apache2-utils

apt-get install apache2 apache2-utils

Creamos un nuevo usuario y almacenamos la contraseña en el fichero .htpasswd, la contraseña sera usuario

htpasswd -c /etc/apache2/.htpasswd usuario

Entramos en el fichero de configuracion 000-default.conf

nano /etc/apache2/sites-enabled/000-default.conf

Le añadimos las siguentes lineas

![Imagen](imgproyecto/py1.PNG)

Y tendriamos lo siguiente

![Imagen](imgproyecto/py2.PNG)

Guardamos los cambios realizados y reiniciamos apache2

service apache2 restart

Entramos en nuestra pagina donde nos pedira que insertemos la contraseña

![Imagen](imgproyecto/py3.PNG)

Si la ponemos mal nos prohibira entrar con el siguente mensaje

![Imagen](imgproyecto/py4.PNG)


## Instala y configura AWStats
Instalamos AWStats

![Imagen](imgproyecto/aw.PNG)

Habilitamos módulo CGI en Apache

![Imagen](imgproyecto/aw2.PNG)

Configuramos AWStats

![Imagen](imgproyecto/aw3.PNG)

![Imagen](imgproyecto/aw4.PNG)

![Imagen](imgproyecto/aw5.PNG)

![Imagen](imgproyecto/aw6.PNG)

![Imagen](imgproyecto/aw7.PNG)

![Imagen](imgproyecto/aw8.PNG)

Después de estos cambios, se necesita construir sus estadísticas iniciales que se generarán a partir de los registros actuales en su servidor. Puede hacerlo utilizando

![Imagen](imgproyecto/aw9.PNG)

![Imagen](imgproyecto/aw10.PNG)

Configuramos Apache para AWStats
 
![Imagen](imgproyecto/apw1.PNG)
 
Ahora para acceder AWSTATS ponemos http://centro.intranet/cgi-bin/awstats.pl?config=centro.intranet.
 
![Imagen](imgproyecto/apw2.PNG)


## Instala un segundo servidor (nginx)
Instalamos mysql

![Imagen](imgproyecto/phpm1.PNG)

![Imagen](imgproyecto/phpm2.PNG)

![Imagen](imgproyecto/phpm3.PNG)

Creamos la base de daros y al usuario le damos todos los permisos

![Imagen](imgproyecto/phpm4.PNG)

Descargamos el paquete phpmyadmin

![Imagen](imgproyecto/phpm5.PNG)

![Imagen](imgproyecto/phpm6.PNG)

Instalamosel servidor web Nginx y todos los paquetes necesarios

![Imagen](imgproyecto/phpm7.PNG)

![Imagen](imgproyecto/phpm8.PNG)

![Imagen](imgproyecto/phpm9.PNG)

Editamos el archivo de conmfiguración denominador: PHP.Ini

![Imagen](imgproyecto/phpm10.PNG)

![Imagen](imgproyecto/phpm11.PNG)

Habilitamos y configuramos los siguientes elementos del archivo de configuración PHP

![Imagen](imgproyecto/phpm12.PNG)

Editamos el archivo de configuración de Nginx para el sitio we predeterminado

![Imagen](imgproyecto/phpm13.PNG)

habilitamos el soporte PHP pata Nginx

![Imagen](imgproyecto/phpm14.PNG)

Introducimos el siguiente comando

![Imagen](imgproyecto/phpm15.PNG)

Reiniciamos

![Imagen](imgproyecto/phpm16.PNG)

Ahora creamos los directorios necesarios y les damos permisos

![Imagen](imgproyecto/phpm17.PNG)

![Imagen](imgproyecto/phpm18.PNG)

Creamos este archivo

![Imagen](imgproyecto/phpm19.PNG)

Y lo editamos con nano  /var/www/html/phpmyadmin/config.inc.php

![Imagen](imgproyecto/phpm20.PNG)

Y ya por último utilizaremos el siguiente comando para generar la clave aleatoria utilizada en el parámetro denominado: openssl rand -base64 32.

![Imagen](imgproyecto/phpm21.PNG)









































