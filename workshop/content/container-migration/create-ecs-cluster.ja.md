+++
title = "Amazon ECS クラスターの作成"
weight = 40
+++


### Amazon Elastic Container Service (ECS) クラスターの作成

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ecs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Elastic Container Service</a>** のページを開き、左のメニューから **「クラスター」** を選択します。クラスターの一覧が表示されたら、**「クラスターの作成」** ボタンをクリックします。

「ステップ 1: クラスターテンプレートの選択 」では、 **「ネットワーキングのみ」** を選択し、**「次のステップ」** をクリックします。

![create-cluster](/ecs/create-cluster.ja.png)

「ステップ 2: クラスターの設定」では、**クラスター名**（例：unicorn-cluster）を入力し、**「Container Insights を有効にする」** ボックスにチェックを入れることで、Amazon CloudWatch よりも詳細なメトリクスを提供する **CloudWatch Container Insights** を有効にします。

![configure-cluster](/ecs/configure-cluster.ja.png)

最後に **「作成」** ボタンを押して Amazon ECS クラスターを作成します。
