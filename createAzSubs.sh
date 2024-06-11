az config set extension.use_dynamic_install=yes_without_prompt
az extension add --name account 
az extension add --name alias
#get the billing account
billingAccountJson=$(az billing account list --query "[0]")
billingAccountName=$(echo $billingAccountJson | jq -r '.name')
billingProfileJson=$(az billing profile list --account-name $billingAccountName --expand "InvoiceSections" --query "[0]")
billingScope=$(echo $billingProfileJson | jq -r '.invoiceSections.value[0].id')
#create  new subscription(s)
subnames=("management" "security")
for subname in "${subnames[@]}"; do
    az account alias create --name "$subname" --billing-scope "$billingScope" --display-name "$subname" --workload "Production"
    sleep 60
    subId=$(az account show --subscription "$subname" --query 'id' -o tsv)
    echo "Subscription $subname has been created with ID $subId"
done

