install:
		sh bin/install.sh

ps:
		docker-compose ps

up:
		docker-compose up -d

bash:
		docker exec -ti symfony_websocket sh

stop:
		docker-compose stop

restart: stop up

build-dev:
	    docker exec symfony_websocket chown -R www-data: var/
		docker exec symfony_websocket sh -c 'composer install'
		docker exec symfony_websocket sh -c 'symfony console assets:install public'
		docker exec symfony_websocket sh -c 'symfony console doctrine:schema:update --force'
		docker exec symfony_websocket sh -c 'symfony console cache:clear'
		docker exec symfony_websocket sh -c 'npm install'
		docker exec symfony_websocket sh -c 'npm start'