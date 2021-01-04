
all: deps test-syntax test-deploy

deps:
	pip install ansible
	printf '[defaults]\nroles_path=../' > ansible.cfg
	ansible-galaxy install indigo-dc.docker

test-syntax:
	ansible-playbook tests/test.yml -i tests/inventory --syntax-check

test-deploy:
	ansible-playbook tests/test.yml -i tests/inventory