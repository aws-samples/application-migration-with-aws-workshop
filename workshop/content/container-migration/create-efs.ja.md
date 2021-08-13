+++
title = "Amazon EFS ファイルシステムの作成"
weight = 20
+++

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon Elastic File System (EFS)</a>** のページを開き、**「ファイルシステムの作成」** ボタンをクリックします。

**「名前」** に **webserver-filesystem**、 EFS のデプロイ先となる **「Virtual Private Cloud (VPC)」** に **TargetVPC** を指定し、
**「作成」** ボタンをクリックします。

![Create file system](/ecs/create-efs-name.ja.png)

ファイルシステムの一覧画面で、作成したファイルシステムの名前（**webserver-filesystem**）をクリックし、詳細を確認します。

![Select EFS from the list](/ecs/create-efs-select.ja.png)

ファイルシステム **webserver-filesystem** の詳細画面で **「ネットワーク」** タブを選択し、**「マウントターゲットを作成」** ボタンをクリックします。

![Go to Network mount targets](/ecs/create-efs-mount-target.ja.png)

Virtual Private Cloud (VPC) のドロップダウンリストから **TargetVPC** を選択し、
以下の通り、2つのマウントターゲットを追加します：

| アベイラビリティゾーン    | サブネット ID               | セキュリティグループ     |
| --------------------- | -------------------------- |----------------------|
| us-west-2a            | TargetVPC-private-a-web    | EFS-SG               |
| us-west-2b            | TargetVPC-private-b-web    | EFS-SG               |

![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.ja.png)

**「保存」** ボタンをクリックし、マウントターゲットの設定を保存します。

**ファイルシステム ID** は、ファイルシステムのマウントと、作成したファイルシステムの DNS 名を定義するために必要となるため、
テキストエディタ等にコピーしておいてください。  
また、ファイルシステムの DNS 名は、**[ファイルシステム ID]**.efs.**[AWS リージョン]**.amazonaws.com の形式にしたがって、決定されます。
以下の例の場合、DNS 名は **fs-6ab3056f**.efs.**us-west-2**.amazonaws.com となります。

![EFS file system id](/ecs/create-efs-file-system-id.ja.png)

これで、ファイルシステムを Web サーバーのインスタンスに一時的にマウントし、Wordpress のソースコンテンツを EFS ファイルシステムにコピーする準備が整いました。

### Web サーバーへのファイルシステムのマウント

1. Web サーバーの EC2 インスタンス（Webserver）にログインします。

   {{% notice tip %}}
Web サーバーへのログイン手順については、**「2. サーバーの移行」** で実施した[**アプリケーションの設定**]({{< ref "/server-migration/CE-Webserver-config.ja.md" >}}) を参照してください。
{{% /notice %}}

2. 以下のコマンドを実行して、Ubuntu インスタンス用の NFS クライアントをインストールし、マウントポイントとなるディレクトリを作成します：
   ```
   sudo apt-get update
   sudo apt-get install nfs-common
   sudo mkdir efs
   ```

3. 以下のコマンドを実行して、EFS ファイルシステムをマウントします。コマンド内の **FILE_SYSTEM_ID** を、作成した EFS ファイルシステムの **ファイルシステム ID** に置き換えて実行してください：
   ```
   sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
   ```

ファイルシステムのマウントが完了したら、Web サーバーから **/var/www/html/wp-content** 配下にあるすべてのコンテンツを、マウントしたファイルシステムにコピーします（以下コマンド例）：
```
sudo cp -r /var/www/html/wp-content/* efs/
```

### トラブルシューティング

EFS ファイルシステムのマウントで問題が発生した場合は、[Amazon EFS のユーザガイド](https://docs.aws.amazon.com/ja_jp/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html) を確認してみましょう。
