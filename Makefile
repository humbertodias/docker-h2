build:
	docker build . -t h2:latest
run:
	docker run -p 8082:8082 -p 9092 h2
tag:
	docker tag h2:latest hldtux/h2:latest
push:	
	docker push hldtux/h2:latest
