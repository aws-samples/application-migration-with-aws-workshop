+++
title = "Crea Security Group aggiuntivi"
weight = 10
+++


### Crea security groups per il tuo VPC

Dalla **AWS Console**, vai su **Services** e seleziona **VPC**. Nel pannello di sinistra, fai clic su **Security Groups** sotto la sezione Security e quindi **Create security group**.

Immettere i seguenti parametri per il **Security group** (ripetere i passaggi per creare tutti e 4 i gruppi di sicurezza, come da tabella seguente).


| Nome Security group    | Descrizione      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Il tuo VPC che hai creato in precedenza (e.g. TargetVPC)  |
| ECS-Tasks-SG           | Abilita comunicazione tra LB e i Task di ECS | Il tuo VPC che hai creato in precedenza (e.g. TargetVPC)  |
| EFS-SG                 | Abilita comunicazione tra i Task di ECS e EFS       | Il tuo VPC che hai creato in precedenza (e.g. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)





### Modifica e configura i security groups

Una volta creati i gruppi di sicurezza, selezionarli uno per uno e fare clic su **Inbound Rules** e quindi **Edit rules**. Aggiungerai le regole per ciascuno dei gruppi di sicurezza come segue:

#### 1. LB-SG Inbound rules

Aggiungi l'accesso HTTP, e HTTPS da anywhere per consentire agli utenti di accedere al sito Web.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. ECS-Tasks-SG Inbound rules

Abilita la comunicazione tra Load Balancer e i Task ECS.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. EFS-SG Inbound rules

Abilita la comunicazione tra i Task ECS Tasks e Amazon EFS. L'accesso del Webserver all'EFS è abilitato solo temporaneamente, per poter montare il volume EFS e copiare i file statici dell'applicazione Web (lo rimuoverete in seguito).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Modifica i security groups del database

Modificare il Security Group del database (DB-SG) per consentire la porta TCP in ingresso 3306 (porta MySQL) da ECS-Tasks-SG e ECS-SG - per consentire la comunicazione tra i Task ECS e il database di destinazione.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
