+++
title = "Configurar la base de datos de origen"
weight = 25
+++

### Ejecute la tarea de replicación DMS con Change Data Capture (CDC)

Para garantizar un tiempo de inactividad mínimo para la migración de la base de datos, vamos a utilizar la replicación continua de los cambios (también conocida como **Change Data Capture (CDC)**)de la base de datos de origen a la base de datos de destino. Para obtener más información sobre CDC y la compatibilidad nativa de CDC de **AWS DMS** consulte <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">este artículo</a>.

#### Habilite el registro binario en la base de datos de origen

Para la replicación continua de **AWS DMS** desde la base de datos MySQL, deberá habilitar el registro binario y realizar cambios de configuración en la base de datos de origen.

1. Inicie sesión en el servidor de la **base de datos del entorno de origen**

    Para el **laboratorio a su propio ritmo** - la información necesaria para acceder al entorno de la base de datos se describe en la sección **Outputs** de la <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">plantilla de CloudFormation </a> **ApplicationMigrationWorkshop**.

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

    Para **eventos de AWS** - la información necesaria para acceder al entorno de la base de datos se describe en **IP de la base de datos, nombre de usuario de la base de datos y clave SSH de la base de datos** en el <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">panel del equipo</a>.

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    Si no está seguro de cómo usar SSH para acceder a los servidores, verifique lo siguiente:
    - Para usuarios de Microsoft Windows, vea  <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">este artículo</a>.  
    - Para usuarios de Mac OS, vea <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">este artículo</a>.

2. Otorgue privilegios adicionales al usuario de la base de datos de  **wordpress-user**

    Ejecute los siguientes comandos en el servidor de bases de datos:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Cree una carpeta para los  **registros de bin** 

    Ejecute los siguientes comandos en el servidor de bases de datos:

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Puede encontrar más información sobre el registro binario en la <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">documentación de MySQL</a>.

4. Cree y modifique el archivo **/etc/mysql/my.cnf**

    Ejecute lo siguiente para editar el archivo:

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Luego agregue la siguiente información en la sección **[mysqld]**, guarde el archivo y salga de nano:



    ```
    server_id=1
    log-bin=/var/lib/mysql/binlogs/log
    binlog_format=ROW
    expire_logs_days=1
    binlog_checksum=NONE
    binlog_row_image=FULL
    log_slave_updates=TRUE
    performance_schema=ON
    ```


5. **Reinicie** el servicio MySQL para aplicar los cambios.

    De vuelta en la consola, ejecute el siguiente comando para aplicar los cambios:

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
la aplicación de esos cambios requiere el reinicio del servicio mysql. Esto interrumpirá la base de datos de origen durante unos segundos.
{{% /notice %}}    

6. **Pruebe** los cambios

    Asegúrese de que la actualización en **/etc/mysql/my.cnf** surtió efecto ejecutando los siguientes comandos:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    La salida debe mostrar el **BINARY LOGGIN STATUS** en **ON**, como en la siguiente captura de pantalla:
    ![expected-results](/db-mig/bin-log-verificaion.png)

    Si ese es el caso, puede **salir** del SSH, en caso de problemas, revise el archivo **/var/log/mysqld.log** para ver si hay errores.