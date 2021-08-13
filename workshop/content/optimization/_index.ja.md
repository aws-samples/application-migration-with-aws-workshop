+++
title = "最適化"
weight = 30
pre = "<b>4. </b>"

+++

おめでとうございます！これで、eコマースアプリケーションの AWS への移行（Web サーバーの Re-Host とデータベースの Re-Platform）は完了です。
続いて、より高いセキュリティ、パフォーマンスと弾力性を提供し、AWS のインフラストラクチャをより効率的に利用できるアーキテクチャを目指すべく、
アーキテクチャの最適化について検討しましょう。

以下では、<a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">**AWS Well-Architected フレームワーク**</a>の5本の柱（運用上の優秀性、セキュリティ、信頼性、パフォーマンス効率、コスト最適化）をもとに、取り得るアクションの例を紹介しています。

**AWS Well-Architected フレームワーク** の詳細については、以下の動画をご覧ください：
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### 運用上の優秀性

- <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">**CloudWatch Dashboard**</a> を設定し、複数の AWS リージョンにまたがるリソースでも、単一のビューでリソースを監視できるようにします。
- <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">**永続的な CloudTrail 証跡**</a>を設定し、AWS アカウントで起きたイベントについて、監視や監査、アラートの発行を実施できるようにします。

### セキュリティ
- アプリケーションの通信を、<a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">**AWS Certificate Manager**</a> が管理する SSL/TLS 証明書を使った HTTPS 通信に切り替え、伝送中の顧客データを暗号化します（証明書は本ハンズオンで既にプロビジョニング済みです）。
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">**EBS ボリュームを暗号化**</a>して、保管中の顧客データを保護します。
- <a href="https://aws.amazon.com/waf/" target="_blank" rel="noopener noreferrer">**AWS Web Application Firewall (WAF)** </a> を有効にして、既知の攻撃から Web アプリケーションを保護します（<a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">**Application Load Balancer**</a> または <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">**Amazon CloudFront ディストリビューション**</a>に対して適用します）。
- <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">**Amazon GuardDuty**</a> を使用して、インテリジェントな脅威検知と継続的な監視で、AWS アカウントとワークロードを保護します。

### 信頼性
- <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">**Application Load Balancer**</a> を構成し、Web サーバーのトラフィックを複数のアベイラビリティゾーンに分散させます。
- <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">**Amazon EC2 の Auto Scaling グループ**</a>を設定し、Web サーバーインスタンスの障害に備えた自動ヒーリングの有効化や、ユーザーのトラフィックが変化した場合にも対応できるようにします。
- 低遅延かつ高い転送速度で、世界中の顧客にデータを安全に配信できる、高速なコンテンツ配信ネットワーク <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">**Amazon CloudFront**</a> を利用し、
<a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">**AWS Shield**</a> と統合することで DDoS 攻撃を軽減します。

### パフォーマンス効率
- <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer"> **Amazon Elastic File System (EFS)** </a> を導入し、Web サーバー上で行われたファイルの変更を処理します。
- <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">**Amazon CloudFront で AWS S3 をカスタムオリジンとして指定**</a>し、静的コンテンツを配信することで、レイテンシーとコストを抑えます。

### コスト最適化
- <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">**Amazon EC2 スポットインスタンス**</a>を使用し、インスタンスタイプの選択には<a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">**スポットインスタンスアドバイザー**</a>を使用します（インスタンスによっては、**最大90%のコスト削減**と**5%未満の中断頻度**を実現することができます）。
- 最も<a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">**コストに最適化されたインスタンスタイプ**</a>を使用します。

### リファレンスアーキテクチャ

以下の図は、上に挙げたすべてのコンポーネントがデプロイされた、リファレンスアーキテクチャを示しています：

![Reference Architecture](/opt/aws-ref-arch.png)

詳細については、<a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">**Wordpress on AWS のリファレンスアーキテクチャ**</a>を確認してください。