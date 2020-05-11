+++
title = "アプリケーションの設定"
weight = 50

+++

### Target データベースへの接続を設定

カットオーバーが完了し、CloudEndure によって AWS アカウントに Web サーバのインスタンスが作成されたら、
Web アプリケーションが、データベース移行のセクションで作成した **RDS インスタンス**を使用するよう、設定を更新します。

1. **Web サーバのセキュリティグループ**を更新します。

    a. AWS マネジメントコンソール上部の **「サービス」** から **EC2** のページを開き、**Webserver** インスタンスを選択します。  
    b. **パブリック DNS (IPv4)** と **プライベート IP** の値を、テキストエディタにコピーしておきます。
    c. インスタンスに割り当てられている**セキュリティグループ**名をクリックします。

    ![Webserver details](/ce/webserver_details.ja.png)

    d. **「アクション」 → 「インバウンドルールの編集」** を選択し、ポート80（HTTP）に対する任意の場所（0.0.0.0/0）からのトラフィックと、ポート22（SSH）に対するマイIP（自端末の IP アドレス）からのトラフィックを許可するよう、設定を変更します。
    **「ルールの保存」** ボタンをクリックして、インバウンドルールの設定を保存します。

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.ja.png)

2. CloudEndure によって作成された Webserver インスタンスにログインします。

    Source 環境と同じユーザー（ubuntu）と SSH キー（.pem）を使用します。

    SSH を使ってサーバにアクセスする方法がわからない場合は、以下を確認してください：
    - Microsoft Windows をお使いの場合は<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank">こちら</a>
    - Mac OS をお使いの場合は<a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank">こちら</a>

3. Wordpress の設定を更新します。

    /var/www/html/wp-config.php ファイル内の、以下の設定を更新します：

    - DB_HOST - データベース移行のセクションで作成した RDS インスタンスのエンドポイント
    - DB_USER - RDS インスタンス作成時に設定したユーザ名
    - DB_PASSWORD - RDS インスタンス作成時に設定したパスワード

    {{% notice tip %}}
このファイルを編集するには、<a href="https://www.howtoforge.com/linux-nano-command/" target="_blank">nano</a> や <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank">vi</a> などを使用することができます。
{{% /notice %}}     

4. Web サーバからのインバウンドトラフィックを許可するために、RDS インスタンスに紐づけている **VPC セキュリティグループ**を更新します。

    a. AWS マネジメントコンソール上部の **「サービス」** から **EC2** のページを開き、左のメニューから **「セキュリティグループ」** を選択します。RDS インスタンスに紐づけている VPC セキュリティグループ（例：DB-SG）名をクリックします。  
    b. **「インバウンドルール」** のタブを開き、 **「インバウンドのルールの編集」** ボタンをクリックします。  
    c. Web サーバからのトラフィックを許可するインバウンドルールを追加します。Web サーバの**プライベート IP** または**所属するセキュリティグループ**からポート3306に対するトラフィックを許可します。編集が完了したら、**「ルールの保存」** ボタンをクリックします。
    
    ![Inbound rules modification](/ce/database_update_security_group.ja.png)

    {{% notice tip %}}
RDS インスタンスに DB-SG とは別のセキュリティグループ名を使用した場合は、
**「RDS インスタンスの詳細」→「接続とセキュリティ」→「セキュリティ」** のセクションで、セキュリティグループを特定できます。
{{% /notice %}}     
    

5. 移行の検証を行います。

    Web サーバのパブリック DNS（IPv4）名をブラウザで開き、Unicorn ストアが表示されることを確認してください。

アプリケーションが正常に動作していれば、本セクションは完了です！  
[最適化]({{< ref "../optimization/_index.ja.md" >}})のフェーズに進みましょう。

## トラブルシューティング

1. Web サーバの **/var/www/html/wp-config.php** に RDS インスタンスの情報が正しく反映されていることを確認してください。
2. RDS インスタンスのセキュリティグループで、必要な通信が許可されていることを確認してください。
3. Web サーバの **CloudEndure Blueprint** で、Subnet の設定が **TargetVPC** の **public-subnet-b** を指していることを確認してください。
