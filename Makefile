up:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up --build
down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
