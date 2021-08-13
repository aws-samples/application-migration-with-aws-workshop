+++
title = "サーバーの移行"
date = 2019-10-22T20:48:41+02:00
weight = 15
pre = "<b>2. </b>"
+++

#### CloudEndure Migration の概要

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> は、企業の最も複雑なワークロードにおいても、中断やデータの損失なしにアマゾン ウェブ サービス (AWS) への移行を可能にします。継続的なブロックレベルのレプリケーション、自動化されたマシン変換、アプリケーションスタックのオーケストレーションにより、CloudEndure Migration は移行プロセスを簡素化し、ヒューマンエラーの可能性を低減します。

オンプレミスから AWS への移行であっても、AWS 内のリージョン間での移行であっても、**CloudEndure Migration** は、急速に変化する今日のデジタルエコシステムで成功するために必要な、柔軟性の提供とセキュリティ管理を実現します。

![cloudendure-intro](/ce/ce-home.png)

CloudEndure Live Migration の主なメリットは以下の通りです：

- 数分レベルのカットオーバーウィンドウとデータ損失ゼロを実現
- すべてのアプリケーション（データベースやレガシーアプリケーションを含む）で 100% のデータ整合性を実現
- パフォーマンスに影響を与えることなく、大規模な移行を実行
- 幅広いプラットフォームとオペレーティングシステムを移行元としてサポート
- 自動化された移行により、IT リソースとプロジェクト期間を最小限に抑えることが可能

{{% notice note %}}
AWS への移行の場合、CloudEndure Migration は**無料**で利用することができます。  
<a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">登録ページ</a>にアクセスしてアカウントを作成し、いますぐ AWS への移行を開始しましょう。
{{% /notice %}}  

**CloudEndure Migration** の詳細については、以下の動画をご覧ください：
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

本セクションでは、以下の手順に従って、CloudEndure Migration を使用した Web サーバーの Re-Host（リフトアンドシフト) を実行します：

1. [CloudEndure の設定]({{< ref "/CE-Configuration.ja.md" >}})  
2. [ソースマシンへのエージェントインストール]({{< ref "/CE-Agent-Installation.ja.md" >}})  
3. [Blueprint の準備]({{< ref "/CE-Blueprints.ja.md" >}})  
4. [カットオーバーの実行]({{< ref "/CE-Cutover.ja.md" >}})  
5. [アプリケーションの設定]({{< ref "/CE-Webserver-config.ja.md" >}})  
