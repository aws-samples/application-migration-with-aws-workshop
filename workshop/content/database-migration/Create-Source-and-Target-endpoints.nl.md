+++
title = "Creëer Endpoints voor bron- en doelomgeving"
weight = 30
+++


### Creëer Endpoints voor bron- en doelomgeving

In het **AWS DMS** scherm, ga naar **Endpoints** en klik op **Create endpoint**.

1. Creëer het **endpoint** voor de bronomgeving

    Gebruik de volgende parameters voor het configureren van het **endpoint**:

    | Parameter           | Waarde                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - for **self-paced lab** use information from the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank">CloudFormation Template</a>, <br>for **AWS Events** - use **Database Server IP** from the Event Engine - Team Dashboard   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Open de **Test endpoint connection (optional)** sectie, en selecteer in de **VPC** drop-down list **TargetVPC** en klik op **Run test** om je **endpoint** configuratie te verifiëren.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    De test duurt ongeveer een minuut en daarna zie je **successful** in de **Status** kolom. Druk op de **Create endpoint** knop om het **endpoint** te creëren.
    
    Indien je een foutmelding krijgt - Controleer dat je de parameters voor het **endpoint** juist hebt ingevoerd en dat de replicatie machine is geconfigureerd met de **Publicly Accessible** parameter aan.

2. Creëer het **endpoint** in de doelomgeving

    Voer dezelfde stappen uit om nu het **endpoint** voor de doelomgeving aan te maken. Gebruik de onderstaande parameters:

    | Parameter           | Waarde                                                 |
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


3. Onder **Endpoint-specific settings** -> **Extra connection attributes** voeg de onderstaande parameter toe:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Onder **Test endpoint connection (optional)** kies **TargetVPC** in de **VPC** drop-down lijst en druk op de **Run test** knop om je **endpoint** configuratie te verifiëren.

    De test duurt ongeveer een minuut en daarna zie je **successful** in de **Status** kolom. Druk op de **Create endpoint** knop om het **endpoint** te creëren.

Indien je een foutmelding krijgt - Controleer dat de **VPC security group** van jouw **RDS database** inkomend verkeer toelaat op port 3306 van de **AWS DMS Replication Instance** security groep (of bijvoorbeeld van de hele **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Verdere testen voor de **endpoint** verbinding kun je uitvoeren via de lijst van **Endpoints** door op **Actions** te klikken en dan op **Test connection**.
{{% /notice %}}
