+++
title = "Creëer security groepen"
weight = 10
+++

### Creëer de security groepen voor je VPC

In het **AWS Console**, ga naar **Services** en selecteer **VPC**. In het linker paneel, onder **Security**, klik op **Security Groups** en dan op de **Create security group** knop.

Vul de onderstaande informatie in voor de **Security group** (herhaal de stappen voor alle 4 de security groepen, zoals weergegeven in onderstaande tabel).


| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-SG                 | Allow SSH communication to the ECS nodes            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| Your VPC that you created earlier (e.g. TargetVPC)  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | Your VPC that you created earlier (e.g. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)

### Wijzig en configureer de security groepen

Zodra je de Security Groepen hebt aangemaakt, selecteer ze dan één voor één en klik op **Inbound Rules** en dan op **Edit rules**. Voeg nu de regels toe aan de Security Groep zoals hieronder weergegeven:

#### 1. LB-SG Inbound rules

Voeg HTTP, en HTTPS toegang toe zodat gebruikers de website kunnen bereiken.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

#### 2. ECS-SG Inbound rules

Voeg SSH toegang toe, zodat je kunt inloggen op de **ECS instances** indien nodig.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| SSH                | TCP            | My IP   |

![edit-ecs-sg](/ecs/edit-ecs-sg.png)

#### 3. ECS-Tasks-SG Inbound rules

Sta communicatie tussen de Load Balancer en de ECS Taken toe.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 4. EFS-SG Inbound rules

Sta communicatie toe tussen de ECS Taken en Amazon EFS. 
Toegang voor de Webserver tot EFS is alleen tijdelijk geactiveerd, zodat het file systeem kan worden gekoppeld aand de machine en de Wordpress web inhoud kan worden gekopieëerd van de machine naar het file systeem (dit wordt later weer verwijderd).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP| Custom > ECS-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Wijzig de security groep voor de database

Wijzig de security groep voor de database (DB-SG) om inkomend TCP verkeer op poort 3306 (MySQL port) van de ECS-Tasks-SG en de ECS-SG security groepen toe te staan. Dit is om communicatie tussen de ECS taken en de database in de doelomgeving toe te staan.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |
| MYSQL               | TCP            | Custom > ECS-SG   |


![update-db-sg](/ecs/update-db-sg.png)
