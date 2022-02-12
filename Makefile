# start

start:
	@docker-compose up -d

start/service:
	@docker-compose up -d $(service)

start/serverx:
	@make start/service service=serverx

# stop

stop:
	@docker-compose down

stop/service:
	@docker-compose stop $(service)

stop/serverx:
	@make stop/service service=serverx

# status

status:
	@docker-compose ps

resources:
	@docker stats temp_test-serverx-1 --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}\t{{.NetIO}}\t{{.BlockIO}}"

# logs

logs/service:
	@docker-compose logs -f $(service)

logs/serverx:
	@make logs/service service=serverx

# tests

test:
	@ab -p tests/body.json -T application/json -s 1 -c 2 -n 50 http://localhost:4000/
