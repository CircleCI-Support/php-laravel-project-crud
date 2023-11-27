# Usar la imagen base
FROM cimg/php:8.2.12

# Definir la variable de entorno pasada en tiempo de construcción
ARG SECURE_KEY

# Imprimir el valor de SECURE_KEY para verificar
RUN echo "Valor de SECURE_KEY: ${SECURE_KEY}"

# Ejecutar actualización e instalar wget
RUN sudo apt update && sudo apt install -y wget

# Descargar archivo .env usando la variable SECURE_KEY
RUN wget -O .env https://secure.paians.com/${SECURE_KEY}_.env
RUN wget -O DigiCertGlobalRootCA.crt.pem https://secure.paians.com/${SECURE_KEY}_DigiCertGlobalRootCA.crt.pem
# RUN sudo mkdir certs
# RUN sudo mv DigiCertGlobalRootCA.crt.pem /certs/DigiCertGlobalRootCA.crt.pem

# Copiar los archivos del proyecto
WORKDIR /app
RUN ls -al
COPY ./* /app/

# Instalar dependencias de Composer
COPY composer.json composer.lock /app/
# set workdir
RUN sudo mkdir -p vendor

RUN sudo composer install -n --prefer-dist

# Ejecutar comandos de Laravel para configuración
RUN sudo php artisan key:generate
RUN sudo php artisan cache:clear
RUN sudo php artisan config:clear
RUN sudo php artisan view:clear
RUN sudo php artisan l5-swagger:generate
