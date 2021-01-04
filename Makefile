
all: deps test-syntax test-deploy

deps:
	pip install ansible
	printf '[defaults]\nroles_path=../' > ansible.cfg

test-syntax:
	ansible-playbook tests/test.yml -i tests/inventory --syntax-check

test-deploy:
	ansible-playbook tests/test.yml -i tests/inventory