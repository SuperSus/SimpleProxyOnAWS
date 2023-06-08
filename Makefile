init:
	docker run --rm -v $(shell pwd):/app -it sikorski88/simple-aws-proxy:latest terraform init
apply:
	docker run --rm -v $(shell pwd):/app -it sikorski88/simple-aws-proxy:latest terraform apply -auto-approve
destroy: 
	docker run --rm -v $(shell pwd):/app -it sikorski88/simple-aws-proxy:latest terraform destroy -auto-approve
state:
	docker run --rm -v $(shell pwd):/app -it sikorski88/simple-aws-proxy:latest terraform show
show:
	docker run --rm -v $(shell pwd):/app -it sikorski88/simple-aws-proxy:latest	terraform	output proxies
