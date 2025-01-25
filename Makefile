.PHONY: all clean

help:
		cat Makefile


up:
		docker compose up -d

upb:
		docker compose up -d --build

down:
		docker compose down --remove-orphans

db:
		docker container exec -it db bash