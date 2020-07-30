+++
title = "Erstellen Sie Quell- und Ziel-Datenbankreplikation-Endpunkte"
weight = 30
+++


### Erstellen Sie Quell- und Ziel-Datenbankreplikation-Endpunkte

Bei **AWS DMS** Konfiguration, wählen Sie **Endpoints** und dann **Create endpoint** aus.

1. Erstellen von den Quell-Replikation-Endpunkt

    Konfigurieren Sie bitte folgende Parameterverte:

    | Parameter           | Value                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - für einen selbsterstellten Workshop Benutzen Sie die **Output** Parameter von **CloudFormation Template**, <br>bei einem **AWS Events** - benutzen Sie bitte die **Database Server IP** aus der Event-Engine-Team-Dashboard |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Öffnen Sie den Abschnitt **Test endpoint conneciton (optional)**, 
    wählen Sie dann in der Dropdown-Liste **VPC** die Option **TargetVPC** aus 
    und klicken Sie auf die Schaltfläche **Test ausführen** darauf, 
    um zu überprüfen, ob Ihre Endpunktkonfiguration gültig ist.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    Der Test wird eine Minute lang ausgeführt und in der Spalte **Status** 
    sollte die Meldung **erfolgreich (successful)** angezeigt werden. 
    Klicken Sie auf die Schaltfläche **Create endpoint** darauf, um den Endpunkt zu erstellen.
    
    Stellen Sie in einem Fehlerfall sicher, dass Sie die Endpunktparameter korrekt 
    konfiguriert haben und dass die Replikationsinstanz mit aktiviertem Parameter 
    **Publicly Accessible** erstellt wurde.    

2. Erstellen Sie den Zielendpunkt

    Wiederholen Sie alle Schritte, um den Zielendpunkt mit den folgenden Parameterwerten zu erstellen:

    | Parameter           | Value                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | checked                                            |
    | RDS Instance        | Select your RDS instance from the drop-down (if it's not visible enter values manually)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (will be pre-populated)                                                |
    | Server Name         | DNS name of your RDS database (leave the the pre-populated value)                             |
    | Port                | 3306     (will be pre-populated)                                             |
    | SSL mode            | none                                                  |
    | User name           | (leave the pre-populated value)                                                 |
    | Password            | Enter password you used when you creating the RDS database|

3. Kopieren Sie in den **Endpoint-specific settings -> Extra connection attributes** 
die folgenden Verbindungsparameter:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Wählen Sie unter **Test endpoint connection (optional)** die Option **TargetVPC** 
in der Dropdown-Liste **VPC** aus und klicken Sie auf die Schaltfläche **Test ausführen** darauf, 
um zu überprüfen, ob Ihr Endpunkt erreichbar ist.

Der Test wird eine Minute lang ausgeführt und am Ende sollte in der Spalte **Status** 
eine Meldung **successful** angezeigt werden. 
Klicken Sie auf die Schaltfläche **create endpoint** darauf, um den Endpunkt zu erstellen.

Stellen Sie im Fehlerfall sicher, dass die **VPC security group** Ihrer RDS-Datenbank 
eingehenden Datenverkehr auf Port 3306 von der Sicherheitsgruppe **AWS DMS Replication Instance** 
(oder beispielsweise von der gesamten **TargetVPC** - 10.0.0.0/16) zulässt.

{{% notice note %}}
Zusätzliche Endpunktverbindungstests können über die Liste **Endpoints** durchgeführt werden, 
indem Sie auf die Schaltfläche **Actions** und dann auf die **Test connection** darauf klicken.
{{% /notice %}}
