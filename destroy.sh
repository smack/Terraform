#! /bin/bash

while [[ "$#" > "0" ]]
do
  case $1 in

        NAME=*)
        NAME="${1#*=}";;

  esac
shift
done

file="terraform.tfstate_$NAME"

if [ -f "states/$file" ]; then
	mv -f states/$file terraform.tfstate
	terraform destroy -target=aws_instance.w -auto-approve
	mv terraform.tfstate states/$file"_deleted"
else 
	echo No such state found, Verify the Instance name
fi

