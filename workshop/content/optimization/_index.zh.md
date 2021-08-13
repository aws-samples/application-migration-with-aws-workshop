+++
title = "优化"
weight = 40
pre = "<b>4. </b>"

+++


祝贺您！到此为止，您已经设法将电子商务应用迁移到 AWS，现在可以开始寻找优化架构的方法，使其更加安全、高性能且具有弹性，从而高效地使用 AWS 基础设施！

下面您将找到您可以做点什么的想法，考虑 <a href="https://aws.amazon.com/cn/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 个 AWS 良好架构（Well-Architected）支柱</a> - 卓越运营，安全性，可靠性，性能效率和成本优化。

您还可以通过观看以下视频了解有关 **AWS 良好架构** 的更多信息。
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### 卓越运营

- 配置 <a href="https://docs.aws.amazon.com/zh_cn/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">CloudWatch 控制面板</a> 在单一视图中监控资源，甚至跨 AWS 区域。
- 配置 <a href="https://docs.aws.amazon.com/zh_cn/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">持久性 CloudTrail 跟踪</a> 监控、审计和告警在您的 AWS 账号中所发生的事件。

### 安全性  
- 切换到 HTTPS，使用 <a href="https://aws.amazon.com/cn/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> 管理 SSL/TLS 证书以加密传输中的客户数据（证书已经在本研讨会中提供！）
- <a href="https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">加密 EBS 卷</a> 保护存储的客户数据
- 启用 <a href="https://aws.amazon.com/cn/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> 保护您的 Web 应用免遭已知攻击 (您可以在 <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> 上或者在 <a href="https://docs.aws.amazon.com/zh_cn/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront 分配</a> 上配置）
- 使用 <a href="https://aws.amazon.com/cn/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> 通过智能威胁监测和持续监控保护您的 AWS 账号和工作负载

### 可靠性
- 配置 <a href="https://docs.aws.amazon.com/zh_cn/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> 跨多个可用区分发 web 服务器流量
- 配置 <a href="https://docs.aws.amazon.com/zh_cn/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling 组</a> 启用自动修复功能，以防 Web 服务器实例出现故障并应对不断变化的客户负载
- 使用 <a href="https://docs.aws.amazon.com/zh_cn/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - 一个能够低延迟、高速地安全交付数据给全球客户的内容分发网络，可以和 <a href="https://aws.amazon.com/cn/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> 无缝集成以缓解 DDoS 攻击。

### 性能效率
- 部署 <a href="https://docs.aws.amazon.com/zh_cn/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> 应对 Web 服务器上的文件变更
- 使用 <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront 和 AWS S3</a> 作为自定义源，以较低的延迟和成本分发静态内容

### 成本优化
- 使用 <a href="https://aws.amazon.com/cn/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot 实例</a> - 使用 <a href="https://aws.amazon.com/cn/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a> 选择实例类型，部分实例在小于 5% 的中断频率下可达到 **90% 节省**
- 使用 <a href="https://aws.amazon.com/cn/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">成本优化的实例类型</a>

### 参考架构

下图描述了该方案的参考架构，包括上面列出的所有组件。

![Reference Architecture](/opt/aws-ref-arch.png)

更多的详细信息请参考 <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">运行在 AWS 上的 Wordpress 参考架构</a>!
