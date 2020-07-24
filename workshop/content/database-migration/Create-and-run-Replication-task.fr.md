+++
title = "Création et exécution de la tâche de réplication"
weight = 40
+++

### Création et exécution de la tâche de réplication

Toujours dans la console **AWS DMS**, allez dans **Database migration tasks** et cliquez sur le bouton **Create Task**.

1. Entrez les paramètres suivants sur l'écran **Create database migration task** :

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Checked                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. Dans le panneau **Task settings** entrez les valeurs suivantes (laisser toutes les autres valeur par défaut) :

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Checked                                             |
    | Enable validation      | Checked                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. Dans le panneau **Table mappings** sélectionnez le mode **Guided UI**, pressez sur le bouton **Add new selection rule** et sélectionnez **wordpress-db** dans la liste déroulante **Schema**.

    {{% notice note %}}
Si vous ne voyez pas wordpress-db dans la liste déroulante **Schema**, sélectionnez **Enter schema** et tapez **wordpress-db** dans le champ **Schema name**.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

1. Paginez jusqu'au bas de la page et cliquez sur le bouton **Create task** pour créer la tâche et démarrer la réplication des données.

    ![create-task-4](/db-mig/create-task-4.png)

Quand la tâche s'exécute, vous pouvez voir en détail les tables et le nombre de lignes qui sont répliqués.