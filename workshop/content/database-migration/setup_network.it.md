+++
title = "Configurare il Networking"
weight = 10
+++

poichè non utilizziamo **VPN** o **AWS Direct Connect** in questo workshop, **DMS Replication Instance** dovrà connettersi al database di origine su Internet pubblico, mentre al database di destinazione su Rete privata.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Configurare il security group

Il **VPC security group** in questo workshop deve abilòitare traffico in ingresso per **DMS Replication Instance** al database RDS di destinazione.

1. Creare il security group per la **DMS Replication Instance**

    a. Andare su **AWS Console > Services > EC2 > Security Groups** e selezionare il pulsante **Create Security Group**n.

    b. Inserire il  **Nome del Security group** (per esempio RI-SG), dare una **Description**, selezionare il  **TargetVPC** per il campo VPC e premere il pulsante **Create security group**.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  Non è necessario aggiungere alcuna regola in entrata al security group  **DMS Replication Instance**  **RI-SG**
  {{% /notice %}}

2. Creare il security group per il **Target Database**

    a. Andare su **AWS Console > Services > EC2 > Security Groups** e selezionare il pulsante **Create Security Group**.

    b. Inserire il  **nome del Security group** (per esempio DB-SG), inserire una **Description**, selezionare il **TargetVPC** dal campo VPC e premere il pulsante **Create security group**.

    c. Nella sezione **inbound rules** premere il pulsante **Add rule** e configurare le regole per abilitare in  **inbound** il traffico dal **Istanza DMS Replication** security group sulla porta 3306 e selezioanre il pulsante **Save rules**
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
