+++
title = "Netwerk configuratie"
weight = 10
+++

Omdat we in deze workshop geen **VPN** of **AWS Direct Connect** gebruiken, moet de **DMS Replication Instance** via internet verbinding maken met de database in de bronomgeving. De verbinding met de database in de doelomgeving verloopt via het interne netwerk.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Configureer de security groep

De **VPC security groep** in deze workshop dient inkomend verkeer toe te staan van de **DMS Replication Instance** naar de **RDS database** in de doelomgeving.

1. Creëer een security groep voor de **DMS Replication Instance**

    a. Ga naar het **AWS Console** en dan naar **Services > EC2 > Security Groups** en klik op de **Create Security Group** knop.

    b. Voer een **Security groep naam** in (b.v. RI-SG), en geef een beschrijving in het **Description** veld, kies dan de **TargetVPC** in het **VPC** veld en klik op de **Create security group** button.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  Het is niet nodig om **inbound rules** toe te voegen aan de **DMS Replication Instance** security groep **RI-SG**
  {{% /notice %}}

2. Voeg een **Inbound rule** toe aan de **security groep** van de database in de doelomgeving.

    a. Ga naar het **AWS Console** en dan naar **Services > EC2 > Security Groups** en klik op de **Security Groep ID** van de Database Security Groep **DB-SG** die je eerder aangemaakt hebt. 

    b. Onder **details** van de **DB-SG** security groep, druk op de **Edit inbound rules** knop  

    c. Onder **Edit inbound rules**, druk op de **Add rule** knop en configureer een **inbound rule** die inkomend verkeer van de **DMS Replication Instance** security groep op poort 3306 toestaat en klik op  **Save rules**
    
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
