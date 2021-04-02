#!/bin/bash
#Create Resource Group
az group create --resource-group $FLASK_RESOURCE_GROUP --location $AZURE_LOCATION --tags webserver-env="Production"


#Create Service Plan and Web App
az webapp up -g $FLASK_RESOURCE_GROUP -n $FLASK_WEB_APP


#Create Variable Group
az pipelines variable-group create --name Variable_Group --authorize true --organization $ORGANIZATION_NAME --project $PROJECT_NAME --variables azureServiceConnectionId=$AZURE_SERVICE_CONNECTION_ID webAppName=$FLASK_WEB_APP vmImageName=$AGENT_VM_IMAGE_NAME environmentName=$ENVIRONMENT_NAME  pythonVersion=$PYTHON_VERSION


#Create Azure Pipeline
az pipelines create --name $PIPELINE_NAME --description $PIPELINE_DESCRIPTION --organization $ORGANIZATION_NAME --project $PROJECT_NAME --repository $REPO_NAME --branch master --repository-type github --yml-path azure-pipelines.yml 
