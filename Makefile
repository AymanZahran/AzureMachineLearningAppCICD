Preparing-Environment:
	chmod +x setENV.sh && bash setENV.sh

Automate:
	chmod 777 run_azure.sh && bash run_azure.sh

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203,W0702 app.py

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

all: install lint test
