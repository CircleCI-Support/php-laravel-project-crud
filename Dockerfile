FROM cimg/php:8.2.12
RUN sudo apt update && sudo apt install -y wget
RUN ls -al /home/circleci/project
COPY . /app
RUN sudo cp /app/.env.example /app/.env
WORKDIR /app

COPY . /app/
COPY composer.json composer.lock /app/
RUN sudo mkdir -p vendor
RUN sudo composer update

RUN sudo composer install -n --prefer-dist


RUN sudo php artisan key:generate
RUN sudo php artisan cache:clear
RUN sudo php artisan config:clear
RUN sudo php artisan view:clear
