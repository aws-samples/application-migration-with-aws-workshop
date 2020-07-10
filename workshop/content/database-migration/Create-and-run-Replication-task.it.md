+++
title = "Crea ed Esegui un Replication Task"
weight = 40
+++

### Crea ed Esegui un Replication Task

Ritorna nella console **AWS DMS** , vai al **Database migration tasks** e clicca sul bottone **Create Task**.

1. Immettere i seguenti valori dei parametri nella schermata **Create database migration task** :

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Checked                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. Nel pannello **Task settings** nserisci i seguenti valori (lascia tutto il resto come predefinito):

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Checked                                             |
    | Enable validation      | Checked                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. Nel pannello **Table mappings** seleziona la modalità **Guided UI** , premi il bottone **Add new selection rule** e seleziona **wordpress-db** nel menu a discesa **Schema**.

    {{% notice note %}}
Se non vedi wordpress-db nel menu a discesa **Schema** , seleziona **Enter schema** e digita **wordpress-db** nel campo **Schema name**.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

1. Scorri fino alla parte inferiore dello schermo e fai clic sul pulsante **Create task** per creare l'attività e avviare la replica dei dati.

    ![create-task-4](/db-mig/create-task-4.png)
