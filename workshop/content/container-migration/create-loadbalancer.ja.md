+++
title = "Elastic Load Balancing の設定"
weight = 35
+++

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、左のメニューから **「ロードバランサー」** を選択します。

**「ロードバランサーの作成」** ボタンをクリックし、以下のように **Application Load Balancer** を選択します。

![create-loadbalancer](/ecs/create-lb.ja.png)

**「手順 1: ロードバランサーの設定」** では、**名前**（例: unicorn-lb）を入力し、使用する **VPC**（例: TargetVPC）を選択したうえで、以下のように少なくとも2つのアベイラビリティゾーンで、**パブリックサブネット** (例: TargetVPC-public-a, TargetVPC-public-b) を選択します：

![configure-loadbalancer](/ecs/configure-lb.ja.png)

**「手順 2: セキュリティ設定の構成」** では、何も変更せずに **「次の手順： セキュリティグループの設定」** をクリックします。

**「手順 3: セキュリティグループの設定」** では、前頁で作成した **LB-SG** セキュリティグループを選択します。

**「手順 4: ルーティングの設定」** では、**ターゲットグループ** に **新しいターゲットグループ** を選択し、**名前**（例：unicorn-tg）を入力します。**ターゲットの種類**には、**IP** を選択し、他のフィールドはデフォルト値のままにして、**「次の手順: ターゲットの登録」** をクリックします。

![configure-routing](/ecs/configure-routing.ja.png)

**「手順 5: ターゲットの登録」** では、何も変更せずに **「次の手順: 確認」** をクリックします。  
最後に、設定内容に問題がないことを確認したら、**「作成」** をクリックして、ロードバランサーの作成を開始します。
