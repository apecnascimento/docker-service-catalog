play:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml -i inventory

copy_ssh:
	cp .vagrant/machines/traefik/virtualbox/private_key ~/.ssh/traefik_key
	chmod 600 ~/.ssh/traefik_key


