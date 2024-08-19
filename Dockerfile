# Image base to be used
FROM php:8.2-apache

# Copy the files to the work directory
COPY ./website/ /var/www/html/

# Give the proper permissions to the files
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Command by default to initiate Apache
CMD ["apache2-foreground"]
