+++
title = "レプリケーションインスタンスの作成"
weight = 20
+++

### DMS レプリケーションインスタンスの作成

このステップでは、<a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migration Service</a> レプリケーションインスタンスを作成します。DMS レプリケーションインスタンスは Source データベース、Target データベースとの接続を確立し、データの転送と、データのロード中に Source データベースに発生した変更のキャッシュを行います。

1. マネジメントコンソール上部の **「サービス」** から **Database Migration Service** のページを開きます。

2. 左のメニューから **「レプリケーションインスタンス」** を選択し、**「レプリケーションインスタンスの作成」** ボタンをクリックします。

    ![Replication-instance-create](/db-mig/Replication-instance-create.ja.png)

3. **「レプリケーションインスタンスの作成」** 画面で、次のパラメータを入力し、新しいレプリケーションインスタンスを構成します：

    | パラメータ           | 入力値                    |
    | ------------------- | ------------------------ |
    | 名前                 | replication-instance     |
    | 説明                 | DMS replication instance |
    | インスタンスクラス     | dms.t2.medium            |
    | エンジンバージョン     | 3.3.1                    |
    | 割り当てられたストレージ（GiB）| 50                 |
    | VPC                 | TargetVPC                |
    | マルチ AZ            | チェックを外す             |
    | パブリックアクセス可能  | チェックを入れる           |

    以下のスクリーンショットを参考にしてください。


    ![replication-instance-conf](/db-mig/replication-instance-conf.ja.png)


    **「セキュリティとネットワークの詳細設定」** で、前頁で作成したレプリケーションサブネットグループと、レプリケーションインスタンスのセキュリティグループを必ず指定してください。

    ![Replication-instance-conf](/db-mig/advanced-security.ja.png)

4. **「作成」** ボタンをクリックします。

    {{% notice note %}}
レプリケーションインスタンスの作成には数分かかります。**ステータス**が**利用可能**に変化したことを確認してから、次のステップに進んでください。
それまでの間に、<a href="https://aws.amazon.com/dms/" target="_blank">AWS DMS のページ</a>で紹介されている様々なユースケースを確認してみてください。
{{% /notice %}}
