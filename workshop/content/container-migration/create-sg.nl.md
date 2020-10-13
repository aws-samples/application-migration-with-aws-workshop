+++
title = "Creëer security groepen"
weight = 10
+++

### Creëer de security groepen voor je VPC

In het **AWS Console**, ga naar **Services** en selecteer **VPC**. In het linker paneel, onder **Security**, klik op **Security Groups** en dan op de **Create security group** knop.

### 1. Creëer de security groep voor de Load balancer

Vul de onderstaande informatie in voor de **Security group**

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | TargetVPC  |

![create-lb-sg](/ecs/create-lb-sg.png)

Onder **Inbound rules** voeg HTTP en HTTPS toegang toe voor **Anywhere** om toegang voor gebruikers naar de website toe te staan.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

Druk op **Create security group** om de security groep aan te maken.

#### 2. Create Elastic Container Service Task security group

Ga naar **Security Groups**, druk op **Create security group** en vul de onderstaande informatie in voor de **Security group**.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| TargetVPC  |

Onder **Inbound rules** voeg toegang van de Load Balancer naar de ECS taak toe (selecteer de LB-SG security groep van de **Source** drop-down).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Druk op **Create security group** om de security groep aan te maken.

#### 3. Create Elastic File System security group

Ga naar **Security Groups**, druk op **Create security group** en vul de onderstaande informatie in voor de **Security group**.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Allow communication between ECS Tasks and EFS       | TargetVPC  |

Onder **Inbound rules** voeg toegang voor de ECS taak naar Amazon Elastic FileSystem (EFS) toe. Toegang voor de Webserver tot EFS is alleen tijdelijk geactiveerd, zodat het file systeem kan worden gekoppeld aan de machine en de Wordpress web inhoud kan worden gekopieëerd van de machine naar het file systeem (deze toegang wordt later weer verwijderd). 

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Druk op **Create security group** om de security groep aan te maken.

### Wijzig de security groep voor de database

Wijzig de security groep voor de database (DB-SG) om inkomend TCP verkeer op poort 3306 (MySQL port) van de ECS-Tasks-SG en de ECS-SG security groepen toe te staan. Dit is om communicatie tussen de ECS taken en de database in de doelomgeving toe te staan (als het goed is heb je al een inbound rule voor communicatie tussen de webserver en de replicatie machines hier).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |

![update-db-sg](/ecs/update-db-sg.png)
