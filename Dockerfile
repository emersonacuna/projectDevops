# Usar una imagen base de PHP con Apache
# FROM devopsedu/webapp:latest
FROM php:8.2-apache

# Establecer el directorio de trabajo en /var/www/html
# WORKDIR /var/www/html

# Copiar los archivos del repositorio Git al contenedor
COPY ./website/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Comando por defecto para iniciar Apache en primer plano
# CMD ["apache2ctl", "-D", "FOREGROUND"]
CMD ["apache2-foreground"]
