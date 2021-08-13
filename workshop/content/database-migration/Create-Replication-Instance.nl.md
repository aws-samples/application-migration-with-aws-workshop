+++
title = "Creëer de Replicatie Machine"
weight = 20
+++

### Create replication subnet group

Één van de vereisten voor het gebruik van **AWS DMS** is het configureren van een **subnet group**, die bestaat uit een set van subnetten die gebruikt kunnen worden door de **DMS Replication Instance**. 

1. Ga naar het **AWS Console** en onder **Services** kies **Database Migration Service**. Selecteer dan **Subnet groups** en druk op de **Create subnet group** knop.

2. Onder **Create replication subnet group** vul de volgende informatie in:

    | Parameter           | Waarde                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | selecteer **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.png)

3. Click on the **Create subnet group** button

### Creëer de AWS DMS Replicatie Machine

In deze stap creëer je de <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service</a> Replicatie Machine die de verbinding opzet tussen de databases in the bron- en doelomgeving, de data overbrengt en veranderingen bijhoudt die in de database in de bronomgeving plaatsvinden tijdens het overbrengen van de data.

1. In het **AWS Console**, ga naar **Services** en **Database Migration Service**.  

2. Klik op **Replication instances** en dan op de **Create replication instance** knop.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. Op het **Create replication instance** scherm, configureer een nieuwe replicatie machine (**instance**) met de onderstaande parameters:

    | Parameter           | Waarde                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | Instance Class      | dms.t2.medium            |
    | Engine version      | 3.3.3                    |
    |Allocated storage (GB)| 50                      |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Zoals in de onderstaande screenshot.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    Onder **Advanced security and network configuration**, kies de juiste replicatie subnet groep & the replicatie machine security groep die je eerder hebt aangemaakt.

    ![Replication-instance-conf](/db-mig/advanced-security.png)

4. Druk op de **Create** knop.

{{% notice note %}}
Als je de volgende foutmelding krijgt: "SYSTEM ERROR MESSAGE:Cannot create a dms.t2.medium replication instance", creëer dan de **DMS replication instance** opnieuw, maar selecteer **us-west-2b** als **Availability Zone**. En indien dat ook niet helpt, kies dan een grotere **instance class**.
{{% /notice %}}  