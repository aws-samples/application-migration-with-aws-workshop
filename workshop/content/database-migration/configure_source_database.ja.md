+++
title = "ソースデータベースの設定"
weight = 35
+++

### Change Data Capture (CDC) を使用した DMS レプリケーションタスクの実行

データベース移行のダウンタイムを最小限に抑えるために、ソースデータベースから ターゲットデータベースへの継続的なレプリケーション（Change Data Capture, CDC）を利用します。AWS Database Migration Service (DMS) における CDC とネイティブ CDC のサポートについては、<a href="https://aws.amazon.com/blogs/database/aws-dms-now-supports-native-cdc-support/" target="_blank">こちらの記事</a>を参照してください。

#### ソースデータベースでのバイナリログ有効化

MySQL データベース から **AWS DMS** で継続的なレプリケーションを行う場合は、バイナリログを有効化し、ソースデータベースの設定変更を行う必要があります。

1. ソースデータベースサーバーにログインします。

    **自身の環境**でハンズオンを実施している場合、接続に必要な情報は <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank">CloudFormation スタック</a>（**ApplicationMigrationWorkshop**）の**出力**セクションに表示されています。
    
    ![Database Server login information](/db-mig/db-server-ssh-self-paced.ja.png)

    **AWS 主催のイベント**の場合、Event Engine の <a href="https://dashboard.eventengine.run/dashboard" target="_blank">Team Dashboard</a> に表示されている **Database Server IP**、**Database Server Username** および **Database SSH Key** を使用してください。
    
    ![Database Server login information](/db-mig/db-server-ssh-event.png)

    SSH を使ってサーバーにアクセスする方法がわからない場合は、以下を確認してください：
    - Microsoft Windows をお使いの場合は<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank">こちら</a>
    - Mac OS をお使いの場合は<a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank">こちら</a>

2. **wordpress-user** データベースユーザに追加の権限を付与します。

    データベースサーバーで、以下のコマンドを実行します：

    ```
    sudo mysql -u root -pAWSRocksSince2006

    GRANT REPLICATION CLIENT ON *.* to 'wordpress-user';
    GRANT REPLICATION SLAVE ON *.* to 'wordpress-user';
    GRANT SUPER ON *.* to 'wordpress-user';
    exit
    ```

3. **バイナリログ**用のディレクトリを作成します。 

    データベースサーバーで、以下のコマンドを実行します：

    ```
    sudo su - 
    mkdir /var/lib/mysql/binlogs
    chown -R mysql:mysql /var/lib/mysql/binlogs
    exit
    ```

    バイナリログの詳細については、<a href="https://dev.mysql.com/doc/refman/8.0/en/binary-log.html" target="_blank">MySQL のドキュメント</a>を参照してください。

4.  **/etc/mysql/my.cnf** ファイルを作成し、編集します。

    以下のコマンドを実行し、設定ファイルを vi エディタで開きます：

    ```
    sudo su -
    cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/my.cnf
    chown -R mysql:mysql /etc/mysql/my.cnf
    vi /etc/mysql/my.cnf
    ```

    **[mysqld]** セクションに以下の設定を追記、ファイルを保存し vi エディタを終了します：

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


5. 変更した設定を適用するため、**MySQL** サービスを再起動します。

    以下のコマンドを実行し、変更を適用します：

    ```
    sudo service mysql restart
    ```

    {{% notice warning %}}
変更を適用するには、mysql サービスの再起動が必要です。これにより数秒間、ソースデータベースへのアクセスが中断されます。
{{% /notice %}}    

6. 変更点のテストを実施します。

    以下のコマンドを実行して、**/etc/mysql/my.cnf** の更新内容が有効になったことを確認します：
    ```
    sudo mysql -u root -pAWSRocksSince2006

    select variable_value as "BINARY LOGGING STATUS (log-bin) :: "
     from performance_schema.global_variables where variable_name='log_bin';

    select variable_value as "BINARY LOG FORMAT (binlog_format) :: "
     from performance_schema.global_variables where variable_name='binlog_format';

    exit
    ```

    以下のスクリーンショットのように、**BINARY LOGGING STATUS** の値が **ON** に設定されていることを確認してください。
    ![expected-results](/db-mig/bin-log-verificaion.png)

    上記の確認で問題がなければ、SSH での接続を終了してください。問題が発生した場合は /var/log/mysqld.log を参照し、エラーが発生していないか確認してください。