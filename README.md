# PAGARME

Este reposotório foi criado com o intuito de passar no teste seletivo da Stone

## Configurações Iniciais

Primeiramente deve baixar o repositorio utilizando os comandos git

git clone https://github.com/rodrigocahanovich/pagarme.git

Logo após devemos acessar a pasta onde o mesmo se encontra via bash

Para o funcionamento dos Scripts precisamos ter instalado os seguintes componentes:
 - Terraform (https://developer.hashicorp.com/terraform/downloads)
 - AWS CLI (https://docs.aws.amazon.com/pt_br/cli/latest/userguide/getting-started-install.html)
 - Docker (https://docs.docker.com/engine/install/)
 - Docker-Compose (https://docs.docker.com/compose/install/standalone/)

## Para funcionar

Deve primeiro baixar o repo, e dependendo do SO dar permissões no arquivo 
Script.sh (chmod a+x Script.sh)

Ao executar deve ser selecionar a opção 1 para AWS ou 2 para Remoto

A OPÇÂO 2 ele irá instalar as ferramentas do Docker e outros, e rodar o compose na pasta local, configurando o DBEAVER, com MYSQL e POSTGRES onde você poderá acessar ele localmente pela URL localhost:8080

Ao fazer as configurações iniciais do DBEAVER de usuário e senha você pode adicionar os bancos que também subiram via docker (ou qualquer outro banco), informando o IP (nesse caso da sua máquina), usuário senha e nome da DB

DATABASE: app_db
USER: db_user
PASSWORD: db_user_pass

A OPÇÂO 1 ele irá instalar as ferramentas de terraform e aws cli, pedindo as KEYs da AWS para ele criar um Bucket e assim configurar uma nova VPC, submet, RouteTable e uma EC2 subindo automaticamente o compose

Na finalização da máquina você pode acessar o console da EC2 procurando uma máquina chamada Cahanovich, e acessando ela pelo IPPUBLICO:8080 fará o mesmo procedimento mencionado na opção 2 do Dbeaver com MYSQL e POSTGRES. E também pode acessar outras máquinas caso tenha peering na VPC ou nas mesma VPC tenha outros RDS

