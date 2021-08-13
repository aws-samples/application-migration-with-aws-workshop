+++
title = "Crear base de datos de destino"
weight = 15
+++

### Migración de base de datos

Las migraciones de bases de datos se pueden realizar de varias maneras, y para el propósito de este taller realizaremos una migración **continua de replicación de datos** utilizando <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

Antes de configurar **AWS DMS**, deberá crear su base de datos de destino en la cuenta de AWS proporcionada. Use **AWS Relational Database Service (RDS)** para realizar esta actividad, lo que facilita la configuración, el funcionamiento y el escalado de una base de datos relacional en la nube.

### Crear el grupo de subred para la base de datos de destino

1. Vaya a la **Consola de AWS**, en **Services** elija **RDS**, seleccione **Subnet groups** en el menú de la izquierda y haga clic en **Create DB Subnet Group**

2. En **Create DB subnet group** ingrese la siguiente información

    | Parámetro           | Valor                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subredes donde se implementará RDS |
    | VPC      | TargetVPC            |
    
    En el panel de **Add subnets**, agregue una subred de cada zona de disponibilidad (us-west-2a y us-west-2b) con los CIDRs 10.0.101.0/24 y 10.0.201.0/24, luego presione el botón **Create**.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Crear la base de datos de destino    
    
1. Ahora seleccione **Databases** en el menú de la izquierda y haga clic en **Create database** 

2. En **Engine options**, seleccione MySQL y Versión MySQL 5.7.33

    ![1](/db-mig/1.png)


    {{% notice note %}}
Puede confirmar la versión fuente de MySQL desde la base de datos de origen usando la consulta SQL - **SELECT@@version;**
{{% /notice %}}


    En la sección **Template** seleccione "Free Tier".

    ![Free tier template selection](/db-mig/create-db-select-template.en.png)

    {{% notice note %}}
La elección de la plantilla "Free Tier" limita sus opciones en los próximos pasos del asistente, de modo que se mantenga dentro de los límites del nivel gratuito de AWS.
{{% /notice %}}


    En la sección **Settings**, configure el identificador de instancia de base de datos (por ejemplo, database-1), el nombre de usuario maestro (por ejemplo, admin) y la contraseña maestra para su nueva instancia de base de datos.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Asegúrese de escribir el nombre de **usuario y la contraseña maestra**, ya que la usará más adelante.
{{% /notice %}}

    Seleccione **db.t2.micro** de la clase de instancia Burstable DB, **General Purpose (SSD)** para tipo de almacenamiento y desmarque "Enable storage autoscaling" (no necesitamos más de 20 GB de almacenamiento para esta base de datos).
    ![4_db](/db-mig/4_db.png)

    

3. Para la **Disponibilidad y Durabilidad (Availability & durability)**, mantenga seleccionada la opción **Do not create a standby instance**. 

    ![5_db](/db-mig/5_db.png)

    {{% notice note %}}
Para las cargas de trabajo de producción, recomendamos habilitar la instancia en espera para habilitar <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">la implementación Multi-AZ</a> para una mayor disponibilidad.
{{% /notice %}}  

4. En la sección de **Connectivity**:

    * En **Virtual Private Cloud (VPC)**, seleccione **TargetVPC** (esta es la <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">nube privada virtual de Amazon</a> que se creó automáticamente para este laboratorio)
    * En **Additional connectivity configuration -> VPC Security Group**, seleccione **Create new** grupo de seguridad VPC y asígnele un nombre (por ejemplo, "DB-SG").
    * Tenga en cuenta que el grupo de subred de base de datos que ha creado anteriormente se seleccionará automáticamente

    ![6_db](/db-mig/6_db.png)


    {{% notice note %}}
Más adelante editará el grupo de seguridad DB-SG VPC para asegurarse de que la instancia de replicación DMS pueda acceder a la base de datos de destino y permitir el acceso desde su servidor web.
{{% /notice %}}

5. Para la **Database authentication**, elija **Password authentication**.
6. (Solo eventos alojados por AWS) En la  **Additional configuration**, asegúrese de desmarcar **Enable Enhanced monitoring** en la sección **Monitoring** como se indica a continuación:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
El uso de la supervisión mejorada <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">(Enhanced monitoring)</a> es una muy buena idea para las cargas de trabajo de producción, durante los eventos alojados en AWS lo desmarcamos debido a las limitaciones del rol de IAM que se aprovisionó para los asistentes.
{{% /notice %}}

7. Finalmente, revise los  **costos mensuales estimados** y haga clic en el botón **Create database**. 

   ![8_2_db](/db-mig/8_2_db.png)
