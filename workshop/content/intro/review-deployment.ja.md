+++
title = "デプロイされた環境の確認"
weight = 40
+++

## 移行元環境：ソース

事前準備の段階で、以下のソース環境が AWS アカウント内にデプロイされています。

![source-env](/intro/source-env.png)

ソース環境は、3層で構成される eコマースの Web アプリケーションです。  
Apache、PHP、Wordpress、WooCommerce が稼働する Ubuntu ベースの Web サーバーと、MySQL バージョン5.7 が稼働する Ubuntu ベースのデータベースサーバーで、構成されています。


## 移行先環境：ターゲット

事前準備の段階で、ターゲット環境用に以下の **Amazon Virtual Private Cloud (VPC)** がデプロイされています。

![target-env](/intro/target-vpc.png)

上の図は移行先のネットワークとなる VPC が、2つのアベイラビリティゾーンにまたがる6つのサブネットで構成されることを示しています。

以上で環境の確認は完了です。 [AWS Migration Hub の有効化]({{< ref "/migration-hub.ja.md" >}})に進んでください。