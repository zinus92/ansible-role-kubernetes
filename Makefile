
all: deps lint test-deploy

deps:
	python -m pip install --upgrade pip
	pip install ansible
	printf '[defaults]\nroles_path=../' > ansible.cfg
	ansible-galaxy install indigo-dc.docker,v1.1.0-dodas-rc2

lint: deps
	ansible-playbook tests/test.yml -i tests/inventory --syntax-check

test-deploy: deps
	ansible-playbook -b tests/test.yml -i tests/inventory