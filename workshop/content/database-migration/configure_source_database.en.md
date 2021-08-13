+++
title = "Configure Source Database"
weight = 25
+++

### Run DMS Replication Task with Change Data Capture (CDC)

To ensure minimal downtime for the database migration, we're going to use continuous replication of changes (also known as **Change Data Capture (CDC)**) from the source database to the target database. For more information about CDC and native CDC support of **AWS DMS** see <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">this article</a>.

#### Enable binary log on the source database

For **AWS DMS** continuous replication from MySQL database, you'll need to enable the binary log and make configuration changes on the source database.

1. Login to the **Source Environment Database** server

    For **self-paced lab** - information needed to access the Database environment is described in the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

    For **AWS Event** - information needed to access the Database environment is described at **Database IP**, **Database Username** and **Database SSH Key** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    If you're not sure how to use SSH to access servers, check the following:
    - For Microsoft Windows users view <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>.  
    - For Mac OS users view <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>.

2. Grant additional privileges to the **wordpress-user** database user

    Run the following commands on the database server:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Create a folder for the **bin logs** 

    Run the following commands on the database server:

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    More information on the binary log can be found in the <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">MySQL documentation</a>.

4. Create and modify **/etc/mysql/my.cnf** file

    Run the following to edit the file:

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Then add the following information under the **[mysqld]** section, save the file and exit nano:



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


5. **Restart** MySQL service to apply changes

    Back in the console, run the following command to apply the changes:

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
Applying those changes requires mysql service restart. This will interrupt the source database for a few seconds.
{{% /notice %}}    

1. **Test** the changes

    Make sure the update in **/etc/mysql/my.cnf** took effect, by running the following commands:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    The output must show the **BINARY LOGGIN STATUS** set to **ON**, as on the screenshot below:
    ![expected-results](/db-mig/bin-log-verificaion.png)

    If that's the case - you can **exit** from the SSH, in case of problems - check the **/var/log/mysqld.log** file for errors.