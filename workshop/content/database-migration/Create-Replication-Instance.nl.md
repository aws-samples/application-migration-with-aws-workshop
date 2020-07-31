+++
title = "Creëer de Replicatie Machine"
weight = 20
+++

### Creëer de AWS DMS Replicatie Machine

In deze stap creëer je de <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migration Service</a> Replicatie Machine die de verbinding opzet tussen de databases in the bron- en doelomgeving, de data overbrengt en veranderingen bijhoudt die in de database in de bronomgeving plaatsvinden tijdens het overbrengen van de data.

1. In het **AWS Console**, ga naar **Services** en **Database Migration Service**.  

2. Klik op **Replication instances** en dan op de **Create replication instance** knop.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. Op het **Create replication instance** scherm, configureer een nieuwe replicatie machine (**instance**) met de onderstaande parameters:

    | Parameter           | Waarde                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | Instance Class      | dms.t2.medium            |
    | Engine version      | 3.3.1                    |
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
Het aanmaken van de replicatie machine duurt enkele minuten. Wacht totdat de status als **Available** staat voordat je verder gaat met de volgende stappen. Ondertussen kun je wellicht even kijken naar verschillende mogelijkheden van AWS DMS zoals beschreven staat op de <a href="https://aws.amazon.com/dms/" target="_blank">AWS DMS Webpagina</a>
{{% /notice %}}
