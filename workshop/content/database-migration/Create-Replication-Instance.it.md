+++
title = "Crea l'istanza di replica"
weight = 20
+++

### Crea un instanza AWS DMS di Replica

In questo passaggio creerai una <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service</a> Istanza di Replica che avvia la connessione tra i database di origine e di destinazione, trasferisce i dati e memorizza nella cache tutte le modifiche che si verificano sul database di origine durante il caricamento iniziale dei dati.


1. All'interno della **AWS Console**, vai su **Services** e **Database Migration Service**.  

2. clicca su **Replication instances** e quindi sul bottone **Create replication instance** button.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. Nella schermata **Create replication instance** configurare una nuova istanza di replica con i seguenti valori di parametro:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Come nello screenshot qui sotto.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    In  **Advanced security and network configuration**, assicurarsi di selezionare il gruppo di sottoreti di replica e il gruppo di sicurezza dell'istanza di replica creati in precedenza.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Clicca sul bottone **Create**.

    {{% notice note %}}
La creazione dell'istanza di replica richiede alcuni minuti, attendere che **Status** diventi **Available** prima di passare ai passaggi successivi. Nel frattempo puoi controllare diversi casi d'uso per AWS DMS descritti nella <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">Webpage AWS DMS</a>
{{% /notice %}}
