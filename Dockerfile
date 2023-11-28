FROM cimg/php:8.2.12
RUN sudo apt update && sudo apt install -y wget
RUN ls -al /home/circleci/project
COPY . /app

# Here we copy the example .env file to the real .env file 
# so that we can run the php artisan commands without 
# actually sharing env to the container - these should 
# have been uploaded via script locally

RUN sudo cp /app/.env.example /app/.env
WORKDIR /app
COPY composer.json composer.lock /app/
RUN sudo mkdir -p vendor
RUN sudo composer update

RUN sudo composer install -n --prefer-dist


RUN sudo php artisan key:generate
RUN sudo php artisan cache:clear
RUN sudo php artisan config:clear
RUN sudo php artisan view:clear
