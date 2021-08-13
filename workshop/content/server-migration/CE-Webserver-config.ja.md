+++
title = "アプリケーションの設定"
weight = 50

+++

### ターゲットデータベースへの接続を設定

カットオーバーが完了し、CloudEndure によって AWS アカウントに Web サーバーのインスタンスが作成されたら、
Web アプリケーションが、データベース移行のセクションで作成した **Amazon Relational Database Service (RDS) インスタンス**を使用するよう、設定を更新します。

1. **Web サーバーのセキュリティグループ**を更新します。

    a. AWS マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、**Webserver** インスタンスを選択します。  
    b. **パブリック DNS (IPv4)** と **プライベート IP** の値を、テキストエディタにコピーしておきます。  
    c. インスタンスに割り当てられている**セキュリティグループ**名をクリックします。

    ![Webserver details](/ce/webserver_details.ja.png)

    d. **「アクション」 → 「インバウンドルールの編集」** を選択し、ポート80（HTTP）に対する任意の場所（0.0.0.0/0）からのトラフィックと、ポート22（SSH）に対するマイIP（自端末の IP アドレス）からのトラフィックを許可するよう、設定を変更します。
    **「ルールの保存」** ボタンをクリックして、インバウンドルールの設定を保存します。

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.ja.png)

2. CloudEndure によって作成された Webserver インスタンスにログインします。

    ソース環境と同じユーザー（ubuntu）と SSH キー（.pem）を使用します。

    SSH を使ってサーバーにアクセスする方法がわからない場合は、以下を確認してください：
    - Microsoft Windows をお使いの場合は<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">こちら</a>
    - Mac OS をお使いの場合は<a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">こちら</a>

3. WordPress の設定を更新します。

    /var/www/html/wp-config.php ファイル内の、以下の設定を更新します：

    - DB_HOST - データベース移行のセクションで作成した RDS インスタンスのエンドポイント
    - DB_USER - RDS インスタンス作成時に設定したユーザー名
    - DB_PASSWORD - RDS インスタンス作成時に設定したパスワード

    以下のコマンドを実行し、設定ファイルを vi エディタで開きます：
    ```
    sudo su -
    vi /var/www/html/wp-config.php
    ```

    以下の設定を更新した後、ファイルを保存し vi エディタを終了します：
    ```
    /** MySQL database username */
    define( 'DB_USER', 'ユーザー名' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'パスワード' );

    /** MySQL hostname */
    define( 'DB_HOST', 'RDS インスタンスのエンドポイント' );
    ```

4. Web サーバーからのインバウンドトラフィックを許可するために、RDS インスタンスに紐づけている **Virtual Private Cloud (VPC) セキュリティグループ**を更新します。

    a. AWS マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、左のメニューから **「セキュリティグループ」** を選択します。RDS インスタンスに紐づけている VPC セキュリティグループ（例：DB-SG）名をクリックします。  
    b. **「インバウンドルール」** のタブを開き、 **「インバウンドのルールの編集」** ボタンをクリックします。  
    c. Web サーバーからのトラフィックを許可するインバウンドルールを追加します。Web サーバーの**プライベート IP** または**所属するセキュリティグループ**からポート3306に対するトラフィックを許可します。編集が完了したら、**「ルールの保存」** ボタンをクリックします。
    
    ![Inbound rules modification](/ce/database_update_security_group.ja.png)

    {{% notice tip %}}
RDS インスタンスに DB-SG とは別のセキュリティグループ名を使用した場合は、
**「RDS インスタンスの詳細」→「接続とセキュリティ」→「セキュリティ」** のセクションで、セキュリティグループを特定できます。
{{% /notice %}}     
    

5. 移行の検証を行います。

    Web サーバーのパブリック DNS（IPv4）名をブラウザで開き、Unicorn ストアが表示されることを確認してください。

アプリケーションが正常に動作していれば、本セクションは完了です！  
[コンテナへの移行]({{< ref "../container-migration/_index.ja.md" >}})に進みましょう。

## トラブルシューティング

1. Web サーバーの **/var/www/html/wp-config.php** に RDS インスタンスの情報が正しく反映されていることを確認してください。
2. RDS インスタンスのセキュリティグループで、必要な通信が許可されていることを確認してください。
3. Web サーバーの **CloudEndure Blueprint** で、Subnet の設定が **TargetVPC** の **public-subnet-b** を指していることを確認してください。
