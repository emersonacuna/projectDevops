# Usar una imagen base de PHP con Apache
FROM devopsedu/webapp:latest

# Establecer el directorio de trabajo en /var/www/html
WORKDIR /var/www/html

# Copiar los archivos del repositorio Git al contenedor
COPY ./website/ /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
