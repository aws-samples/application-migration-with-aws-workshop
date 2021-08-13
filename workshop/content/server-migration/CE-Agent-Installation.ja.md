+++
title = "ソースマシンへのエージェントインストール"
weight = 20
+++

<a href="https://console.cloudendure.com"  target="_blank" rel="noopener noreferrer">CloudEndure コンソール</a>から、ソースマシンの追加方法と、マシンにエージェントをインストールするための手順が表示される **Machines** 画面に移動します。
![CE-Agent-install](/ce/CE-Agent-install.png)

#### Web サーバーへのエージェントインストール

1. Web サーバーに関する情報を確認します。

    **自身の環境**でハンズオンを実施している場合は、<a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation スタック</a>（**ApplicationMigrationWorkshop**）の**出力**セクションから確認してください。

    ![Centos-pem](/ce/webserver-self-paced-info.ja.png)    

    **AWS 主催のイベント**の場合は、Event Engine の <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> に表示されている **Webserver IP**、 **Webserver Username**、**Webserver SSH Key** を確認してください。

    ![Centos-pem](/ce/Centos-pem.png)

2. Web サーバーの SSH キー（.pem）をダウンロードして、ローカルに保存します（例： webserver.pem）。

    Microsoft Windows をお使いの場合は、PuttyGen を使って SSH キー（.pem）を .ppk に変換してから、 Putty を使って接続してください（詳細は<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">こちら</a>をご確認ください）。
    

3. Web サーバーに、SSH ターミナルを使って接続します。

    - Microsoft Windows をお使いの場合は<a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">こちら</a>
    - Mac OS をお使いの場合は<a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">こちら</a>

4. CloudEndure コンソールの **How to Add Machines** からコピーしたコマンドを実行して、エージェントのダウンロードとインストールを実行します。

    ![CloudEndure Agent installation example command](/ce/CE-Agent-install-commands.ja.png)

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.ja.png)

    正常に終了すると、インストールが完了したことを示すメッセージがターミナルに表示されます。
    
    {{% notice tip %}}
エージェントをインストールするコマンドは、CloudEndure コンソール の **Machines → MACHINE ACTIONS → Add Machines** からも取得できます。
{{% /notice %}}

5. エージェントのインストールが完了すると、CloudEndure コンソールの **Machines** 画面に、追加したマシンの情報が表示されます。

    ![CE-server-progress](/ce/CE-server-progress.png)


#### Windows Server へのエージェントインストール（オプション）

ここでは、CloudEndure Migration を使用して、Windows Server を移行する方法を説明します。ハンズオンやイベントのシナリオに Windows Server のレプリケーションが含まれていない場合はスキップしてください。

1. Windows Server の情報を取得します。

    **自身の環境**でハンズオンを実施している場合は、<a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation スタック</a>（**ApplicationMigrationWorkshop**）の**出力**セクションから確認してください。

    **AWS 主催のイベント**の場合は、Event Engine の <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> に表示されている **Windows Server IP**、 **Username**、 **Password** を確認してください。

2. RDP（Remote Desktop Protocol）アプリケーションを使用して Windows Server に接続します。

    RDP での接続の詳細については、<a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html" target="_blank" rel="noopener noreferrer">こちらの記事</a>を参照ください。

3. CloudEndure コンソールの **How to Add Machines**（Windows セクション）からコピーしたコマンドを実行して、エージェントのダウンロードとインストールを実行します。

    {{% notice tip %}}
エージェントをインストールするコマンドは、CloudEndure コンソール の **Machines → MACHINE ACTIONS → Add Machines** からも取得できます。
{{% /notice %}}

4. エージェントのインストールが完了すると、CloudEndure コンソールの **Machines** 画面に、追加したマシンの情報が表示されます。