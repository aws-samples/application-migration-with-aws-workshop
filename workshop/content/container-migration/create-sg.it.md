+++
title = "Creare security groups addizionali"
weight = 10
+++


### Creare security groups per la tua VPC

Dall' **AWS Console**, andare su **Services** e selezionare **VPC**. Nel pannello di sinistra, cliccare su **Security Groups** sotto la sezione Security e dopo **Create security group**.

### 1. Creare un Load balancer security group

Inserire i seguenti parametri per il  **Security group** 


| nome Security group    | Descrizione      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | TargetVPC  |

![create-lb-sg](/ecs/create-lb-sg.png)

Scorri verso il basso e nella sezione **Inbound rules**  aggiungi HTTP, e HTTPS con accesso da **Anywhere** per consentire agli utenti di accedere al sito web.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

Clicca sul pulsante **Create security group** per creare il security group.

#### 2. Creare un Elastic Container Service Task security group

Andare sulla schermata  **Security Groups**, Clicca su **Create security group** e inserisci i seguenti valori.

| nome Security group     | Descrizione      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Abilita communicazione tra il LB e i Tasks ECS | TargetVPC  |

Scorri in basso su **Inbound rules** e abilita la communicazione tra il Load Balancer e i Tasks ECS (seleziona il security group LB-SG dal menu a tendina **Source** ).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Clicca sul pulsante **Create security group** per creare il security group.

#### 3. Creare l'Elastic File System security group

Andare sulla schermata **Security Groups** , cliccare su **Create security group** e inserire i seguenti valori.

| nome Security group    | Descrizione      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Abilita communicazione tra i Tasks ECS e EFS       | TargetVPC  |

Scorri in basso fino alla sezione **Inbound rules** e abilita la communicazione tra i Tasks ECS e Amazon EFS. L'accesso del Webserver a EFS è abilitato temporaneamente, per poter montare il volume EFS e copiare i file statici dell'applicazione Web (verrà revocato in seguito).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Clicca sul pulsante **Create security group** per creare il Security Group.

### 4. Modifica il security group esistente per il database

Andare alla schermata **Security Groups**  e modificare il gruppo di sicurezza del database (DB-SG) per consentire il traffico TCP in entrata sulla porta 3306 (porta MySQL) da ECS-Tasks-SG al database di destinazione (dovresti avere già le regole inboud per il Webserver e l'istanza di replica ),

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
