# Práctica Docker

## Practica 2
### Ejecuta la imagen "hello-world"
![Imagen](imgproyecto/hello-world.png)
### Muestra las imágenes Docker instaladas
![Imagen](imgproyecto/docker-images.png)
### Muestra los contenedores Docker
![Imagen](imgproyecto/docker-ps.png)
### Edita el fichero Dockerfile
Si usamos una imagen de ubuntu y hacemos docker run -it ubuntu:20.04 obtendremos lo siguiente:
![Imagen](imgproyecto/docker-run-it.png)
Si consultamos para ver la versión de git nos sale:
![Imagen](imgproyecto/git-version.png)
Asi que procedemos a la instalacion de este paquete
![Imagen](imgproyecto/install-git.png)
Ahora dentro del dockerfille añadiremos lo siguiente
![Imagen](imgproyecto/docker-file.png)

### Construye el contenedor
Primero haremos lo siguiente
![Imagen](imgproyecto/docker-build.png)
Y ahora ejecutamos el container
![Imagen](imgproyecto/docker-run-container.png)
Y aqui podemos ver que esta funcionando
![Imagen](imgproyecto/nueva-terminal-ps-a.png)

### Create una cuenta en hub.docker.com
Para crearnos la cuenta accederemos a la pagina y seguiremos los pasos

### Publicar container
Para publicarlo seguirmos los siguientes pasos
![Imagen](imgproyecto/login-docker.png)
Seguido del login realizamos lo siguiente
![Imagen](imgproyecto/docker-tag-login.png)
Y ahora hacemos un push para subirlo
![Imagen](imgproyecto/docker-push.png)
Y ya podemos ver que esta subido
![Imagen](imgproyecto/hub-docker.png)
![Imagen](imgproyecto/subido.png)

## Práctica 3
### Descarga la imagen de ubuntu
![Imagen](imgproyecto/image-ubutnu-world.png)
### Descarga la imagen hello-world
![Imagen](imgproyecto/image-ubutnu-world.png)
### Descarga la imagen nginx
![Imagen](imgproyecto/docker-nginx.png)
### Listado de todas las imagenes
![Imagen](imgproyecto/docker-images.png)
### Ejecuta un contenedor hello-world y dale nombre “myhello1”, Ejecuta un contenedor hello-world y dale nombre “myhello2”, Ejecuta un contenedor hello-world y dale nombre “myhello3”
![Imagen](imgproyecto/myhello1-2-3.png)
### Muestra los contenedores que se estan ejecutando
![Imagen](imgproyecto/docker-ps-a.png)
### Para el contenedor myhello1 y myhello2
![Imagen](imgproyecto/docker-stop.png)
### Borra el contenedor myhello1
![Imagen](imgproyecto/docker-rm.png)
### Muestra los contenedores que se estan ejecutando
![Imagen](imgproyecto/docker-ps-a2.png)
### Borra todos los contenedores
![Imagen](imgproyecto/docker-eliminar-todo.png)
![Imagen](imgproyecto/docker-ps-a3.png)























































