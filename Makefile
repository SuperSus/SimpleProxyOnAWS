apply:
	terraform apply -auto-approve
destroy: 
	terraform destroy -auto-approve
state:
	terraform show
show_proxies:
	terraform	output proxies
