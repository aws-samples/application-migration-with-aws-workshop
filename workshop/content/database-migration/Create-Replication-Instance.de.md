+++
title = "Erstelle eine Replikationsinstanz"
weight = 20
+++

### Erstelle die AWS DMS Replication Instance

Bei dem Schritt erstellen Sie mit <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer"
AWS Database Migration Service</a> eine Replication Instance. 
Die Instanz wird eine Verbindung zwischen den Quel- und Ziel-Datenbank herstellen
um die Daten auf der Zieldatenbank zu synchronisieren. 

1. Wählen Sie **> AWS Console >Services > Database Migration Service** aus.  

2. Wählen Sie **> Replication instances > Create replication instance** aus.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. Bei **> Create replication instance** konfigurieren Sie eine neue Replikationsinstanz (replica instance)
mit folgenden Parameterwerten:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Wie auf dem Bild.

    ![replication-instance-conf](/db-mig/replication-instance-conf.png)

    Bei **> Advanced security and network configuration**, wählen Sie "replication subnet group" 
    und die "replication instance security group" die Sie vorher erstellt haben.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Wählen Sie **Create** um die Instanz zu erstellen.

{{% notice note %}}
Das Erstellen einer Replikationsinstanz dauert einige Minuten. Warten Sie, bis sich der **Status** auf **Available** 
sich ändert, bevor Sie mit den nächsten Schritten fortfahren. 
In der Zwischenzeit können Sie verschiedene Anwendungsfälle für AWS DMS überprüfen, 
die auf der <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS DMS-Webseite</a> zu finden sind.
{{% /notice %}}
