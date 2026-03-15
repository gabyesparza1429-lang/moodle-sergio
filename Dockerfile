# Usamos la imagen oficial de Moodle, que es muy estable
FROM moodle:latest

# Exponemos el puerto que Railway necesita
EXPOSE 8080

# Comando para iniciar Moodle
CMD ["apache2-foreground"]
