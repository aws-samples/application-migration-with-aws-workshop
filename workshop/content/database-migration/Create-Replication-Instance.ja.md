+++
title = "レプリケーションインスタンスの作成"
weight = 20
+++

### DMS レプリケーションインスタンスの作成

このステップでは、<a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service (DMS)</a> レプリケーションインスタンスを作成します。DMS レプリケーションインスタンスは ソースデータベース、ターゲットデータベースとの接続を確立し、データの転送と、データのロード中にソースデータベースに発生した変更のキャッシュを行います。

1. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/dms/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Database Migration Service (DMS)</a>** のページを開きます。

2. 左のメニューから **「レプリケーションインスタンス」** を選択し、**「レプリケーションインスタンスの作成」** ボタンをクリックします。

    ![Replication-instance-create](/db-mig/Replication-instance-create.ja.png)

3. **「レプリケーションインスタンスの作成」** 画面で、次のパラメータを入力し、新しいレプリケーションインスタンスを構成します：

    | パラメータ           | 入力値                    |
    | ------------------- | ------------------------ |
    | 名前                 | replication-instance     |
    | 説明                 | DMS replication instance |
    | VPC                 | TargetVPC                |
    | マルチ AZ            | チェックを外す             |
    | パブリックアクセス可能  | チェックを入れる           |

    以下のスクリーンショットを参考にしてください。


    ![replication-instance-conf](/db-mig/replication-instance-conf.ja.png)


    **「セキュリティとネットワークの詳細設定」** で、前頁で作成した**レプリケーションサブネットグループ**と、レプリケーションインスタンスの**セキュリティグループ**を必ず指定してください。

    ![Replication-instance-conf](/db-mig/advanced-security.ja.png)

4. **「作成」** ボタンをクリックします。

