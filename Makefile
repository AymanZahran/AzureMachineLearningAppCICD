setup:
	python3 -m venv ~/.udacity-devops

setup_azure:
	bash run_azure.sh

setup_docker:
	bash run_docker.sh

setup_kubernetes:
	bash run_kubernetes.sh

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203 app.py

all: install lint test
