+++
title = "Création des \"security groups\" complémentaires"
weight = 10
+++


### Créer les "security groups" pour le VPC

A partir de **AWS Console**, allez dans **Services** et sélectionnez **VPC**. Dans le panneau de gauche, cliquez sur **Security Groups** en dessous de la section "Security" puis sur **Create security group**.

## 1. Créer le "security group" du "load balancer"

Entrez les paramètres suivants pour le **Security group** 


| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | TargetVPC  |

![create-lb-sg](/ecs/create-lb-sg.png)

Paginez vers le bas et dans la section **Inbound rules** ajoutez les accès HTTP et HTTPS à partir de **"Anywhere"** pour autoriser l'accès au site web. 

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

cliquez sur le bouton **Create security group** pour créer le "security group".

#### 2. Créer le "security group" pour les tâches du service Elastic Container

Allez à la page **Security Groups**, cliquez sur **Create security group** et entrez les valeurs suivantes :

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| TargetVPC  |

Paginez vers le bas jusqu'à **Inbound rules** et autorisez la communication entre le 'load balancer" et les tâches ECS (sélectionnez le "security group" LB-SG dans la liste déroulante **Source**).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Cliquez sur le bouton **Create security group** pour créer le "security group".

#### 3. Créer le "security group" pour  Elastic File System

Allez à la page **Security Groups**, cliquez sur  **Create security group** et entrez les valuers suivantes :

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Allow communication between ECS Tasks and EFS       | TargetVPC  |

Paginez vers le bas jusqu'à **Inbound rules** et autorisez la communication entre les tâches ECS et Amazon EFS. L'accès pour le serveur web Webserver à EFS est autorisé temporairement afin de permettre de monter le volume EFS et de copier les fichiers statiques de l'application web (vous le révoquerez plus tard).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Cliquez sur le bouton **Create security group** pour créer le "security group".

### 4. Modifier le "security group" existant pour la base de données

Allez à la page **Security Groups** et modifiez le "security group" de la base de données (DB-SG) pour autoriser le traffic entrant sur le port 3306 (port MySQL) à partir du security group ECS-Tasks-SG vers la base de données cible (vous devez déjà avoir une règle "inbound" pour le serveur web et l'instance de réplication).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
