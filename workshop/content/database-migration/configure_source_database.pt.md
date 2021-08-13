+++
title = "Configure o Source Database (origem)"
weight = 35
+++

### Rode a tarefa DMS Replication Task com Change Data Capture (CDC)

Para garantir mínimo impacto na migração do banco de dados, nós usaremos replicação contínua das mudanças (também conhecida como **Change Data Capture (CDC)**) a partir do banco de dados origem. Para mais informações sobre CDC e o suporte do CDC pelo **AWS DMS** veja <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer"> este artigo</a>.

#### Habilite binary log (log binário) no banco de dados origem

Para a replicação contínua do **AWS DMS** a partir do MySQL database, você precisará habilitar o binary log e mudar algumas configurações no banco de dados origem.

1. Login no servidor **Source Environment Database** (origem)

    Para quem estiver fazendo **o lab por conta própria** - a informação necessária para acessar o banco de dados está descrita na seção **Output**  do <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">template CloudFormation **ApplicationMigrationWorkshop** </a>.

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.png)    

    Para quem estiver participando de um **Evento AWS** - a informação necessária para acessar o banco de dados está descrita nas seções **Database IP**, **Database Username** e **Database SSH Key** do <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    Caso não saiba como acessar o servidor via SSH, cheque:
    - Para usuários de Microsoft Windows veja <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">este artigo</a>.  
    - Para usuários de Mac OS veja <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">este artigo</a>.

2. Dê privilégios adicionais para o usuário do banco de dados chamado **wordpress-user** 

    Rode os seguintes comandos no servidor de banco de dados:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. Crie uma pasta para os **bin logs** 

    Rode os seguintes comandos no servidor de banco de dados:

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    Mais informações sobre binary log podem ser encontradas na <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">documentação do MySQL</a>.

4. Crie e modifique o arquivo **/etc/mysql/my.cnf** 

    Rode os seguintes comandos no servidor para editar o arquivo:

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    Então adicione a seguinte informação na seção **[mysqld]**, salve o arquivo e saia do nano:



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


5. **Reinicie** o serviço MySQL para aplicar as mudanças

    Na console, rode o seguinte comando para aplicar as mudanças:

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
Para aplicar as alterações é necessário reiniciar o mysql service. Isso irá parar o banco de dados por alguns momentos.
{{% /notice %}}    

6. **Teste** as mudanças

    Certifique que as alterações no **/etc/mysql/my.cnf** foram efetuadas rodando os comandos:

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    O output deverá mostrar **BINARY LOGGIN STATUS** configurado para **ON**, como na imagem abaixo:
    ![expected-results](/db-mig/bin-log-verificaion.png)

    Caso esteja tudo bem você pode **exit** (sair) do SSH, em caso de problemas: cheque o **/var/log/mysqld.log** para erros.