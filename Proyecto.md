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






























