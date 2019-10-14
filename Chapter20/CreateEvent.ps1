#First, we need to login to the Azure account:
Connect-AzAccount

#If necessary, select the right subscription:
#Get-AzSubscription -SubscriptionId "********-****-****-****-***********"

	
Get-AzSubscription -SubscriptionId "60ad227c-01b2-4da3-ac97-43e704fdba0c"


#Get a reference to the endpoint and the key
$endpoint = (Get-AzEventGridTopic -ResourceGroupName `
            PackEventGridResourceGroup `
            -Name PacktEventGridTopic).Endpoint

$keys = Get-AzEventGridTopicKey `
        -ResourceGroupName PackEventGridResourceGroup `
        -Name PacktEventGridTopic

#create a random event Id
$eventID = Get-Random 99999

#Date format should be SortableDateTimePattern (ISO 8601)
$eventDate = Get-Date -Format s

#Construct body using Hashtable
$htbody = @{
    id= $eventID
    eventType="recordInserted"
    subject="myapp/packtpub/books"
    eventTime= $eventDate
    data= @{
        title="Microsoft Azure Architect Technologies"
        eventtype="Ebook"
}
dataVersion="1.0"
}
#Use ConvertTo-Json to convert event 
#body from Hashtable to JSON Object.
#Append square brackets to the converted JSON payload 
#since they are expected in the event's JSON payload syntax

$body = "["+(ConvertTo-Json $htbody)+"]"
Invoke-WebRequest -Uri $endpoint -Method POST -Body $body -Headers
@{"aeg-sas-key" = $keys.Key1}