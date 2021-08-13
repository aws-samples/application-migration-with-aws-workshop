+++
title = "Configuration de la base de données source"
weight = 25
+++

### Exécution de la réplication DMS avec le Change Data Capture (CDC)

Afin de minimiser l'interruption de service durant la migration de la base de données, nous allons utiliser la réplication continue des changements (nommé **Change Data Capture (CDC)**) à partir de la base de données source vers la base de données cible. Pour plus d'information à propos de CDC et le support natif de CDC de **AWS DMS** consultez <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">cet article</a>.

#### Activez les log sur la base de données source

Pour la réplication continue de  **AWS DMS** à partir d'une base de données MySQL, vous devez activer les logs et effectuer un changement de configuration sur la base de données source. 

1. Connectez vous sur le server **Base de données source**

    Pour **le lab réalisé de manière indépendante** - les informations nécessaires pour accéder à l'environnement base de données sont décrites dans la section **Output** du "Template" **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>.

    ![Informations de connexion à la base de données](/db-mig/db-server-ssh-self-paced.png)    

    Pour **Le lab réalisé lors d'un évènement organisé par AWS** - les informations nécessaires pour accéder à l'environnement base de données sont décrites dans **Database IP**, **Database Username** et **Database SSH Key** sur le<a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Tableau de bord d'équipe (Team Dashboard)</a>.

    ![Informations de connexion à la base de données](/db-mig/db-server-ssh-event.png)

    Si vous ne savez pas comment utiliser une clé SSH pour accéder à un serveur, consultez les liens suivants :
    - Pour les utilisateurs Micrisift Windows consultez <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">cet article</a>.  
    - Pour les utilisateurs Mac OS consulmtez <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">cet article</a>.

2. Ajouter des privilègesà l'utilisateur de base de données **wordpress-user**

    Exécutez les commandes suivantes sur le serveur de base de données :

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Créez un répertoire pour les **bin logs** 

    Exécutez les commandes suivantes sur le serveur de base de données :

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Vous pouvez trouver plus d'informations sur les log dans la <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">documentation MySQL</a>.

4. Créer et modifier le fichier **/etc/mysql/my.cnf**

    Exécutez les commandes suivantes pour éditer le fichier :

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Enfin, ajoutez les informations suivantes sous la section **[mysqld]**, sauvegardez le fichier et quittez nano :



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


5. **Redémarrez** le service MySQL pour predre en compte les changements

    De retour sur la console, exécutez la commande suivante pour prendre en compte les changements :

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
L'application de ces changememnts requiert un redémarrage du service MySQL. Ceci va interrompre le service de base de données source pour quelques secondes.
{{% /notice %}}    

1. **Testez** les changements

    Assurez-vous que la mise à jour dans **/etc/mysql/my.cnf** a pris effet, en exécutant les commandes suivantes :

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    Le résultat doit montrer le **BINARY LOGGIN STATUS** positionné à **ON**, comme dans la copie d'écran suivante :
    ![expected-results](/db-mig/bin-log-verificaion.png)

    Si c'est le cas, vous pouvez **quitter** SSH, en cas de problème - vérifiez le fichier **/var/log/mysqld.log** pour les erreurs.