#! /bin/bash

while [[ "$#" > "0" ]]
do
  case $1 in

        NAME=*)
        NAME="${1#*=}";;

        REGION=*)
        REGION="${1#*=}";;

#        AMI=*)
#        AMI="${1#*=}";;

        SIZE=*)
        SIZE="${1#*=}";;


  esac
shift
done


file="terraform.tfstate"

if [ $REGION == ap-south-1 ]; then
        AMI="ami-04ea996e7a3e7ad6b"
elif [ $REGION == us-east-1 ]; then
        AMI="ami-059eeca93cf09eebd"
elif [ $REGION == us-east-2 ]; then
        AMI="ami-0782e9ee97725263d"
elif [ $REGION == us-west-1 ]; then
        AMI="ami-0ad16744583f21877"
elif [ $REGION == us-west-2 ]; then
        AMI="ami-0e32ec5bc225539f5"
else
        echo -e "\tplease use only one of these regions: us-east-1 us-east-2 us-west-1 us-west-2 ap-south-1\n"
        exit 1
fi


NAME_VAR=`cat instance.tf | grep Name | cut -f2 -d "="`
sed -i "s/$NAME_VAR/ \"$NAME\"/g" instance.tf

REGION_VAR=`cat variables.tf | grep -m1 default | tail -n 1 | cut -f 2 -d "="`
sed -i "s/$REGION_VAR/ \"$REGION\"/g" variables.tf

AMI_VAR=`cat variables.tf | grep -m2 default | tail -n 1 | cut -f 2 -d "="`
sed -i "s/$AMI_VAR/ \"$AMI\"/g" variables.tf

SIZE_VAR=`cat variables.tf | grep -m3 default | tail -n 1 | cut -f 2 -d "="`
sed -i "s/$SIZE_VAR/ \"$SIZE\"/g" variables.tf
terraform plan
terraform apply -auto-approve

if [ -f "$file" ]; then
        mkdir -p states
        mv $file states/terraform.tfstate_$NAME
fi
