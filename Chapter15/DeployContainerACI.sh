#Create a resource group
az group create \
	--name PacktACIResourceGroup \
	--location eastus

#Create a container
az container create \
	--resource-group PacktACIResourceGroup \
	--name packtcontainer \
	--image mcr.microsoft.com/azuredocs/aci-helloworld \
	--dns-name-label packt-aci-demo \
	--ports 80

#Show status of container
az container show \
	--resource-group PacktACIResourceGroup \
	--name packtcontainer \
	--query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState}" \
	--out table