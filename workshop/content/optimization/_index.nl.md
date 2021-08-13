+++
title = "Optimalisatie"
weight = 40
pre = "<b>4. </b>"

+++


Gefeliciteerd! Nu dat je hier bent aangekomen heb je succesvol de migratie van de web server (re-host) en de database server (re-platform) voor de e-commerce applicatie naar AWS en kun je nu verder gaan met kijken naar manieren om de applicatie verder to optimaliseren en veiliger, sneller en foutbestendiger te maken door de AWS infrastructuur op meest efficiente manier te gebruiken!

Onderstaand vind je enkele ideeën in het kader van de <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 AWS Well-Architected Pillars</a> - **Operational Excellence**, **Security**, **Reliability**, **Performance Efficiency** en **Cost Optimization**.

Je kunt ook meer leren over AWS Well Architected door de onderstaande video te bekijken.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Operational Excellence

- Configureer een <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">CloudWatch dashboard</a> om je AWS resources te kunnen bewaken in één overzicht (ook over meerdere **AWS regions**).
- Configureer een <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">persistent CloudTrail trail</a> voor het bewaken, inspecteren en alarmeren van alles wat in je AWS account gebeurd.

### Security  
- Schakel over op HTTPS met door <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> beheerde SSL/TLS certificaten voor het versleutelen van dataverkeer (certificaten zijn al aangemaakt in deze workshop!)
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Versleutel EBS volumes</a> om dataopslag te beveiligen
- Gebruik <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> voor het beveiligen van je web applicatie tegen aanvallen (je kunt dit doen op de <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> of beter nog, op de <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront distributie</a>
- Gebruik <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> voor het beveiligen van je AWS account en applicaties met intelligente bedreigingsdetectie en continue bewaking.

### Reliability
- Configureer een <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> voor het distribueren van Webserver verkeer over meerdere **Availability Zones**
- Configureer <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a> voor automatisch herstel in het geval dat de web server niet functioneert en voor het automatisch opschalen van capaciteit bij hogere belasting van de web servers.
- Gebruik <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - een snel Content Distribution Network (CDN) dat op een veilige, snelle en efficiënte manier data naar de klanten stuurt, geïntegreerd met <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> voor DDoS beveiliging.

### Performance Efficiency
- Gebruik <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> voor het opslaan van bestanden voor de web serers
- Gebruik <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront with AWS S3</a> als een **custom origin** voor het distribueren van statische web inhoud.

### Cost optimization
- Gebruik <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot instances</a> - selecteer machinetypes via <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, sommige machinetypes geven tot **90% korting** met minder dan 5% kans op interruptie.
- Gebruik de meest <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">optimale machinetypes</a>

### Reference architecture

De onderstaande illustratie is een referentie-architectuur van de totaaloplossing inclusief alle bovenstaande toevoegingen.

![Reference Architecture](/opt/aws-ref-arch.png)

Voor meer informatie, kijk naar de <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">Reference Architecture for Wordpress on AWS</a>
