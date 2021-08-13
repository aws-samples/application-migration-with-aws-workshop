+++
title = "Konfigurieren Sie die Quelldatenbank"
weight = 35
+++

### Führen Sie die DMS-Replikationstask mit CDC (Change Data Capture) aus.

Um minimale Ausfallzeiten für die Datenbankmigration sicherzustellen, 
verwenden wir die kontinuierliche Replikation von Änderungen (auch als **Change Data Capture (CDC)** bezeichnet) 
von der Quellendatenbank in die Zieldatenbank. 
Weitere Informationen zur CDC- und nativen CDC-Unterstützung von **AWS DMS** 
finden Sie unter <a href = "https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/ "target =" _ blank ">dieser Artikel</a>.

#### Aktivieren Sie das Binärprotokoll (binary log) in der Quellendatenbank

Für eine kontinuierliche Replikation über **AWS DMS** aus der MySQL-Datenbank 
müssen Sie das Binärprotokoll aktivieren und Konfigurationsänderungen 
an der Quellendatenbank vornehmen.

1. Login zu **Source Environment Database** Server

Für **self paced lab** - die Informationen, die für den Zugriff auf die Datenbankumgebung 
erforderlich sind, werden im Abschnitt **Output** des **ApplicationMigrationWorkshop** CF Stack 
<a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a> zu finden sein.
    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

Für **AWS Event** - die Informationen, die für den Zugriff auf die Datenbankumgebung erforderlich sind, 
finden Sie unter **Datenbank-IP**, **Datenbank-Benutzername** und **Datenbank-SSH-Schlüssel** 
auf der <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

   ![Database Server login information](/db-mig/db-server-ssh-event.png)

    Wenn Sie nicht sicher sind, wie Sie mit SSH auf Server zugreifen sollen, probieren Sie Folgendes aus:
    - Microsoft Windows Benutzer <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>.  
    - Mac OS und Linux Benutzer <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>.

2. Geben Sie zusätzliche Rechte (Grant) den **wordpress-user** Datenbank-Benutzer

    Führen Sie folgende Kommandos auf dem Datenbankserver aus:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Erstellen Sie ein Verzeichnis für die Binärelogs **bin logs** 

    Führen Sie folgende Kommandos auf dem Datenbankserver aus:

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Mehr Informationen zum **binary log** finden sie bei <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">MySQL-Dokumentation</a>.

4. Erstellen Sie bitte oder ändern Sie **/etc/mysql/my.cnf** Datei

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Fügen Sie dann die folgenden Informationen bei **[mysqld]** hinzu, 
    speichern Sie die Datei und beenden Sie nano editor.

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

5. Starten Sie MySQL Dienst neu

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
Um die Änderungen zu aktivieren müssen sie den MySQL-Diensts neustarten.
Dadurch wird die Quellendatenbank für einige Sekunden nicht verfügbar.
{{% /notice %}}    

1. Die Änderungen testen.

    Um sicherzustellen, dass die Änderungen in **/etc/mysql/my.cnf** funktionieren, 
    führen Sie bitte folgende Kommandos aus:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    Das Ergebnis muss **BINARY LOGGIN STATUS** gleich **ON** sein, wie an dem Bild unten:
    ![expected-results](/db-mig/bin-log-verificaion.png)

    Wenn es übereinstimmt, dann können Sie jetzt die SSH Verbindung schließen. 
    Wenn es nicht geklappt hat, dann überprüfen Sie die Log-Dateien **/var/log/mysqld.log** auf Fehlermeldungen.