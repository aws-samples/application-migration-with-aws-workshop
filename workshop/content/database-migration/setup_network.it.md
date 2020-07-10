+++
title = "Configura il Networking"
weight = 15
+++

Poiché non utilizziamo una **VPN** o **AWS Direct Connect** in questo workshop, **DMS Replication Instance** dovrà connettersi al database di origine su Internet pubblico, mentre al database di destinazione su Rete privata.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Creazione del subnet group di replica

Uno dei prerequisiti per l'utilizzo di **AWS DMS** è aver configurato un **subnet group**, che è una raccolta di sottoreti che verranno utilizzate dall'**istanza di replica DMS**. 

1. Andare sulla **AWS Console > Services > Database Migration Service > Subnet groups** e cliccare sul pulsante **Create subnet group**.
2. Nella sezione **Create replication subnet group** inserire i seguenti valori dei parametri:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | selezionare **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.png)

3. Cliccare sul pulsante **Create subnet group**

### Configurare il security group

**VPC security group** in questo workshop deve consentire il traffico in entrata dall'**istanza di replica DMS** al database RDS di destinazione.

1. Creare un gruppo di sicurezza per **Istanza di replica DMS**

    a. Andare sulla **AWS Console > Services > EC2 > Security Groups** e cliccare il pulsante **Create Security Group**.

    b. Inserire **il nome del Security group** (per esempio RI-SG), assegnagli una **Descrizione**, seleziona **TargetVPC** per il campo VPC e premi il pulsante **Create security group**.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  Non è necessario aggiungere alcuna regola in entrata al gruppo di sicurezza **DMS Replication Instance** **RI-SG**
  {{% /notice %}}

2. Aggiungere una Inbound rule al **DB-SG** security group

    a. Andare di nuovo sulla schermata **AWS Console > Services > EC2 > Security Groups** cliccare sul **Security Group ID** del Database Security Group **DB-SG** creato in precedenza
    
    b. Sui dettagli della schermata del gruppo di sicurezza **DB-SG**, premere il pulsante **Edit inbound rules**
      
    c. Nella schermata **Edit inbound rules** premere il pulsante  **Add rule**  e configurare la regola per consentire il traffico  **inbound** dal security group dell' **Istanza DMS di Replica** sulla porta 3306 e premere il pulsante **Save rules** 
    ![Aggiunta della regola in entrata per l'istanza riservata](/db-mig/security-group-inbound-rule.en.png)
