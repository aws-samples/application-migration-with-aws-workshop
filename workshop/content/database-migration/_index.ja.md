+++
title = "データベースの移行"
weight = 10
pre = "<b>1. </b>"
+++

本セクションでは、移行元（Source）の MySQL データベースを、移行先（Target）となる Amazon RDS for MySQL に移行します。

これは同種のデータベース間の移行（Source と Target のデータベースエンジンが同じ）であるため、スキーマ構造、データ型、データベースコードは Source とTarget の間で互換性があり、スキーマの変換は必要ありません。

![1](/db-mig/DMS-overview.png)

以下の手順で、データベース移行を実施します：

1. [Target データベースの作成]({{< ref "/Create-target-DB.ja.md" >}})

2. [ネットワークの設定]({{< ref "/setup_network.ja.md" >}})

2. [レプリケーションインスタンスの作成]({{< ref "Create-Replication-instance.ja.md" >}})

3. [エンドポイントの作成]({{< ref "Create-Source-and-Target-endpoints.ja.md" >}})

4. [Source データベースの設定]({{< ref "configure_source_database.ja.md" >}})

4. [レプリケーションタスクの作成と実行]({{< ref "Create-and-run-Replication-task.ja.md" >}})

5. [サマリー]({{< ref "Summary.ja.md" >}})
