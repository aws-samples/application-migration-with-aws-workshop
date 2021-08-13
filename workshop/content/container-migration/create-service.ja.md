+++
title = "Amazon ECS サービスの作成"
weight = 60
+++

**Amazon Elastic Container Service (ECS) タスク定義**の作成が完了したら、いよいよ **Amazon ECS サービス**の作成に移ります。

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ecs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Elastic Container Service</a>** のページを開き、左のメニューから **「クラスター」** を選択します。前頁で作成した **unicorn-cluster** を選択し、**「サービス」** タブの **「作成」** ボタンをクリックします。

![create-service](/ecs/create-service.ja.png)

### ステップ 1 : サービスの設定 

**「サービスの作成」** ウィザードで、以下の通り設定を行います（**起動タイプ**に **FARGATE** が選択されていることを確認してください）：

- **タスク定義**に、前頁で作成した**タスク定義**（例：unicorn-task-def）を指定
- **プラットフォームのバージョン**に、**1.4.0** を指定                                          
- **クラスター**に、前頁で作成した**ECS クラスター**（例：unicorn-cluster）を指定し、**サービス名**を入力（例：unicorn-svc）
- **タスクの数**を **2** に設定
- その他の設定は、すべてデフォルト値のまま **「次のステップ」** をクリック

![configure-service](/ecs/configure-service.ja.png)

### ステップ 2 : ネットワーク構成 

**ネットワーク構成**では、**クラスター VPC** に、本ハンズオンの**事前準備で作成した VPC**（例：TargetVPC）、
**サブネット**にアベイラビリティゾーンごとの**プライベートサブネット**（\*-private-\*-web）、
**セキュリティグループ**に前頁で作成した **ECS タスク 用のセキュリティグループ** (ECS-Tasks-SG) 、
**パブリック IP の自動割り当て**に **DISABLED** を指定します。

![configure-network-svc](/ecs/configure-network-svc.ja.png)

![svc-lb](/ecs/svc-lb.ja.png)

**ロードバランシングの種類**に、**Application Load Balancer** を選択し、前頁で作成したロードバランサー（例：unicorn-lb）を指定します。

![container-lb](/ecs/container-lb.ja.png)

**「ロードバランサーに追加」** をクリックし、ターゲットとなるコンテナの追加を行います。

**ターゲットグループ名**に、前頁で作成した**ターゲットグループ**（例：unicorn-tg）を指定します。

![container-lb-details](/ecs/container-lb-details.ja.png)

![service-discovery](/ecs/service-discovery.ja.png)

**サービスの検出（オプション）** で、**「サービスの検出の統合の有効化」** のチェックを外し、**「次のステップ」** をクリックします。

### ステップ 3 : Auto Scaling（オプション） 

Auto Scaling の設定では、**「Service Auto Scaling の設定を変更することで、サービスの必要数を調整する」** を選択し、**タスクの最小数**、**必要数**、**最大数**を以下のように指定します。また **Service Auto Scaling 用の IAM ロール**に、**ecsAutoScaleRole** が設定されていることを確認してください。

![svc-autoscaling](/ecs/svc-autoscaling.ja.png)

**自動タスクスケーリングポリシー**では、**スケーリングポリシータイプ**を **「ターゲットの追跡」** に設定し、ポリシー名（例：Requests-policy）を入力します。加えて **ECS サービスメトリクス**を選択し（例：ALBRequestCountPerTarget）、**ターゲット値**を設定します。設定が完了したら、**「次のステップ」** をクリックします。

![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.ja.png)

{{% notice note %}}
上記の手順を繰り返すことで、別のサービスメトリクス（CPU やメモリの使用率など）に対する、スケーリングポリシーを追加することができます。
{{% /notice %}}  

### ステップ 4 : 確認 

設定内容を確認し、**「サービスの作成」** をクリックして、Amazon ECS サービスを作成します。

サービスのステータスが **Active** になり、すべてのタスクのステータスが **実行中** または **RUNNING** になったら、
<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2#LoadBalancers:" target="_blank" rel="noopener noreferrer">ロードバランサー</a>の **DNS 名**にブラウザでアクセスして、Web アプリケーションが稼働していることを確認します。

{{% notice note %}}
ECS ノードの Auto Scaling を設定する必要がある場合は、[こちらのチュートリアル](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html) を確認してください。
{{% /notice %}}  


{{% notice tip %}}
問題が発生した場合は、[Amazon ECS のトラブルシューティングガイド](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html) を確認してみましょう。
{{% /notice %}}
