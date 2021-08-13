+++
title = "パラメータストアの設定"
weight = 30
+++

本ハンズオンでは、 Wordpress の公式 Docker イメージと RDS データベースを使用するため、
Wordpress の設定を行う際にデータベースの認証情報、データベース名や、サーバーのホスト名を提供する必要があります。

これを実現するための最良の方法は、上記のパラメータを Docker イメージや Amazon Elastic Container Service (ECS) タスク定義の中に保持するのではなく、
**AWS Systems Manager** パラメータストアで管理することです。

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/systems-manager/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Systems Manager</a>** のページを開き、左のメニューから **「パラメータストア」** を選択します。

**「パラメータの作成」** をクリックして、以下の表をもとに**パラメータの詳細**（名前、説明、タイプ、値）を入力します。

![parameter-details](/ecs/parameter-details.ja.png)

以下のすべてのパラメータについて、上記の手順を繰り返します：

| 名前                    | タイプ           | 値                             |
| ---------------------- | --------------- |--------------------------------|
| DB_HOST                | 文字列           | データベース移行のセクションで作成した <br>RDS インスタンスのエンドポイント                   |
| DB_NAME                | 文字列           | ターゲットデータベース名（例： wordpress-db） |
| DB_USERNAME            | 文字列           | RDS インスタンス作成時に設定したユーザー名      |
| DB_PASSWORD            | 安全な文字列      | RDS インスタンス作成時に設定したパスワード    |

{{% notice note %}}
DB_PASSWORD の設定時に、**「KMS の主要なソース」** と **「KMS キー ID」** の指定を追加で求められますが、
本ハンズオンではデフォルト値のままで問題ありません。
{{% /notice %}}