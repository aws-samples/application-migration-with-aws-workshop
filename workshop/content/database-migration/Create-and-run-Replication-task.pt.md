+++
title = "Crie e Rode uma Replication Task"
weight = 40
+++

### Configure e Rode uma Replication Task

De volta à console **AWS DMS**, vá até **Database migration tasks** e clique no botão **Create Task**.

1. Entre os seguintes parâmetros na tela **Create database migration task**:

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Checked                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. No painel **Task settings** entre os seguintes valores (deixe tudo como default):

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Checked                                             |
    | Enable validation      | Checked                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. No painel **Table mappings** selecione o modo **Guided UI**, pressione o botão **Add new selection rule** e selecione **wordpress-db** no drop-down **Schema** .

    {{% notice note %}}
Se você não vê o wordpress-db no drop-down **Schema**, selecione **Enter schema** e digite **wordpress-db** no campo **Schema name**.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

1. Role até o fim da tela e clique no botão **Create task** para criar a tarefa e iniciar a replicação dos dados.

    ![create-task-4](/db-mig/create-task-4.png)
