+++
title = "Create and Run a Replication Task"
weight = 40
+++

### Configure and Run a Replication Task

Still in the **AWS DMS** console, go to **Database migration tasks** and click the **Create Task** button.

1. Enter the following parameter values in the **Create database migration task** screen:

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Checked                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. In the **Task settings** panel enter the following values (leave everything else as default):

    | Parameter              | Value                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Checked                                             |
    | Enable validation      | Checked                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. In the **Table mappings** panel select **Wizard** mode, press the **Add new selection rule** button and select **wordpress-db** in the **Schema** drop-down.

    {{% notice note %}}
If you don't see wordpress-db on the **Schema** drop-down, select **Enter schema** and type **wordpress-db** into the **Schema name** field.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

1. Scroll to the bottom of the screen and click the **Create task** button to create the task and start the data replication.

    ![create-task-4](/db-mig/create-task-4.png)

When the task is running, you can review it's details to see information about tables and number of rows that are replicated.