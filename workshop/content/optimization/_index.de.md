+++
title = "Optimierung"
weight = 40
pre = "<b>4. </b>"

+++

Herzlichen Glückwunsch, seit Sie hier sind, haben Sie es geschafft, eine E-Commerce-Anwendung in AWS zu migrieren, 
und können nun nach Möglichkeiten suchen, die Architektur zu optimieren, um sie noch sicherer, leistungsfähiger, 
ausfallsicherer zu machen, um die AWS-Infrastruktur effizient zu nutzen!

Unten können Sie weitere Ideen finden, die von <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 AWS Well-Architected Pillars</a> 
inspiriert worden sind - Operational Excellence, Security, Reliability, Performance Efficiency  and Cost Optimization.

Sie können mehr über **AWS Well Architected**, wenn Sie folgende Video anschauen.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Operational Excellence

- Konfigurieren Sie ein <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer"> CloudWatch-Dashboard </a>, 
um Ihre Ressourcen in einer zentralen Ansicht zu überwachen auch über AWS-Regionen hinweg.
- Konfigurieren Sie einen <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">dauerhaften CloudTrail-Trail</a> 
um überwachen und benachrichtigen zu können, was in Ihren AWS-Konten geschieht

### Security  
- Nutzen Sie <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> 
um die SSL/TLS-Zertifikate für HTTPS zu verwalten, um die Kundendaten während der Übertragung zu verschlüsseln 
(Zertifikate werden bereits in diesem Workshop bereitgestellt!)
- Aktivieren Sie <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Encrypt EBS volumes</a> um die Kundendaten "at rest" zu schützen.
- Aktivieren Sie <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> um Ihre Webanwendung vor 
unbekannten Angriffen zu schützen (Sie können dies auf <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> 
oder mit <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront-Distribution</a> erreichen)
- Verwenden Sie <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a>, 
um Ihr AWS-Konto und Ihre Workloads mit intelligenter Bedrohungserkennung und kontinuierlicher Überwachung zu schützen.

### Reliability
- Konfigurieren Sie einen <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> 
um die Verfügbarkeit von den Webservern über mehrere Verfügbarkeitszonen (AZ) zu verteilen.
- Konfigurieren Sie <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a>, 
um veränderungen in Last oder automatische Korrektur (austausch von nicht funktionierenden Servern) zu aktivieren.
- Verwenden Sie <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> 
- eine schnelle Content Delivery Lösung, das Kunden weltweit Daten mit geringer Latenz und hohen Übertragungsgeschwindigkeiten sicher liefert 
und sich nahtlos in <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> für DDoS-Schutz integrieren lässt.

### Performance Efficiency
- Verwenden Sie <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> 
um die Persistenzschicht für die Webservers aufzubauen.
- Benutzen Sie <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront mit AWS S3</a> 
um den Statischen-Kontent zu hosten und die niedrigste Latzen zu erreichen.

### Cost optimization
- Benutzen Sie <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot 
instances</a> - wählen Sie <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, 
manche Instanzen können Ersparnisse bis zu **90%** ermöglichen.
- Benutzen Sie für Ihren-Workload <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">Kostenoptimierte Maschinen-Typen</a>

### Die Referenzarchitektur

Das folgende Diagramm zeigt eine Referenzarchitektur der Lösung, wobei alle oben aufgeführten Komponenten bereitgestellt sind.

![Reference Architecture](/opt/aws-ref-arch.png)

Weitere Informationen finden Sie in der <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">AWS Referenzarchitektur für Wordpress</a>!
