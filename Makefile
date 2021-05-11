play:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook main.yaml -i inventory

copy_ssh:
	rm -rf ~/.ssh/known_hosts
	cp .vagrant/machines/cicd/virtualbox/private_key ~/.ssh/cicd_key
	chmod 600 ~/.ssh/cicd_key


