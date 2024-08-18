# Usar una imagen base de PHP con Apache
# FROM devopsedu/webapp:latest
FROM php:8.2-cli

# Establecer el directorio de trabajo en /var/www/html
# WORKDIR /var/www/html
WORKDIR /usr/src/myapp

# Copiar los archivos del repositorio Git al contenedor
# COPY ./website/ /var/www/html/
COPY ./website/ /usr/src/myapp/

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto para iniciar Apache en primer plano
# CMD ["apache2ctl", "-D", "FOREGROUND"]
CMD [ "php", "./index.php" ]
