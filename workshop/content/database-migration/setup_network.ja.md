+++
title = "ネットワークの設定"
weight = 15
+++

本ハンズオンでは VPN や AWS Direct Connect を使用しないため、AWS Database Migration Service （DMS）のレプリケーションインスタンスは、ソースデータベースにはパブリックインターネット経由で接続し、ターゲットデータベースにはプライベートネットワーク経由で接続する必要があります。

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### レプリケーションサブネットグループの作成

AWS DMS を利用するための最初のステップとして、**DMS レプリケーションインスタンス** で使用するサブネットの集合体である、**サブネットグループ** を設定する必要があります。

1. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/dms/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Database Migration Service (DMS)</a>** のページを開き、左のメニューから **「サブネットグループ」** をクリックします。
2. **「サブネットグループの作成」** ボタンをクリックします。
3. **「レプリケーションサブネットグループの作成」** では、次のパラメータを入力します。

    | パラメータ           | 入力値                    |
    | ------------------- | ------------------------ |
    | 名前                 | dms-subnet-group     |
    | 説明                 | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | サブネットの追加       | **TargetVPC-public-a**、 **TargetVPC-public-b** を選択|

    ![Replication-instance-networ](/db-mig/subnet-group.ja.png)

4. **「サブネットグループの作成」** ボタンをクリックします。

### セキュリティグループの設定

次に、ハンズオンで使用する **Virtual Private Cloud (VPC) セキュリティグループ** で、DMS レプリケーションインスタンスから ターゲットデータベース（前頁で作成したデータベースインスタンス）へのインバウンドトラフィックを許可する必要があります。

1. **DMS レプリケーションインスタンス** 用のセキュリティグループを作成します。

    a. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、左のメニューから **「セキュリティグループ」** をクリックします。

    b. **「セキュリティグループの作成」** ボタンをクリックします。

    c. **セキュリティグループ名**（例：RI-SG）と**説明**を入力、VPC には **TargetVPC** を選択し、 **「セキュリティグループの作成」** ボタンをクリックします。

    ![Replication-instance-network](/db-mig/ri-sg.ja.png)

    {{% notice note %}}
  **DMS レプリケーションインスタンス**用のセキュリティグループ（例：RI-SG）にインバウンドルールを追加する必要はありません。
  {{% /notice %}}

2. **DB-SG** セキュリティグループにインバウンドルールを追加します。

    a. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、左のメニューから **「セキュリティグループ」** をクリックします。
  
    b. 前頁で作成したデータベースインスタンス用のセキュリティグループ **DB-SG** の**セキュリティグループ ID** をクリックします。
    
    c. DB-SG セキュリティグループの詳細画面で、**「インバウンドのルールの編集」** ボタンを押します。
      
    d. **「インバウンドのルールの編集」** 画面で、**「ルールを追加する」** ボタンをクリックし、DMS レプリケーションインスタンス用のセキュリティグループ（例：RI-SG）から、ポート3306に対するインバウンドトラフィックを許可するルールを構成し、**「ルールの保存」** ボタンをクリックします。
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.ja.png)
