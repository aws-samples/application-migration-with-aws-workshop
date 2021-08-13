+++
title = "Migration Hub の有効化"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> では、AWS およびパートナーの複数のソリューションにおける、アプリケーション移行の進行状況を1つの場所から追跡できます。  
有効化するには、マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/migrationhub/home?region=us-west-2" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a>** のページを開きます。

![Migration Hub - Dashboard](/intro/migration-hub-dashboard.ja.png)

左のメニューから **「移行」** を選択し、**米国西部（オレゴン）** をホームリージョンに設定してください。

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.ja.png)

次に、**「移行」 → 「ツール」** をクリックして、AWS Migration Hub に移行の進行状況を送信するツールを選択します。
追加設定なしで使用できる CloudEndure Migration に加え、今回は **AWS Database Migration Service (DMS)** との接続を設定します。

ページの一番下までスクロールし、**AWS Database Migration Service** カードの **「接続」** ボタンをクリックします。

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.ja.png)

数秒のうちに、接続のステータスが **「接続されていません」** から **「接続済み」** に変化します。

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.ja.png)

以上で AWS Migration Hub の設定は完了です。今後、**CloudEndure Migration** および **AWS Database Migration Service** での、すべてのアクティビティを **AWS Migration Hub** のダッシュボードから確認することができます。