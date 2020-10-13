+++
title = "Creëer en start de Replicatie Taak"
weight = 40
+++

### Creëer en start de Replicatie Taak

Terug in de **AWS DMS** console, ga naar **Database migration tasks** en druk op **Create Task**.

1. Voer de volgende parameters in in het **Create database migration task** scherm:

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Checked                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. Onder **Task settings** voer de volgende parameters in (laat alle andere parameters op de standaardinstellingen staan):

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Checked                                             |
    | Enable validation      | Checked                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. In de **Table mappings** sectie, kies **Guided UI** mode, klik op **Add new selection rule** en kies **wordpress-db** in de **Schema** drop-down lijst.

    {{% notice note %}}
Indien je de **wordpress-db** niet ziet in de **Schema** drop-down lijst, kies dan **Enter schema** en typ **wordpress-db** in het **Schema name** veld.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

1. Scroll naar het einde van het scherm en druk op de **Create task** knop om de taak aan te maken en de replicatie te starten.

    ![create-task-4](/db-mig/create-task-4.png)

Wanneer de taak draait, kun je de details bekijken om informatie te krijgen over de tabellen en aantal regels die zijn overgezet.