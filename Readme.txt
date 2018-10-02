To create a Instance 

Install Terraform:
---------------------------
wget https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
unzip terraform_0.11.8_linux_amd64.zip
sudo mv terraform /usr/local/bin/
terraform --version 


Prequisits:
-----------------------
git clone the directory and execute "terrform init"

1) Generate a key pair from your AWS account portal and download a copy of PEM file in ssh/ folder
2) update the default key_name in variable.tf with name of your pem file
	variable "key_name" {
	  description = "Key name for SSHing into EC2"
	  default = "<your PEM file name with out extension>"
	}
3) Generate the AWS access and secret access key. Then add the AWS access and secret key in your /root/.bashrc
	export TF_VAR_aws_access_key="<your account access key>"
	export TF_VAR_aws_secret_key="<you account secret access key>" 
4) source the .bashrc file using
	source /root/.bashrc
5) To create the new instance use
	./wrapper NAME=<NAME OF INASTANCE> SIZE=<EC2 Instance size e,g, t2.micro> REGION=<region name e.g, ap-south-1>
	note: it will launch only Ubuntu instance 
6) To destroy the created instance
	./destory NAME=<Name of created isntance>
