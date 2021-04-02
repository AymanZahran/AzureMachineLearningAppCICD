Automate:
	chmod 777 run_azure.sh && bash run_azure.sh

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203 app.py

all: install lint 
