Connect-AzAccount

Get-AzSubscription -SubscriptionId "********-****-****-****-***********"

#Set some paramaters
$ResourceGroupName = 'PacktVMResourceGroup'
$vmName = 'PacktVM1'
$KeyVaultName = 'PacktEncryptionVault'

#Retrieve the Key Vault
$KeyVault = Get-AzKeyVault -VaultName $KeyVaultName -ResourceGroupName $ResourceGroupName
$diskEncryptionKeyVaultUrl = $KeyVault.VaultUri
$KeyVaultResourceId = $KeyVault.ResourceId

#Encrypt disk
Set-AzVMDiskEncryptionExtension `
    -ResourceGroupName $ResourceGroupName `
    -VMName $vmName `
    -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl `
    -DiskEncryptionKeyVaultId $KeyVaultResourceId

