+++
title = "セキュリティグループの作成"
weight = 10
+++


### VPC 用のセキュリティグループを作成

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/vpc/home?region=us-west-2" target="_blank">VPC</a>** のページを開き、左のメニューから **「セキュリティ」 → 「セキュリティグループ」** を選択します。セキュリティグループの一覧が表示されたら、**「セキュリティグループを作成」** ボタンをクリックします。

以下のパラメータを入力して、セキュリティグループを作成します（手順を繰り返し、下の表にある3つのセキュリティグループをすべて作成します）：

| セキュリテイグループ名    | 説明      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | 事前準備で作成した VPC を選択 （例：TargetVPC）  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| 事前準備で作成した VPC を選択 （例：TargetVPC）  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | 事前準備で作成した VPC を選択 （例：TargetVPC）  |

![create-lb-sg](/ecs/create-lb-sg.ja.png)





### セキュリティグループの設定

作成したセキュリティグループを1つずつ選択し、**「インバウンドルール」** タブから **「インバウンドルールの編集」** ボタンをクリックします。以下のように、セキュリティグループごとに必要なルールを追加します：

#### 1. LB-SG インバウンドルール

HTTP、HTTPS を追加し、ユーザーが任意の場所からウェブサイトにアクセスできるようにします。

| タイプ    | プロトコル      								   | ソース            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | 任意の場所   |
| HTTPS               | TCP            | 任意の場所   |

![edit-lb-sg](/ecs/edit-lb-sg.ja.png)


#### 2. ECS-Tasks-SG インバウンドルール

Application Load Balancer と ECS タスク間の通信を許可します。

| タイプ    | プロトコル      								   | ソース            |
| ---------------------- | ---------------- |----------------|
| すべての TCP                | TCP            | カスタム → LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.ja.png)

#### 3. EFS-SG インバウンドルール

ECS タスクと Amazon EFS 間の通信を許可します。Web サーバーの EFS へのアクセスは、EFS ボリュームをマウントして、Web アプリケーションの静的コンテンツをコピーするために、一時的に有効化します（後で削除します）。

| タイプ    | プロトコル      								   | ソース            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | カスタム → ECS-Tasks-SG  |
| NFS                | TCP    | カスタム → Web サーバーに割り当てられているセキュリテイグループ  |

![edit-efs-sg](/ecs/edit-efs-sg.ja.png)


{{% notice tip %}}
Web サーバーに割り当てられているセキュリテイグループを確認するには、
AWS マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank">EC2</a>** のページを開き、**Webserver** インスタンスを選択します。
インスタンスに割り当てられている**セキュリティグループ**名をクリックし、**セキュリテイグループ ID** を確認します。
{{% /notice %}}

### データベース用のセキュリテイグループの変更

Amazon Elastic Container Service (ECS) タスクとターゲットデータベース間の通信を可能にするため、
ECS-Tasks-SG からポート3306 (MySQL) に対するトラフィックを許可するよう、
データベース用のセキュリティグループ (DB-SG) を変更します。

| タイプ    | プロトコル      								   | ソース            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | カスタム → ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.ja.png)
