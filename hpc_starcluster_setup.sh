#!/bin/bash

echo "StarCluster HPC cluster builder script by Carmine Spagnuolo, ISISLab Univerista' degli Studi di Salerno"
echo "This code is licensed under the terms of Apache 2.0 license"


echo "This script will configure your HPC cluster enviroment"
echo "If a currentconfiguration exits it will be OVERWRITTEN and dmasonclusterkey key files will be (re)created"
read -r -p "Are you sure? [y/N] " response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
then
    echo ""
else
    exit
fi


if [ ! -f credentials.csv ];then

    echo "Credentials.csv file not found"
    echo "In order to obtaint credentials.csv please follow the steps"
    echo "1. Go to https://console.aws.amazon.com/ "
	  echo "2. Select >IAM< in the >services< menu and go to >users<"
	  echo "3. Select an existing user or create a new one (please not that the user needs to have a permission to launch new EC2 instances)"
	  echo "4. Click >Manage Access Keys< and >Create Access Key<"
	  echo "5. Click >Download credentials< and save credentials.csv"
	  echo "6. Copy credentials.csv to your home directory $HOME and run the script again"
	  exit
fi

while IFS="," read f1 f2 f3 
do 
   echo "Reading credentials.csv $f1 $f2 $f3" 
done < credentials.csv

sudo apt-get update
sudo apt-get -y install build-essential python-dev python-setuptools mc libssl-dev libffi-dev
sudo easy_install StarCluster

mkdir ~/.starcluster

rm -f ~/.starcluster/config
cp config ~/.starcluster/config
#wget -P ~/.starcluster/ https://raw.githubusercontent.com/isislab-unisa/amazonhpc/master/config

uncomment() {
    sed -i "s/^# $1/$1/g" ~/.starcluster/config
}
setconfig() {
    sed -i "s/^#$1 /$1/g" ~/.starcluster/config
    sed -i "s#^\($1\s*=\s*\).*\$#\1$2#" ~/.starcluster/config	
}


setconfig AWS_ACCESS_KEY_ID $f2
setconfig AWS_SECRET_ACCESS_KEY $f3
setconfig AWS_USER_ID ${f1//\"/}


if [[ $(starcluster lk) =~ "isislabamazonhpckey" ]];then
  yes | starcluster removekey isislabamazonhpckey  
  yes | rm ~/.ssh/isislabamazonhpckey.rsa  
fi

starcluster createkey isislabamazonhpckey -o ~/.ssh/isislabamazonhpckey.rsa

echo HPC cluster setup completed. Now you can run 
echo starcluster start hpc_cluster_name 
