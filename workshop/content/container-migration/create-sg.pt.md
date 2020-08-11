+++
title = "Criar security groups adicionais"
weight = 10
+++


### Crie security groups para sua VPC

A partir da **AWS Console**, vá até **Services** e selecione **VPC**. No painel à esquerda, clique em **Security Groups** na seção Security e então **Create security group**.

### 1. Crie um security group Load balancer 

Entre os seguintes parâmetros para o **Security group** 


| Nome do Security Group     | Descrição      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | TargetVPC  |

![create-lb-sg](/ecs/create-lb-sg.png)

Role a tela para baixo e na seção **Inbound rules** adicione acesso HTTP e HTTPS a partir de qualquer lugar (**Anywhere**) para permitir que os usuários acessem o website.

| Tipo    | Protocolo      								   | Origem            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

Clique no botão **Create security group** para criar o security group.

#### 2. Crie o security group do Elastic Container Service Task  

Vá para a tela **Security Groups**, clique no **Create security group** e entre o seguinte:

| Nome do Security Group     | Descrição      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Permite comunicação entre o LB e o ECS Tasks| TargetVPC  |

Role a tela até **Inbound rules** e permita a comunicação entre o Load Balancer e os ECS Tasks (selecione o LB-SG security group da lista de **Source**).

| Tipo    | Protocolo      								   | Origem            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Clique no botão **Create security group** para criar o security group.

#### 3. Crie o security group do Elastic File System 

Vá para a tela **Security Groups**, clique em **Create security group** e entre o seguintes valores.

| Nome do Security Group    | Descrição      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Permite comunicação entre ECS Tasks e EFS       | TargetVPC  |

Role a tela até a seção **Inbound rules** e permita comunicação entre ECS Tasks e o Amazon EFS. Acesso do Webserver ao EFS é habilitado temporariamente, para montar o volume EFS e copiar os arquivos estáticos da aplicação web (daqui a pouco você irá revogar esse acesso).

| Tipo    | Protocolo      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Clique no botão **Create security group** para criar o security group.

### 4. Modifique o security group existente do banco de dados 

Vá para a tela **Security Groups** e modifique o database security group (DB-SG) para permitir tráfego TCP de entrada na porta 3306 (MySQL) a partir do ECS-Tasks-SG para o database de destino (você já deve ter regras de entrada para o Webserver e Replication instance aqui),

| Tipo    | Protocolo      								   | Origem            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)