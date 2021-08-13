+++
title = "AWS イベントでハンズオンを開始"
date = 2019-10-24T10:02:15+02:00
weight = 30
+++

{{% notice warning %}}
AWS が主催するイベント（re:Invent、Gameday、ワークショップ、または AWS の従業員が主催するその他のイベント）に参加している場合にのみ、このセクションを実行してください。ご自身の環境でハンズオンを実施する場合は、[自身の環境でハンズオンを開始]({{< ref "/on-your-own.ja.md" >}})に進んでください。
{{% /notice %}}

### ダッシュボードへのアクセス

以下のセクションでは、移行元となる環境（ソース）に関する情報へのアクセス方法について、説明します。

- <a href="https://dashboard.eventengine.run/" target="_blank" rel="noopener noreferrer">https://dashboard.eventengine.run/</a> にアクセスします

- イベント主催者から渡された12桁のハッシュ値を入力してください


  ![dashboard-hash](/intro/dashboard-hash.png)



### 移行元環境（ソース）へのアクセス

**Migration GameDay** モジュールの、**Outputs** セクション配下に、ソース環境に関する詳細が表示されます：

  ![dashboard-output](/intro/src-env-output.png)


### AWS アカウントへのアクセス

以下のスクリーンショットに示す、**AWS Console** ボタンをクリックして、AWS アカウントにアクセスします：

![dashboard-AWS-console](/intro/dashboard-aws-console.png)


ポップアップウィンドウで、**Open AWS Console**（現在のブラウザで AWS コンソールを開く）または **Copy Login Link**（ログイン用の URL をクリップボードにコピーする）を選択するように求められます。
{{% notice note %}}
次のステップに進む前に、AWS コンソールにアクセスしてください。
{{% /notice %}}

![dashboard-console-login](/intro/dashboard-console-login.png)


{{% notice note %}}
<a href="https://aws.amazon.com/cli/" target="_blank" rel="noopener noreferrer">AWS Command Line Interface (CLI)</a> を使用する場合は、ポップアップウィンドウに表示される認証情報を利用してください。なお、この認証情報は CloudEndure で使用するものとは異なりますので、CloudEndure コンソールの AWS Credentials タブには入力しないでください。
{{% /notice %}}

以上で環境の確認は完了です。 [デプロイされた環境の確認]({{< ref "./review-deployment.ja.md" >}})に進んでください。
