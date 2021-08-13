+++
title = "CloudEndure の設定"
weight = 10
+++


はじめに、CloudEndure Replication Server が、移行先の AWS アカウントとその中に存在するレプリケーション先のサブネットにアクセスできるよう、
AWS の資格情報を使って CloudEndure を設定する必要があります。

### AWS の資格情報を設定

1. [https://console.cloudendure.com](https://console.cloudendure.com/) から、CloudEndure コンソールにログインします。

    ![CE-login](/ce/CE-login.png)

    **自身の環境**でハンズオンを実施している場合は、すでにお持ちの CloudEndure Migration アカウントを使うか、新しく [CloudEndure Migration アカウント](https://console.cloudendure.com/#/register/register)を作成してください。

    **AWS 主催のイベント**の場合は、Event Engine の <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> に表示されている **CloudEndure Username** と **Password** を使用してください。

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> に、資格情報が表示されていない場合は、イベント主催者に資格情報を提供してもらうよう依頼してください。

2. **自身の環境**でハンズオンを実施している場合のみ、CloudEndure コンソールの左上にあるプラスボタンをクリックし、新しい <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">Project</a> を作成します。
**AWS 主催のイベント**の場合は、この手順をスキップし、**ステップ3** に進んでください。
    ![CloudEndure Create Project](/ce/CE-create-project-1.ja.png)

    **Project Name** に任意の名前を指定し、**CREATE PROJECT** ボタンをクリックします。
    ![CloudEndure Create Project](/ce/CE-create-project-2.ja.png)

2. 左のメニューから **Setup & Info** を選択し、**AWS Credentials** タブを開きます。

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. **AWS Access Key ID** と **AWS Secret Access Key** のフィールドに、必要な資格情報を入力します。

    **自身の環境**でハンズオンを実施している場合は、<a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation スタック</a>（**ApplicationMigrationWorkshop**）の**出力**セクションに表示されている **CloudEndureUserAccessKey** と **CloudEndureUserSecretAccessKey** の値を入力してください（以下例）。

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.ja.png)

    **AWS 主催のイベント**の場合は、Event Engine の<A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a> 、 **CloudEndure AWS Credentials** のセクションに表示されている資格情報を入力してください（以下例）。

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    **AWS Access Key ID** と **AWS Secret Access Key** のフィールドに既に値が入力されている場合は、上書きしてください。

4. **SAVE** ボタンをクリックして、設定を保存します。

### Replication Settings

AWS 資格情報を保存すると、自動的に **Setup & Info → REPLICATION SETTINGS** タブにリダイレクトされます。
ここでは CloudEndure Replication Server の詳細設定を行います。

{{% notice note %}}
先へ進む前に、AWS アカウントから最新の情報を取得するため、ブラウザを**リフレッシュ**してください（F5 ボタンを押すか、ブラウザのリフレッシュボタンをクリックして、実行できます）。
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. REPLICATION SETTINGS 画面の設定を、以下の表の内容に合わせて更新してください。

    | パラメータ                                   | 入力値                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | チェックを外す                                                 |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                          |
    | Use VPN or DirectConnect (using a private IP) | チェックを外す                                             |
    | Enable volume encryption                   | チェックを入れる                                              |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.ja.png)

2. 画面下までスクロールして、**SAVE REPLICATION SETTINGS** ボタンをクリックします。

    {{% notice tip %}}
画面上部に "AWS credentials must be refreshed" という通知が表示される場合は、ブラウザをリフレッシュしてください。
{{% /notice %}}
