+++
title = "Criar security groups adicionais"
weight = 10
+++


### Crie security groups para sua VPC

A partir da **AWS Console**, vá até **Services** e selecione **VPC**. No painel à esquerda, clique em **Security Groups** na seção Security e então **Create security group**.

Entre os seguintes parâmetros para o **Security group** (repita os passos para criar todos os security groups, como na tabela abaixo).


| Nome do Security group     | Descrição      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Sua VPC criada anteriormente (ex. TargetVPC)  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| Sua VPC criada anteriormente (ex. TargetVPC))  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | Sua VPC criada anteriormente (ex. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)





### Edite e configure os security groups

Uma vez que os security groups foram craidos, selecione um a um deles e clique em **Inbound Rules** e então **Edit rules**. Você adicionará  rules para cada security group como abaixo:

#### 1. Inbound rules do LB-SG 

Adicione acesso HTTP e HTTPS a partir de qualquer lugar para permitir que os usuários acessem o website.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. Inbound rules do ECS-Tasks-SG 

Permitir comunicação entre o Load Balancer e as ECS Tasks.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. Inbound rules do EFS-SG 

Permite comunicação entre ECS Tasks e o Amazon EFS. O acesso ao Webserver para o EFS é habilitado temporariamente, de forma a montar o volume EFS e copiar os arquivos estáticos da aplicação web (você o removerá mais tarde).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Modifique o security group do banco de dados

Modifique o security group (DB-SG) do banco de dados para permitir a porta TCP port 3306 (MySQL port) de entrada a partir do ECS-Tasks-SG e do ECS-SG – permitindo assim a comunicação entre as ECS Tasks e o banco de dados destino.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
