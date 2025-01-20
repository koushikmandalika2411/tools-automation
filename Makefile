infra:
	git pull
	terraform init
	terraform apply -auto-approve -var ssh_username=koushik -var ssh_password=Koushik@123456
	## Username and Password should not be hardcoded, Here we just hardcoding because to avoid the passing of input. This needs to be parsed as input in real time

ansible:
	git pull
	ansible-playbook -i $(tool_name)-internal.azdevops.shop, tool-setup.yml -e ansible_user=koushik -e ansible_password=Koushik@123456 -e tool_name=$(tool_name)
	## Username and Password should not be hardcoded, Here we just hardcoding because to avoid the passing of input. This needs to be parsed as input in real time

# Done with Vault Successfully