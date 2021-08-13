+++
title = "ハンズオン環境の削除"
weight = 40
pre = "<b>5. </b>"
+++

ご自身の環境でハンズオンを実施した場合、ハンズオンの完了後に以下の手順を実行して、**すべてのリソース**を削除してください：

1. <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">**CloudEndure コンソール**</a>にログインし、以下を実行します：
   - **Machines** 画面から移行を実施したマシンを選択し（チェックボックスを有効化）、**Machine Actions** から **Stop Data Replication For 1 Machine** を選択します。
   - **Machines** 画面から移行を実施したマシンを選択し（チェックボックスを有効化）、**Machine Actions** から **Remove 1 Machine from This Console** を選択します。
  
    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/rds/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon RDS</a>** のページを開き、左のメニューから **「データベース」** を選択します：

   - **データベースの移行**で作成した **RDS インスタンス**（例：database-1）を選択し、**「変更」** ボタンをクリックします。
   画面の一番下までスクロールし、**「削除保護の有効化」** のチェックを外し、**「次へ」** を選択します。
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.ja.png)
   - **変更のスケジュール**で **「すぐに適用」** にチェックを入れ、**「DB インスタンスの変更」** ボタンをクリックします。
   - データベースの一覧で、再度**同じインスタンス**を選択し、**「アクション」 → 「削除」** を選択します。
   **「最終スナップショットを作成しますか？」** と **「Retain Automated backups」** のチェックを外し、RDS インスタンスを削除します。

    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.ja.png)

3. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/dms/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Database Migration Service (DMS)</a>** のページを開き、以下を実行します： 
      
   - 作成した**データベース移行タスク**を停止し、削除します。タスクの削除が完了したことを確認してから、次に進んでください。
   - **エンドポイント**を削除します。エンドポイントの削除が完了したことを確認してから、次に進んでください。
   - **レプリケーションインスタンス**を削除します。インスタンスの削除が完了したことを確認してから、次に進んでください。
   - **サブネットグループ**を削除します。

     <a href="https://console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">**AWS DMS ダッシュボード**</a>にアクセスして、上に挙げたすべてのリソースが削除されたことを確認します（本ハンズオンよりも前に DMS を使用していなかった場合は、以下のスクリーンショットのように、すべてのカウンタが0になっているはずです）。

     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.ja.png)
   
4. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon Elastic File System (EFS)</a>** のページを開き、以下を実行します： 
   - 作成した**ファイルシステム**を選択して、削除します。

5. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ecs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Elastic Container Service (ECS)</a>** のページを開き、以下を実行します： 
   - **クラスター**（例：unicorn-cluster）を選択し、作成した**サービス**（例：unicorn-svc）を削除します。
   - **タスク定義**（例：unicorn-task-def）を削除します。
   - **クラスター**を削除します。

6. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開き、以下を実行します： 
   - 作成したすべての**EC2 インスタンス**を（名前に CloudEndure のプレフィックスが付いているものも含め）**終了**します。
   - 作成した**ロードバランサー**（例：unicorn-lb）を削除します。

7. マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2" target="_blank" rel="noopener noreferrer">CloudFormation</a>** のページを開き、以下を実行します：
   - **ApplicationMigrationWorkshop** スタックを削除します。

**ApplicationMigrationWorkshop** スタックの削除が完了したら、AWS アカウントを再度確認し、**本ハンズオンで作成されたリソースがすべて削除されていること**を確認します。

最後に、本ハンズオンについての<a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">匿名のアンケート</a>にご協力いただければ幸いです。