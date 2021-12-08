LOCATION='eastus'                          # Use 'az account list-locations --output table' to list locations
RESOURCE_GROUP_NAME='msdocs-python-webapp-quickstart'
APP_SERVICE_PLAN_NAME='msdocs-python-webapp-quickstart'    
APP_SERVICE_NAME='msdocs-python-webapp-quickstart-123'     # Change 123 to any three characters to form a unique name across Azure


# Create a resource group
az group create \
    --location $LOCATION \
    --name $RESOURCE_GROUP_NAME

# Create the app service plan
az appservice plan create \
    --name $APP_SERVICE_PLAN_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --sku B1 \
    --is-linux    

# Create the web app that hosts the app
az webapp create \
    --name $APP_SERVICE_NAME \
    --runtime 'PYTHON|3.8' \
    --plan $APP_SERVICE_PLAN_NAME \
    --resource-group $RESOURCE_GROUP_NAME \
    --query 'defaultHostName' \
    --output table