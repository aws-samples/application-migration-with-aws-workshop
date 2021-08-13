+++
title = "ターゲットデータベースの作成"
weight = 10
+++

### データベース移行

データベースの移行には様々な方法がありますが、本ハンズオンでは <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a> を利用した継続的なデータレプリケーションによる移行を行います。

AWS DMS の設定を行う前に、移行先の AWS アカウントで、ターゲットデータベースを作成する必要があります。**AWS Relational Database Service (RDS)** を使用することで、クラウド上でのリレーショナルデータベースのセットアップ、運用、スケーリングを簡単に行うことができます。

### ターゲットデータベース用のサブネットグループの作成

1. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/rds/home?region=us-west-2" target="_blank" rel="noopener noreferrer">RDS</a>** のページを開き、左のメニューから **「サブネットグループ」** を選択します。サブネットグループの一覧が表示されたら、**「DB サブネットグループを作成」** をクリックします。

2.  **「DB サブネットグループを作成」** 画面で、以下のパラメータを入力します：

    | パラメータ           | 入力値                    |
    | ------------------ | ------------------------ |
    | 名前                | database-subnet-group     |
    | 説明                | Subnets where RDS will be deployed |
    | VPC                | 事前準備で作成した VPC を選択 （例：TargetVPC） |
    
    **「サブネットを追加」** セクションで、**「アベイラビリティーゾーン」** に **us-west-2a** と **us-west-2b** を選択、
    **「サブネット」** に **10.0.101.0/24** と **10.0.201.0/24** の CIDR ブロックをもつサブネットを選択し、
    **「作成」** ボタンをクリックします。

    ![RDS Subnet group creation](/db-mig/db-subnet-group.ja.png)    

### ターゲットデータベースの作成

1. ターゲットデータベース用のセキュリティグループを作成します。マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/vpc/home?region=us-west-2" target="_blank" rel="noopener noreferrer">VPC</a>** のページを開き、左のメニューから **「セキュリティ」 → 「セキュリティグループ」** を選択します。セキュリティグループの一覧が表示されたら、**「セキュリティグループを作成」** ボタンをクリックします。

    以下のパラメータを入力して、セキュリティグループを作成します：

    | セキュリティグループ名 | 説明             | VPC                              |
    | ------------------ | ---------------- |----------------------------------|
    | DB-SG              | Target Database security group | 事前準備で作成した VPC を選択 （例：TargetVPC）  |

    ![create-db-sg](/db-mig/create-db-sg.ja.png)

    {{% notice note %}}
後ほど、この VPC セキュリティグループを編集して、DMS レプリケーションインスタンスと Web サーバーから ターゲットデータベースへのアクセスを許可するようにします。
{{% /notice %}}

1. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/rds/home?region=us-west-2" target="_blank" rel="noopener noreferrer">RDS</a>** のページを開き、**「データベースの作成」** をクリックします。

2. **「エンジンのタイプ」** で MySQL、**「バージョン」** で **MySQL 5.7.22** を選択します。

    ![1](/db-mig/1.ja.png)


    {{% notice note %}}
ターゲットデータベースの MySQL バージョンは、ソースデータベースのバージョンに合わせて設定します。
ソースデータベースのバージョンは、次の SQL 文で確認することができます：  
**SELECT @@version;**
{{% /notice %}}

    **「テンプレート」** のセクションで、**無料利用枠** を選択します。

    ![Free tier template selection](/db-mig/create-db-select-template.ja.png)

    {{% notice note %}}
テンプレートに無料利用枠を選択することで、AWS 無料利用枠の制限を超過しないよう、後続のセクションでのオプションが制限されます。
{{% /notice %}}

    **「設定」** のセクションでは、新しいデータベースインスタンスの **DB インスタンス識別子**（例：database-1）、**マスターユーザー名**（例：admin）、および**マスターパスワード**を設定します。

   ![3_db](/db-mig/3_db.ja.png)

   {{% notice note %}}
**マスターユーザー名** と **マスターパスワード** は、後ほど使用しますので、テキストエディタ等にコピーしておいてください。
{{% /notice %}}

   バースト可能クラスから **db.t2.micro** を選択し、ストレージタイプに **汎用 (SSD)** を選択します。
   ストレージ割り当てに **20GiB** を指定し、**「ストレージの自動スケーリングを有効にする」** のチェックを外してください。

   ![4_db](/db-mig/4_db.ja.png)

3. **「可用性と耐久性」** のセクションでは、**「スタンバイインスタンスを作成しないでください」** が選択されていることを確認してください。

    {{% notice note %}}
本番環境のワークロードでは、より高い可用性を実現するために、スタンバイインスタンスを有効にし、<a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">マルチ AZ デプロイメント</a>  を有効にすることをお勧めします。
{{% /notice %}}  

    ![5_db](/db-mig/5_db.ja.png)

4. **「接続」** のセクションでは：

    * **Virtual Private Cloud (VPC)** に、**TargetVPC**（事前準備で自動作成された <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a>） を選択します。
    * **「追加の接続設定」 → 「既存の VPC セキュリティグループ」** で、さきほど作成したセキュリティグループ **DB-SG** を選択します。

    ![6_db](/db-mig/6_db.ja.png)

5. **「データベース認証」** には、**「パスワード認証」** を選択してください。

    ![6_2_db](/db-mig/6_2_db.ja.png)

6. AWS 主催のイベントのみ： **「追加設定」** 内の **「モニタリング」** のセクションで、**「拡張モニタリングの有効化」** のチェックを外してください。

    ![8_db](/db-mig/8_db.ja.png)

    {{% notice note %}}
本番環境のワークロードでは、<a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">拡張モニタリング</a>を有効化することをお勧めしますが、AWS が主催するイベントでは、参加者用にプロビジョニングされている IAM ロールに制限があるため、チェックを外しています。
{{% /notice %}}

7. 最後に、月間コストの見積もりを確認して、**「データベースの作成」** ボタンをクリックします。

   ![8_2_db](/db-mig/8_2_db.ja.png)
