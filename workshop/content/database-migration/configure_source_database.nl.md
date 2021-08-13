+++
title = "Configureer Database in de bronomgeving"
weight = 25
+++

### Gebruik een DMS Replicatie Taak met Change Data Capture (CDC)

Voor minimale downtime tijdens de database migratie, gebruiken we continue replicatie van data (**Change Data Capture (CDC)**) tussen de database in de bronomgeving en de doelomgeving. Voor meer informatie over CDC en CDC ondersteuning in **AWS DMS** kijk naar <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">dit artikel</a>.

#### Configureer binary log op de database in de doelomgeving

Voor **AWS DMS** continue replicatie van de MySQL database, dien je de binary log te configureren op de database in de doelomgeving.

1. Log in op de **Database in de bronomgeving**

    **Zelfstandig uitvoeren** - benoodigde informatie om toegang te krijgen tot de database in de bronomgaving kun je vinden op het **Output** gedeelte van de **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Stack</a>.

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

    Voor **uitvoeren tijdens een AWS Event** - benoodigde informatie om toegang te krijgen tot de database in de bronomgaving kun je vinden onder **Database IP**, **Database Username** en **Database SSH Key** op het <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    Indien je niet zeker weet hoe je SSH gebruikt om op de machine in te loggen, kijk dan naar:
    - Voor Microsoft Windows gebruikers kijk naar <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">dit artikel</a>.  
    - Voor Mac OS gebruikers, kijk naar <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">dit artikel</a>.

2. Configureer toegang voor de **wordpress-user** gebruikersaccount op de database.

    Run de volgende commandos op de database machine:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Maak een nieuwe folder aan voor de **bin logs** 

    Run de volgende commandos op de database machine:

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Meer informatie over de **binary log** kun je vinden in de <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">MySQL documentatie</a>.

4. Creëer en edit **/etc/mysql/my.cnf**

    Run de volgende commandos:

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Voeg de volgende informatie toe onder het **[mysqld]** gedeelte, sla het bestand op en sluit nano af:



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


5. **Herstart** de MySQL service op de machine om de veranderingen te activeren

    In de console, run hetvolgende commando:

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
Het activeren van de veranderingen vergt het herstarten van de mysql service wat de source database voor enkele seconden onbeschikbaar maakt.
{{% /notice %}}    

1. **Verifieer** de varanderingen

    Verifieer dat de veranderingen in **/etc/mysql/my.cnf** actief zijn door middel van de volgende commandos:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    In de output zul je zien dat de **BINARY LOGGIN STATUS** op **ON** staat, zoals in onderstaand voorbeeld:
    
    ![expected-results](/db-mig/bin-log-verificaion.png)

    Indien dit het geval is, kun je SSH afsluiten. Bij problemen, kijk dan naar het bestand **/var/log/mysqld.log** voor foutmeldingen.