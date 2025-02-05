.PHONY: all clean

help:
		cat Makefile

up:
		docker compose up -d


up-v1:
		docker-compose up -d

upb:
		docker compose up -d --build

upb-v1:
		docker-compose up -d --build

down:
		docker compose down --remove-orphans

bidb:
		docker container exec -it bidb mysql -ustaff -p bidb

mbdb:
		docker container exec -it mbdb psql -U staff -d mbdb

restore:
		bash ./db_restore.sh