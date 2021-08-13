+++
title = "Erstelle Zieldatenbank"
weight = 10
+++

### Datenbankmigration

Datenbankmigrationen können auf verschiedene Arten durchgeführt werden. 
Für Zweck dieses Workshops führen wir eine **kontinuierliche Datenreplikation** mit 
dem <a href = "https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a> aus.

Bevor Sie **AWS DMS** konfigurieren, müssen Sie Ihre Zieldatenbank in dem bereitgestellten 
AWS-Konto erstellen. Verwenden Sie **AWS Relation Database Service (RDS)**, um diese Aktivität 
zu auszuführen und das Einrichten, Betreiben und Skalieren einer relationalen Datenbank in der Cloud zu vereinfachen.

### Erstellen von eine Subnetzgruppe (subnet group) für die Zieldatenbank

1. Gehen Sie zur **AWS Console**, wählen Sie unter **Services** **RDS** aus, 
wählen Sie im Menü links **Subnet Groups** aus und klicken Sie auf **Create DB Subnet Group**

2. Bei **Create DB subnet group** fügen Sie folgenden Informationen hinzu:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets where RDS will be deployed |
    | VPC      | TargetVPC            |

    Fügen Sie im Bereich **Add Subnets** ein Subnetz aus jeder Verfügbarkeitszone (us-west-2a und us-west-2b) mit den CIDRs 10.0.101.0/24 und 10.0.201.0/24 hinzu und drücken Sie dann **Create** Taste.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Erstellen Sie die Zieldatenbank    

1. Wählen Sie nun im Menü links **Databases** aus und klicken Sie auf **Create database**.
2. Wählen Sie unter **Engine options** MySQL und die MySQL 5.7.33 Version aus

    ![1](/db-mig/1.png)


    {{% notice note %}}
Sie können die MySQL-Quellversion aus der Quellendatenbank mithilfe der SQL-Abfrage bestätigen - **SELECT @@ version;**
{{% /notice %}}

Konfigurieren Sie im Abschnitt **Settings** die DB-Instanzkennung (z. B. Datenbank-1), 
den Administrator-Benutzernamen (z. B. admin) und das Admin-Passwort für Ihre neue Datenbankinstanz.
    ![3_db](/db-mig/3_db.png)

{{% notice note %}}
Notieren Sie sich **Administrator-Benutzername** und **Administrator-Passwort**, da Sie es später verwenden werden.
{{% /notice %}}

Wählen Sie die **db.t3.medium** aus "Burstable DB instance" Klasse aus und markieren sie den **General Purpose (SSD)** Festplattentyp.
    ![4_db](/db-mig/4_db.png)

3. Bei **Availability & durability**, ändern Sie die Konfiguration zu **Do not create a standby instance**, um Kosten zu sparen.

{{% notice note %}}
Für Produktions-Workloads, um eine höhere Verfügbarkeit zu erreichen, empfehlen wir, die Standby-Instanz in einem 
<a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">Multi-AZ Deployment</a> zu aktivieren.
{{% /notice %}}  
    ![5_db](/db-mig/5_db.png)

4. Im Abschnitt **Connectivity**:
    * Wählen Sie **Virtual Private Cloud (VPC)**, dann **TargetVPC** (dies ist die <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer"> Amazon Virtual Private Cloud</a>, 
    die automatisch für dieser Workshop erstellt wurde).
    * Bei **Additional connectivity configuration -> VPC Security Group** wählen Sie die Option **Create new** um eine neue VPC-Sicherheitsgruppe zu erstellen 
    und geben Sie ihr einen Namen (z. B. "DB-SG").
    * Beachten Sie, dass die zuvor erstellte DB-Subnetzgruppe automatisch ausgewählt wird.

    ![6_db](/db-mig/6_db.png)


{{% notice note %}}
Hinweis: Sie werden die DB-SG VPC-Sicherheitsgruppe später bearbeiten, um sicherzustellen, dass die DMS-Replikationsinstanz auf 
die Zieldatenbank zugreifen und den Zugriff von Ihrem Webserver aus ermöglichen kann.
{{% /notice %}}

5. Bei **Database authentication** wählen Sie die **Password authentication**.

6. (Betrifft nur die von AWS gehostete Workshops) Deaktivieren Sie in der **Additional configuration** 
das Kontrollkästchen **Enable Enhanced monitoring** im Abschnitt **Monitoring**, wie unten angegeben:

    ![6_2_db](/db-mig/6_2_db.png)

    ![8_db](/db-mig/8_db.png)

{{% notice note %}}
Die Verwendung von <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">Enhanced monitoring</a> 
ist eine sehr gute Idee für die Produktions-Workloads. Bei einem von AWS gehosteten Veranstaltungen deaktivieren wir diese Option 
aufgrund von Einschränkungen der IAM-Rolle, die wir für die Teilnehmer bereitstellen.
{{% /notice %}}

6. Überprüfen Sie abschließend die **Estimated monthly costs** und klicken Sie auf die **Create database** Schaltfläche drauf.

   ![8_2_db](/db-mig/8_2_db.png)
