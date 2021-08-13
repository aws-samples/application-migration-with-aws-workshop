+++
title = "自身の環境でハンズオンを開始"
weight = 20
+++

{{% notice warning %}}
このセクションは、ご自身の環境でハンズオンを実施する場合にのみ、実行してください。AWS が主催するイベント（re:Invent、Gameday、ワークショップ、または AWS の従業員が主催するその他のイベント）に参加している場合は、[AWSイベントでハンズオンを開始]({{< ref "/at-aws-event.ja.md" >}})に進んでください。
{{% /notice %}}

### ハンズオン環境の準備

本ハンズオンでは、**AWS アカウント**に<a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">管理者権限</a>でアクセスできることを前提としています。新しく AWS アカウントを作成する場合は、<a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">こちらの記事</a>を参考にしてください。

以下の手順では、移行元となる環境（ソース）を、AWS アカウント内にデプロイします。デプロイされるリソースは、2つの t3.micro インスタンス（Web サーバー用に1つ、データベース用に1つ）、NAT Gateway、API Gateway、2つの Lambda 関数（EC2 インスタンスへのアクセスに必要な SSH キーペアの取得を簡略化するために使用）で構成されます。ハンズオン全体を通してデプロイされるリソースの総コストは、約4時間の作業で5ドル未満を想定しており、その一部は <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">AWS 無料利用枠</a>でカバーされます。

不要な請求を避けるために、ハンズオンの完了後は必ず [ハンズオン環境の削除]({{< ref "/cleanup/_index.ja.md" >}})を実施してください。

#### オプション1： CloudFormation による自動デプロイ

1. 以下のボタンをクリックします。 <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>

2. **「ステップ1 ： テンプレートの指定」** で、画面右上に表示されるリージョンが**オレゴン**になっていること、
**Amazon S3 URL** のフィールドにテンプレートの URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml が入力されていることを確認し、**「次へ」** をクリックします。
![CloudFormation Step 1](/intro/cloudformation-step1.ja.png)

3. **「ステップ2 ： スタックの詳細を指定」** で、**スタックの名前**のフィールドに、ApplicationMigrationWorkshop が入力されていることを確認し、**「次へ」** をクリックします。
![CloudFormation Step 2](/intro/cloudformation-step2.ja.png)

4. **「ステップ3 ： スタックオプションの設定」** では、何も変更せずに **「次へ」** をクリックします。

5. **「ステップ4 ： レビュー」** で、ページの一番下までスクロールし、以下のスクリーンショットのように、**すべてのチェックボックス** をオンにしてから、**「次へ」** をクリックして、スタックの作成を開始します。
![CloudFormation Step 4](/intro/cloudformation-step4.ja.png)

スタックの状態が **CREATE_COMPLETE** になったことを確認し、
以下のスクリーンショットのように、**「出力」** タブから作成されたソース環境に関する情報を確認します。  
作成中に、スタックのページから離れてしまった場合は、マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2" target="_blank" rel="noopener noreferrer">CloudFormation</a>** のページを開き、上の手順で作成した**スタック**（ApplicationMigrationWorkshop）を選択することで、元のページに戻ることが可能です。
![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.ja.png)

上で確認した情報は、ハンズオンで使用するため、テキストエディタ等にコピーを取っておいてください。

{{% notice tip %}}
AWS アカウント内に、既に同じ名前の IAM ロールが存在することで、スタックの作成が失敗する場合は、既存のロールを削除して、スタックの作成を再実行してください。
{{% /notice %}}

以上でデプロイは完了です。 [AWS Migration Hub の有効化]({{< ref "/migration-hub.ja.md" >}})に進んでください。

---

#### オプション2： ソースコードからビルドしてデプロイ

{{% notice note %}}
オプション1で環境をすでにデプロイしている場合は、オプション2を実行する必要はありません。
{{% /notice %}}

以下のセクションでは、CloudFormation のテンプレートを作成し、AWS Command Line Interface（CLI）を使用して、環境をデプロイする方法について説明します。

1. <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS Serverless Application Model (SAM)</a> をインストールします。

2. <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> をインストールし、<a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">設定</a>します。

3. <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a> からプロジェクトをダウンロードまたはクローンします。
   ```
   git clone https://github.com/aws-samples/application-migration-with-aws-workshop.git
   ```  

4. 次のコマンドを実行して、*us-west-2*（オレゴン）リージョン に、新しい S3 バケットを作成します（**application-migration-workshop** の部分は、半角英数字の任意の名前に置き換えて実施ください）。
   ```
   aws s3 mb s3://application-migration-workshop --region us-west-2
   ```  

5. テンプレートをビルドし、デプロイします（**application-migration-workshop** の部分は、前のステップで作成した S3 バケットの名前に置き換えて実施ください）。
   ```
   cd application-migration-with-aws-workshop/resources
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam/build/template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. デプロイが完了すると、以下のスクリーンショットのように、ソース環境に関する情報がコンソールに表示されます。
![Source Environment in CLI Console](/intro/self-service-env-cli-info.ja.png)

マネジメントコンソール上部の **「サービス」** から **<a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2" target="_blank" rel="noopener noreferrer">CloudFormation</a>** のページを開き、上の手順で作成した**スタック**（ApplicationMigrationWorkshop）を選択、**「出力」** タブを開くことで、同様の情報をいつでも確認することができます。
![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.ja.png)

{{% notice tip %}}
AWS アカウント内に、既に同じ名前の IAM ロールが存在することで、スタックの作成が失敗する場合は、既存のロールを削除して、スタックの作成を再実行してください。
{{% /notice %}}

以上で環境の確認は完了です。 [デプロイされた環境の確認]({{< ref "./review-deployment.ja.md" >}})に進んでください。