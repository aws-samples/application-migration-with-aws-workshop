+++
title = "デプロイされた環境の確認"
weight = 40
+++

## 移行元環境：ソース

事前準備の段階で、以下のソース環境が AWS アカウント内にデプロイされています。

![source-env](/intro/source-env.png)

ソース環境は、3層で構成される eコマースの Web アプリケーションです。  
Apache、PHP、Wordpress、WooCommerce が稼働する Ubuntu ベースの Web サーバーと、MySQL バージョン5.7 が稼働する Ubuntu ベースのデータベースサーバーで、構成されています。

**自身の環境**でハンズオンを実施している場合は、マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、左のメニューから **「インスタンス」 → 「インスタンス」** を選択します。EC2 インスタンスの一覧から、2つのインスタンス（**Source-Webserver**、**Source-DBServer**） が作成されていることを確認してください。

{{% notice note %}}
**AWS 主催のイベント**でハンズオンを実施している場合、上記の確認は必要ありません。
{{% /notice %}}
 

## 移行先環境：ターゲット

事前準備の段階で、ターゲット環境用に以下の **Amazon Virtual Private Cloud (VPC)** がデプロイされています。

![target-env](/intro/target-vpc.ja.png)

上の図は移行先のネットワークとなる VPC が、2つのアベイラビリティゾーンにまたがる6つのサブネットで構成されることを示しています。

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/vpc/home?region=us-west-2" target="_blank" rel="noopener noreferrer">VPC</a>** のページを開き、左のメニューから **「VIRTUAL PRIVATE CLOUD」 → 「VPC」** を選択します。VPC の一覧から、**TargetVPC** が作成されていることを確認しください。

さらに、左のメニューから  **「VIRTUAL PRIVATE CLOUD」 → 「サブネット」** を選択し、サブネットの一覧から、
上の図にある**6つのサブネット**が **TargetVPC** に作成されていることを確認してください。

以上で環境の確認は完了です。 [AWS Migration Hub の有効化]({{< ref "/migration-hub.ja.md" >}})に進んでください。