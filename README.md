# Overview

By this project, you will be able to provision Azure Machine Learning Web App and building your CI-CD pipeline which can build, test and deploy your code on your App Service with every commit

## Project Plan

Time Plan: https://trello.com/b/2aGm0TKm/azure-ml-ci-cd-project

Schedule Plan: https://1drv.ms/x/s!AieojtnBJDhtgo0KQYft8WfcndX6Rg?e=HNHRYo

## Instructions
Architectural Diagram
<img width="1362" alt="Screen Shot 2021-04-02 at 2 20 46 PM" src="https://user-images.githubusercontent.com/22683614/113415237-137e1a00-93bf-11eb-8a09-4e2f2dc395bf.png">


Output of a CI-CD Pipeline Stages and Jobs


<img width="683" alt="Screen Shot 2021-04-02 at 8 36 17 PM" src="https://user-images.githubusercontent.com/22683614/113443911-23afec80-93f3-11eb-9b9d-c91be969e90f.png">

## Steps 
1. Clone your repo
git clone https://github.com/AymanZahran/Azure_CI-CD_MachineLearningApp/
2. Prepare your Environment Well
- Make sure to prepare your environment by modify the .env file. Unfortunately, I will not be able to upload that file in the Repo since it has my Credentials but instead I have uplaod the env.example file as a template. Feel free to modify it with your credentials as bellow
AZURE_SUBSCRIPTION_ID="Put your subscription ID here"
AZURE_LOCATION="Put your Azure Location here"
AZURE_SERVICE_CONNECTION_ID="Put your Azure Service Connection here"

FLASK_RESOURCE_GROUP="production-resources"
FLASK_WEB_APP="flask-sklearn"
PIPELINE_NAME="Azure_CI-CD_MachineLearningApp-Pipeline"
PIPELINE_DESCRIPTION="Azure_CI-CD_MachineLearningApp-Pipeline"
ORGANIZATION_NAME="https://dev.azure.com/put-your-organization-name-here"
PROJECT_NAME="put your project name here"
REPO_NAME="https://github.com/your-git-username/your-git-repo"

AGENT_VM_IMAGE_NAME="ubuntu-latest"
ENVIRONMENT_NAME="flask-sklearn"
PYTHON_VERSION="3.7"

3.make Automate
- What make Automate will do is gives exeuctre permission to the run_azure.sh script and run it
- run_azure.sh script will do the following:
   1. Create Resource Group
        az group create --resource-group $FLASK_RESOURCE_GROUP --location $AZURE_LOCATION --tags webserver-env="Production"

   2. Create Service Plan and Web App
      az webapp up -g $FLASK_RESOURCE_GROUP -n $FLASK_WEB_APP
      That is a great way from azure to build an Azure Service Plan, Web App and deploy your code in one step

   3. Create Variable Group
      az pipelines variable-group create --name Variable_Group --authorize true --organization $ORGANIZATION_NAME --project $PROJECT_NAME --variables            azureServiceConnectionId=$AZURE_SERVICE_CONNECTION_ID webAppName=$FLASK_WEB_APP vmImageName=$AGENT_VM_IMAGE_NAME environmentName=$ENVIRONMENT_NAME  pythonVersion=$PYTHON_VERSION
      In this step you will upload your Environment Variables on Microsoft Azure DevOps in a Variable Groups. Which is configured in the azure-pipelines.yml file to use this Variable Group.

    4. Create Azure Pipeline
az pipelines create --name $PIPELINE_NAME --description $PIPELINE_DESCRIPTION --organization $ORGANIZATION_NAME --project $PROJECT_NAME --repository $REPO_NAME --branch master --repository-type github --yml-path azure-pipelines.yml 
      This is an automated way to create your Azure Pipeline using Azure CLI

4. Once the pipeline has been deployed, it is automated in and will listen for every commit from Github to re-build, re-test and re-deploy the code into your Azure Web Service

## Logs
Successful prediction from deployed flask app in Azure Cloud Shell.


 ~/Azure_CI-CD_MachineLearningApp # ./make_predict_azure_app.sh 
Port: 443
{"prediction":[20.35373177134412]}
 ~/Azure_CI-CD_MachineLearningApp # 

Output of streamed log files from deployed application
1. Deploying the Code on the App Service
<img width="1372" alt="Screen Shot 2021-04-02 at 8 38 47 PM" src="https://user-images.githubusercontent.com/22683614/113444116-8b663780-93f3-11eb-822f-30db570eaf12.png">


2. Calling the POST API call 
<img width="1309" alt="Screen Shot 2021-04-02 at 8 40 18 PM" src="https://user-images.githubusercontent.com/22683614/113444178-a9339c80-93f3-11eb-96b0-dbbfd96fc52d.png">


## Enhancements

This project could be improved by:
1. Using Terraform to build your infrastructure on azure instead of Azure CLI since Terraform is idempotent
2. Use more build jobs such as building Docker Images on Azure Container Registery (ACR), building Kubernetes namespaces and clusters 
3. Deploying your code on your Kubernetes Cluster

## Demo 

<TODO: Add link Screencast on YouTube>

## References
Check Microsoft Documentation for using CI/CD to deploy a Python web app to Azure App Service on Linux
https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops

Check Udacity Flask Starter Code
https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/tree/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn

Create your Azure Service connections
https://docs.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml





