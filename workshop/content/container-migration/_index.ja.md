+++
title = "コンテナへの移行"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>3. </b>"
+++

{{% notice info %}}
本セクションは、[**1. データベースの移行**]({{< ref "/database-migration/_index.ja.md" >}})と、[**2. サーバーの移行**]({{< ref "/server-migration/_index.ja.md" >}})が完了していることを前提としています。
{{% /notice %}}


#### Amazon Elastic Container Service (ECS) の概要

**Amazon Elastic Container Service (ECS)** は、フルマネージド型のコンテナオーケストレーションサービスです。
以下の起動タイプを選択して、ECS クラスターを実行することができます：

- コンテナ向けサーバーレスコンピューティング機能を提供する Fargate 起動タイプ
- ユーザーが管理する Amazon EC2 インスタンスで、クラスターを実行する EC2 起動タイプ
  
本ハンズオンでは、**Fargate** 起動タイプを使用して、プロビジョニング、スケーリング、バックエンドインフラストラクチャの管理やセキュリティの確保など、煩雑かつ差別化が難しいタスクを行うことなく、アプリケーションを実行します。

以下の図は、Fargate 起動タイプを使用する Amazon ECS 環境のアーキテクチャを示しています。

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Amazon ECS のコア・コンポーネント

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">**Amazon ECS クラスター**</a> は、タスクやサービスといったリソースの論理グループです。

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">**タスク定義**</a>は、アプリケーションを構成する1つ以上（最大10個）のコンテナを記述した JSON 形式のテキストファイルです。アプリケーションの設計図と考えることができます。

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">**タスク**</a>はクラスター内のタスク定義をインスタンス化したものです。Amazon ECS でアプリケーションのタスク定義を作成した後、クラスターで実行するタスクの数を指定できます。

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">**Amazon ECS サービス**</a>を使用すると、タスク定義で指定した数のインスタンスを、Amazon ECS クラスター内で同時に実行し、維持することができます。タスクが何らかの理由で失敗または停止した場合、Amazon ECS サービススケジューラは、タスク定義の別のインスタンスを起動してそれに置き換え、サービスの作成時に指定したスケジュール戦略に基づいて、必要数のタスクを維持します。

**AWS Fargate** の詳細については、以下の動画をご覧ください：
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Web アプリケーションのコンテナへの移行

Web アプリケーションをコンテナに移行するには、以下の手順を実行します：

1. [セキュリティグループの作成]({{< ref "/create-sg.ja.md" >}})

2. [**Amazon Elastic File System（EFS）** ファイルシステムの作成]({{< ref "/create-efs.ja.md" >}})

3. [**AWS Systems Manager** パラメータストアへのデータベース変数の追加]({{< ref "/configure-parameters-store.ja.md" >}})

4. [**Elastic Load Balancing** の設定]({{< ref "/create-loadbalancer.ja.md" >}})

5. [**Amazon Elastic Container Service (ECS)** クラスターの作成]({{< ref "/create-ecs-cluster.ja.md" >}})

6. [**Amazon ECS タスク定義**の作成]({{< ref "/create-task-definition.ja.md" >}})

7. [**Amazon ECS サービス**の作成]({{< ref "/create-service.ja.md" >}})
