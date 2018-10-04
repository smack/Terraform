AIM : Use Terraform to Provision AWS infrastructure and Ansible to manage the provisioned infrastructure.


Install Terraform:
---------------------------
wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version 

Install Ansible
---------------------
yum -y install ansible

Upgrade Ansible
------------------------
pip install --upgrade ansible

Prequisits:
-----------------------
git clone the directory and execute "terrform init"

1) Generate a key pair using ssh-keygen on your host. The Default location of key pair is in ~/.ssh/
2) Update the key path in key.tf file
3) Generate the AWS access and secret access key. Then add the AWS access and secret key in your /root/.bashrc
	export TF_VAR_aws_access_key="<your account access key>"
	export TF_VAR_aws_secret_key="<you account secret access key>" 
4) source the .bashrc file using
	source /root/.bashrc
5) To launch the new EC2 infrastructure use 
	./wrapper NAME=<NAME OF INASTANCE> SIZE=<EC2 Instance size e,g, t2.micro> REGION=<region name e.g, ap-south-1>
	note: it will launch only Ubuntu instance and only the regions mentioned in wrapper.sh
6) The above script will spin up the AWS infrastruecture (EC2, securoty group, keypair) and add the public IP address of EC2 instance with ansible varaibles in ansible inventory at /etc/ansible/hosts
	note: The EC2 instance has ubuntu16.04 and by default it uses python3. so the instance might not respond to ansible controller and return an error.
		Our wrapper scripts handels this situation by using ansible_python_interpreter varaible. 
		Ref - https://docs.ansible.com/ansible/2.6/reference_appendices/python_3_support.html

	note: By default ansible has hostkey checking enabled. So, it asks to accept the key first time when you try connecting ansible controller to newly deployed EC2 instance. This can be handeled by updating the /etc/ansible/ansible.cfg file.
		Ref - https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html#host-key-checking
	
7) To destroy the created AWS Infrastructure
	./destory NAME=<Name of created instance>

	note: This script tatkes care of updating the ansible inventory after deleting the EC2 instance
