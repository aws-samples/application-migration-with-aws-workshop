+++
title = "Amazon ECS タスク定義の作成"
weight = 50
+++

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ecs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Elastic Container Service (ECS)</a>** のページを開き、左のメニューから **「タスク定義」** を選択します。タスク定義の一覧が表示されたら、**「新しいタスク定義の作成」** をクリックします。

![create-task-def](/ecs/create-task-def.ja.png)

**「ステップ 1: 起動タイプの互換性の選択」** で、**FARGATE** 起動タイプを選択し、**「次のステップ」** をクリックします。

**「ステップ 2: タスクとコンテナの定義の設定」** で、**タスク定義名**（例：unicorn-task-def）を入力し、**タスクロール**と**タスク実行ロール**の両方に **ecsTaskExcutionRole** を選択します。ネットワークモードには、**awsvpc** を選択します。

![configure-task-def](/ecs/configure-task-def.ja.png)

**タスクサイズ**のセクションでは、**タスクメモリ (GB)** と**タスク CPU (vCPU)** に、以下の値を指定します。

![task-size](/ecs/task-size.ja.png)

今回は **Amazon Elastic File System (EFS)** ボリュームをコンテナにマウントするため、コンテナの定義を追加する前に、タスク定義にボリュームを追加する必要があります。

**ボリューム**のセクションまでスクロールし、**「ボリュームの追加」** をクリックします。

![volumes](/ecs/volumes.ja.png)

**ボリュームの追加**ウィンドウで、ボリュームタイプに **EFS** を選択し、ボリュームの**名前**を指定します（例：wp-content）。
**ファイルシステム ID** に、前頁で作成した **EFS ファイルシステム**を選択し、**Encryption in transit** を有効化します。

![add-volume](/ecs/add-volume.ja.png)

**「追加」** をクリックして、ボリュームの追加が完了したら、上にスクロールして、**コンテナの定義**のセクションに戻ります。

![add-container](/ecs/add-container.ja.png)

**「コンテナの追加」** をクリックし、**コンテナ名**（例：unicorn-web-container）と**イメージ**（今回は <a href="https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer">WordPress の 公式 Docker イメージ</a>を使用するため、**public.ecr.aws/docker/library/wordpress:latest** を指定する必要があります）を入力します。**メモリ制限（MiB）**と**ポートマッピング**を、以下のスクリーンショットのように設定します。

![add-container-details](/ecs/add-container-details.ja.png)

**環境変数**のセクションでは、以下のスクリーンショットのように、前頁で設定した**パラメータストア**に定義されているパラメータを指定します。

![environment-variables](/ecs/environment-variables.ja.png)


| Key              | ValueFrom             | 設定値                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.ja.png)

**ストレージとログ**のセクションで、**マウントポイント**のソースボリュームに、上で追加した **wp-content** ボリュームを指定し、
コンテナパスに **/var/www/html/wp-content** を指定します（Amazon EFS ファイルシステムにコピーした WordPress のコンテンツファイルを、コンテナからアクセス可能にします）。

最後に、**「追加」** をクリックして、タスク定義の画面に戻り、画面下の **「作成」** をクリックして、タスク定義の追加を完了します。
