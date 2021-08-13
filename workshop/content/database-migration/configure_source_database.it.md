+++
title = "Configura il Database di origine"
weight = 35
+++

### Esegui DMS Replication Task con Change Data Capture (CDC)

Per garantire tempi di inattività minimi per la migrazione del database, utilizzeremo la replica continua delle modifiche (nota anche come **Change Data Capture (CDC)**) dal database di origine al database di destinazione. Per ulteriori informazioni su CDC e supporto CDC nativo di **AWS DMS** consultare <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">this article</a>.

#### Abilita il binary log sul source database

Per la replica continua **AWS DMS** dal database MySQL, è necessario abilitare il binary log e apportare modifiche alla configurazione sul database di origine.

1. Accedi al server **Source Environment Database** 

    Per il  **laboratorio self-paced** - le informazioni necessarie per accedere all'ambiente Database sono descritte nella sezione **Output** del **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">Template di CloudFormation</a>.

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

    Per **Evento AWS** - le informazioni necessarie per accedere all'ambiente database sono descritte in **Database IP**, **Database Username** e **Database SSH Key** sulla <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Dashboard Team</a>.

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    Se non sei sicuro di come utilizzare SSH per accedere ai server, controlla quanto segue:
    - Per gli utenti di Microsoft Windows visualizzare <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">questo articolo</a>.  
    - Per gli utenti di MacOs visualizzare <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">questo articol</a>.

2. Concedere ulteriori privilegi all'utente del database **wordpress-user**
    Esegui i seguenti comandi sul server database:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Crea una cartella per i **bin logs** 

    Esegui i seguenti comandi sul server database:


    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Ulteriori informazioni sul binary log sono disponibili sulla <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">documentazione MySQL</a>.

4. Crea e modifica il file **/etc/mysql/my.cnf**

    Eseguire il comando seguente per modificare il file:

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

Quindi aggiungere le seguenti informazioni nella sezione **[mysqld]**, salvare il file ed uscire da nano:


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


5. **Restarta** il servizio MySQL per applicare le modifiche

Torna nella console, esegui il comando seguente per applicare le modifiche:

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
L'applicazione di tali modifiche richiede il riavvio del servizio mysql. Ciò interromperà il database di origine per alcuni secondi.
{{% /notice %}}    

1. **Prova** le modifiche

    Assicurati che l'aggiornamento in **/etc/mysql/my.cnf** abbia avuto effetto, eseguendo i seguenti comandi:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    L'output dovrebbe mostrare **BINARY LOGGIN STATUS** settato su **ON**, come nello screenshot qui sotto:
    ![expected-results](/db-mig/bin-log-verificaion.png)

    In tal caso, puoi **uscire** da SSH, in caso di problemi - controlla il file **/var/log/mysqld.log** per errori.