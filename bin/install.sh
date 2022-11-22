#!/bin/bash

# build docker compose
docker-compose up --force-recreate --build -d

docker exec symfony-leboncoin sh -c 'composer install'
docker exec symfony-leboncoin sh -c 'symfony console assets:install public'

docker exec symfony-leboncoin sh -c 'symfony console doctrine:database:create --if-not-exists'
docker exec symfony-leboncoin sh -c 'symfony console cache:clear'

docker exec symfony-leboncoin sh -c 'chown -Rf www-data: var/'
docker exec symfony-leboncoin sh -c 'symfony console d:s:u --force'
docker exec symfony-leboncoin sh -c 'symfony console d:f:l --append'

docker exec symfony-leboncoin sh -c 'npm install'
#docker exec symfony-leboncoin sh -c 'npm run watch'