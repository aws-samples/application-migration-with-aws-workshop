+++
title = "カットオーバーの実行"
weight = 40

+++
### CloudEndure Migration テスト／カットオーバー

ボリュームのレプリケーションが完了し、CloudEndure コンソール上でマシンのステータスが **Continuous Data Replication** になっていることを確認したら、**テスト／カットオーバー**を実行することができます。

テスト／カットオーバーを開始するたびに、CloudEndure Migration は、以前に作成したインスタンスを**すべて削除**し、ソース環境の最新のデータコピーを持つ新しい ターゲットインスタンスを作成します。

{{% notice note %}}
本ハンズオンではテストをスキップして、**カットオーバーのみ**実行しますが、
実運用においては、目標とする移行日の**少なくとも1週間前**に**テスト**を実施することをお勧めします。
これは Blueprint の構成や、レプリケートされたボリュームの変換における、潜在的な課題を特定し、それらに対処するためです。
{{% /notice %}}


1. ボリュームが完全にレプリケートされていることを確認します。
   
    CloudEndure コンソールの **Machines** 画面を開き、移行対象マシンの **DATA REPLICATION PROGRESS** のステータスが、
    **Continuous Data Replication** になっていることを確認します。

    ボリュームのレプリケーションが完了していない場合は、マシンが **Continuous Data Replication** の状態になるまで待機してください。その間に、 <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">CloudEndure のドキュメント</a>を確認してみましょう。

2. カットオーバーを実行します。
   
    **Machines** 画面でカットオーバーを実行する**マシン**を選択し、画面右上の **LAUNCH 1 TARGET MACHINE** ボタンをクリックします。確認用のポップアップで **Cutover Mode** を選択し、**CONTINUE** をクリックします。

    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure は、ボリュームの最終的な同期／スナップショットを実行し、データの整合性を維持しながら、ターゲットのインフラストラクチャに新しいサーバーを構築するプロセスを開始します。左のメニューから **Job Progress** を選択し、詳細や進行状況を確認してください。

    ![CE-job-progress](/ce/CE-job-progress.png)

    **Job Progress** からジョブの進行状況をモニタリングして、**"Finished machine conversions"** いうメッセージが表示されるまで待機します（3～5分）。その間、カットオーバーのプロセスの詳細について <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">CloudEndure のドキュメント</a>を確認してみましょう。
    

    {{% notice tip %}}
**Job Progress** の画面に、起動したジョブが表示されない場合は、ブラウザをリフレッシュ（F5）し、ジョブのドロップダウンリストの一番上までスクロールするようにしてください。
{{% /notice %}}

3. CloudEndure が作成したリソースを AWS アカウント上で確認します。
   
    AWS マネジメントコンソールに戻り、上部の **「サービス」** から **<a href="https://console.aws.amazon.com/ec2/v2/home?region=us-west-2" target="_blank" rel="noopener noreferrer">EC2</a>** のページを開きます。
    必要に応じて対象の AWS リージョン（us-west-2/オレゴン）に移動してください。

    CloudEndure で管理されている2つの EC2 インスタンスが、追加で表示されます：
    - **CloudEndure Machine Converter** - ブートボリュームの変換や、ブートローダへの変更の適用、ハイパーバイザードライバーやクラウドツールのインストールに使用されます。テストやカットオーバーが実行される度に、数分間稼働します。
    - **CloudEndure Replication Server** - ソース環境にインストールされているエージェントから、暗号化されたデータを受信するために使用されます。データのレプリケーションが実行されている間稼働します。

    どちらのインスタンスも CloudEndure が管理しており、ユーザーがアクセスすることはできません。

    カットオーバーが完了すると、リストに新しい EC2 インスタンスが表示されます - これはCloudEndure によって作成されたターゲットの Web サーバーです。後続のセクションで必要になるため、**パブリック DNS (IPv4)** と**プライベート IP** の値を、テキストエディタにコピーしておいてください。

    {{% notice tip %}}
CloudEndure が管理するインスタンスや、その目的、ネットワーク要件の詳細は、<a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">CloudEndure のドキュメント</a>を参照してください。
{{% /notice %}}
