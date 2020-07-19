+++
title = "Créer les security groups complémentaires"
weight = 10
+++


### Créer les "security groups" pour le VPC

A partir de **AWS Console**, allez dans **Services** et sélectionnez **VPC**. Dans le panneau de gauche, cliquez sur **Security Groups** en dessous de la section "Security" puis sur **Create security group**.

Entrez les paramètres suivants pour le **"Security group"** (répétez l'étape afin de créer les 4 "security groups" comme dafinis ci-dessous).


| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| Your VPC that you created earlier (e.g. TargetVPC)  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | Your VPC that you created earlier (e.g. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)





### Editer et configurer les "security groups"

Dès que vous avez créé les "security groups", sélectionnez les un par un et cliquez sur **Inbound Rules** puis **Edit rules**. Vous allez ajouter les règles pour chacun des "security groups" comme indiqué ci-dessous :

#### 1. LB-SG Inbound rules

Ajoutez les accès HTTP et HTTPS de toute provenance pour autoriser les utilisateurs à accéder au site web.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. ECS-Tasks-SG Inbound rules

Autorisez la communication entre le "load balancer" et les tâches Amazon ECS.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. EFS-SG Inbound rules

Autorisez la communication entre les tâches Amazon ECS et Amazon EFS. L'accès du web serveur à EFS est activé temporairement afin de "monter" le volume EFS et copier les fichiers statiques (vous supprimerez cet accès ensuite).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Modifier le "security group" pour la base de données

Modifiez le "security group" associé à la base de données pour autoriser le "inbound TCP port" 3306 (port MySQL) dans ECS-Tasks-SG et ECS-SG – pour autoriser la communication entre les tâches ECS et la base de données cible.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
