#!/bin/bash
echo -e "Escolha a opcao"
echo -e "1 - AWS"
echo -e "2 - Local"
read OP


    

if [ $OP == "1" ] 
then
    echo -e "Setando as credencias"
    aws configure

    aws configure set region us-east-1

    Echo -e "Criando Bucket e Dynamo DB"
    #aws s3api create-bucket --bucket cahanovich --region us-east-1 --create-bucket-configuration LocationConstraint=us-east-1
    aws s3api create-bucket --bucket cahanovich2

    cd AWS
    terraform init --reconfigure
    terraform plan -lock=false
    #aws dynamodb create-table --table-name cahanovich --region us-east-1 --attribute-definitions AttributeName=name,AttributeType=S --key-schema AttributeName=name,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5

else
  echo -e "Configurando localmente"
  cd LOCAL/
  docker-compose up -d
fi
 
