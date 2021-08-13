+++
title = "配置源数据库"
weight = 30
+++

### 用 Change Data Capture (CDC)模式运行 DMS 复制任务

为了确保数据库迁移的停机时间最少，我们将使用从源数据库到目标数据库的变化数据持续复制模式（**Change Data Capture (CDC)**)。关于 CDC 的更多信息和 **AWS DMS** 原生支持 CDC 细节请参见 <a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank" rel="noopener noreferrer">这篇文章</a>。

#### 在源数据库中启用 binary log

为了实现 **AWS DMS** 从 MySQL 数据库持续复制，您需要在源数据库中启用 binary log 并进行相应的配置更改。

1. 登录到 **源环境数据库** 服务器

    对于 **自行操作的实验** - 访问数据库所需的信息描述在 **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation 模板</a> 的 **输出** 部分。

    ![Database Server login information](/db-mig/db-server-ssh-self-paced.zh.png)    

    对于 **AWS 活动** - 问数据库所需的信息描述见 <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine 仪表板</a> 的 **Database IP**, **Database Username** 和 **Database SSH Key**。

    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    如果您不知道如何使用 SSH 访问服务器，请检查以下内容：
    - 对于微软 Windows 用户，请查看 <a href="https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">这篇文章</a>。
    - 对于 Mac OS 用户，请查看 <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">这篇文章</a>。

2. 为 **wordpress-user** 数据库用户授予额外的权限

    在数据库服务器上运行下面的命令：

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. 为 **bin logs** 创建一个目录

    在数据库服务器上运行下面的命令：

    ```
    sudo su -
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    有关 binary log 的更多信息可以从这里 <a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank" rel="noopener noreferrer">MySQL 文档</a> 找到。

4. 创建和修改 **/etc/mysql/my.cnf** 文件

    运行下面的命令编辑文件：

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    nano /etc/mysql/my.cnf
    ```

    然后将下面的信息加入到 **[mysqld]** 部分，保存文件并退出nano：


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


5. **重启** MySQL 服务使更改生效

    运行下面的命令应用更改：

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
应用更改要求 mysql 服务重启。这将会中断源数据库几秒钟。
{{% /notice %}}    

6. **测试** 更改是否生效

    通过运行下面的命令，确保在 **/etc/mysql/my.cnf** 中的更改生效：

    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    输出必须显示 **BINARY LOGGIN STATUS** 为 **ON**，如下图所示：
    ![expected-results](/db-mig/bin-log-verificaion.png)

    如果确实如此 - 您可以 **退出** SSH 了。如果出现任何问题 - 请检查 **/var/log/mysqld.log** 文件中的错误信息。
