+++
title = "Crear instancia de replicación"
weight = 20
+++

### Crear grupo de subred de replicación

Uno de los requisitos previos para usar **AWS DMS** es haber configurado **un grupo de subredes**, que es una colección de subredes que utilizará la **instancia de replicación de DMS**. 

1. Vaya a la **Consola de AWS > Services > Database Migration Service > Subnet groups** y haga clic en el botón **Create subnet group**.
2. En **Create replication subnet group** ingrese los siguientes valores de parámetros:

    | Parámetros           | Valor                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Grupo de subred VPC predeterminado para DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | seleccione **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.png)

3. Haga clic en el botón  **Create subnet group**

### Crear instancia de replicación de AWS DMS

En este paso, creará una instancia de replicación para <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service</a> que inicia la conexión entre las bases de datos de origen y destino, transfiere los datos y almacena en caché cualquier cambio que ocurra en la base de datos de origen durante la carga de datos inicial.


1. Dentro de la  **Consola de AWS**, vaya a **Services** y **Database Migration Service**.  

2. Haga clic en **Replication instances** y luego en el botón **Create replication instance**.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. En la pantalla **Create replication instance**,configure una nueva instancia de replicación con los siguientes valores de parámetros::

    | Parámetros           | Valor                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | Instancia de replicación DMS |
    | Instance Class      | dms.t2.medium            |
    | Engine version      | 3.3.3                    |
    |Allocated storage (GB)| 50                      |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Desmarcado                |
    | Publicly accessible | Marcado                  |

    Como en la captura de pantalla a continuación.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    En **Advanced security and network configuration**, asegúrese de seleccionar el grupo de subred de replicación, la zona de disponibilidad (us-west-2a) y el grupo de seguridad de instancia de replicación que creó anteriormente.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Haz clic en el botón **Create**.

