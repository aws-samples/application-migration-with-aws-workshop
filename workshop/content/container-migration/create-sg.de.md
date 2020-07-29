+++
title = "Erstellen Sie zusätzliche Sicherheitsgruppen für Ihre VPC"
weight = 10
+++


### Erstellen Sie zusätzliche Sicherheitsgruppen für Ihre VPC

In **AWS Console**, besuchen Sie **Services** und wählen Sie **VPC** aus. 
Klicken Sie auf der Linke Seite **Security Groups** (SG) und dann **Create security group** erstellen Sie 
eine neue Security-Group (SG).

Fügen Sie folgende Parameter bei der **Security group** (SG) ein (wiederholen Sie, bitte diesen Schritt um alle 4 SG zu erstellen).

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| Your VPC that you created earlier (e.g. TargetVPC)  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | Your VPC that you created earlier (e.g. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)

### Bearbeiten und konfigurieren Sie die Security-Groups

Nachdem Sie die SG's erstellt haben, wählen Sie eine nach der anderen aus 
und klicken Sie auf **Inbound Rules** und dann auf **Edit rules**. 
Fügen Sie die Regeln für jede der Sicherheitsgruppen wie folgt hinzu:

#### 1. LB-SG Inbound rules

Erlauben Sie HTTP- und HTTPS-Zugriff aus dem Internet hinzu, 
damit Benutzer auf die Website zugreifen können.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. ECS-Tasks-SG Inbound rules

Ermöglichen Sie die Kommunikation zwischen dem Load Balancer 
und den ECS-Task.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. EFS-SG Inbound rules

Ermöglichen Sie die Kommunikation zwischen ECS-Task und Amazon EFS. 
Der Webserverzugriff auf das EFS wird nur vorübergehend aktiviert, 
um das EFS-Volume bereitstellen und statische Dateien der Webanwendung 
kopieren zu können (Sie werden es später entfernen).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Ändern Sie die Datenbanksicherheitsgruppen (SG)

Ändern Sie die Datenbanksicherheitsgruppe (DB-SG) so, dass eingehender TCP-Port 3306 (MySQL-Port) 
von ECS-Tasks-SG und ECS-SG zugelassen wird, um die Kommunikation zwischen ECS-Tasks 
und der Zieldatenbank zu ermöglichen.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
