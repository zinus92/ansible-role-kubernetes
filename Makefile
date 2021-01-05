
all: deps lint test-deploy

deps:
	python3 -m pip install --upgrade pip
	pip install ansible
	printf '[defaults]\nroles_path=../' > ansible.cfg

lint: deps
	ansible-playbook tests/test.yml -i tests/inventory --syntax-check

test-deploy: deps
	ansible-playbook -b tests/test.yml -i tests/inventory