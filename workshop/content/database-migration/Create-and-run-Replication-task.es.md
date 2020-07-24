+++
title = "Crear y ejecutar una tarea de replicación"
weight = 40
+++

### Crear y ejecutar una tarea de replicación

Aún en la consola de **AWS DMS** console, vaya a **Database migration tasks** y haga clic en el botón **Create Task**.

1. Ingrese los siguientes valores de parámetros en la pantalla **Create database migration task**:

    | Parámetros              | Valor                                               |
    | ---------------------- | --------------------------------------------------- |
    | Task identified        | replication-cdc                                     |
    | Replication instance   | replication-instance                                |
    | Source endpoint        | source-endpoint                                     |
    | Target endpoint        | target-endpoint                                     |
    | Migration type         | Migrate existing data and replicate ongoing changes |
    | Start task on create   | Marcado                                             |
    
    ![Create-task-1](/db-mig/Create-task-1.png)

2. En el panel de **Task settings**, ingrese los siguientes valores (deje todo lo demás como predeterminado):

    | Parámetros              | Valor                                               |
    | ---------------------- | --------------------------------------------------- |
    | Target table preparation mode          |  Do nothing          |
    | Enable CloudWatch logs | Marcado                                             |
    | Enable validation      | Marcado                                             |                 
    
    ![create-task-2](/db-mig/create-task-2.png)
    
3. En el panel **Table mappings**, seleccione el modo de **Guided UI**, presione el botón **Add new selection rule** y seleccione **wordpress-db** en el menú desplegable **Schema**.

    {{% notice note %}}
Si no ve wordpress-db en el menú desplegable **Schema**, seleccione **Enter schema** y escriba **wordpress-db** en el campo **Schema name**.
{{% /notice %}}    

    ![Create-task-3](/db-mig/Create-task-3.png)

4. Desplácese hasta la parte inferior de la pantalla y haga clic en el botón **Create task** para crear la tarea e iniciar la replicación de datos.

    ![create-task-4](/db-mig/create-task-4.png)

Cuando la tarea se está ejecutando, puede revisar sus detalles para ver información sobre las tablas y el número de filas que se replican.