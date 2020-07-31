+++
title = "Netzwerk einrichten"
weight = 15
+++

Da wir in diesem Workshop kein **VPN** oder **AWS Direct Connect** verwenden, 
muss die **DMS-Replikationsinstanz** über das öffentliche Internet die Quellendatenbank 
erreichen können. Zur Zieldatenbank wird die Verbindung über ein privates Netzwerk aufgebaut.

![Replication Instance Architektur](/db-mig/ri-network-conf.png)

### Erstellen Sie "replication subnet group"

Eine der Voraussetzungen für die Verwendung von **AWS DMS** ist die Konfiguration 
einer **Subnet group**, bei der es sich um eine Gruppe von Subnetzen handelt, 
die von der **DMS-Replikationsinstanz** verwendet werden.

1. Wählen Sie die **AWS Console> Services> Database Migration Service > Subnet groups** und klicken Sie auf die **Create subnet group** Schaltfläche darauf.
2. Bei der **Create replication subnet group** geben Sie folgende Parameterwerte ein:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | select **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-network](/db-mig/subnet-group.png)

3. Klicken Sie auf die **Create subnet group** Schaltfläche darauf.

### Konfigurieren von "security group". 

Die **VPC security group** in diesem Workshop muss eingehenden Datenverkehr von 
der **DMS-Replikationsinstanz** zu der RDS-Zieldatenbank zulassen.

1. Erstellen Sie eine Sicherheitsgruppe für die **DMS-Replikationsinstanz**

    a. Besuchen Sie die **AWS Console > Services > EC2 > Security Groups** und klicken Sie auf die **Create Security Group** Schaltfläche darauf.

    b. Fügen Sie die **Security group name** zu (z.B.: RI-SG), geben Sie den Namen (**"Description"**) ein, wählen Sie **TargetVPC** bei dem VPC-Feld aus 
     und klicken Sie bitte auf die **Create security group** Schaltfläche darauf.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

{{% notice note %}}
Es ist nicht erforderlich, eingehende Regeln zu der **RI-SG** Sicherheitsgruppe mit **DMS Replication Instance** hinzuzufügen.
{{% /notice %}}

2. Fügen Sie der Sicherheitsgruppe **DB-SG** eine eingehende Regel hinzu
    a. Besuchen Sie die **AWS Console > Services > EC2 > Security Groups** und dann wählen Sie 
    die **Security Group ID** von Datenbank-Sicherheitsgruppe **DB-SG** die vorher erstellt wurde. 
    
    b. Editieren Sie die **DB-SG** Sicherheitsgruppe.
      
    c. Bei den eingehenden Regeln fügen Sie bitte eine neue Regel zu, 
    die die Verbindung von **DMS Replication Instance** Sicherheitsgruppe am Port 3306 erlauben wird. Speichern Sie die Änderung.
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
