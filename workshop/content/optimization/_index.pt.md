+++
title = "Otimização"
weight = 40
pre = "<b>4. </b>"

+++


Parabéns, como chegou até aqui, você conseguiu migrar um e-commerce para a AWS e agora pode otimizar a arquitetura para torná-la ainda mais segura, rápida e resiliente, usando a infraestrutura AWS de forma mais eficiente possível!

Abaixo você encontrará ideias sobre o que levar em conta usando os <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 pilares do AWS Well-Architected</a>:  Operational Excellence, Security, Reliability, Performance Efficiency  e Cost Optimization.

Você pode aprender mais sobre o **AWS Well Architected** assistindo o vídeo abaixo.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Operational Excellence

- Configure o <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">CloudWatch dashboard</a> para monitorar seus rescursos numa visão única, mesmo entre diferentes regiões AWS.
- Configure um <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">CloudTrail trail persistente</a> de forma a monitorar, auditar e alertar o que está acontecendo nas suas contas AWS

### Security  
- Mude para HTTPS com certificados do <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> SSL/TLS gerenciados para criptografar dados dos clientes em trânsito (certificados já foram provisionados neste workshop!)
- Veja <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Encrypt EBS volumes</a> para proteger os dados dos clientes em descanso
- Habilite o <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> para proteger sua aplicação web de ataques (seja usando o <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> ou ainda o <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront distribution</a>)
- Use o <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> para proteger sua conta AWS e cargas de trabalho com detecção de ameaças inteligente e monitoração contínua

### Reliability
- Configure um <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> para distribuir o tráfego do Webserver entre múltiplas Availability Zones
- Configure o <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a> para habilitar a "auto-cura" de instâncias Webserver caso elas parem e também para lidar com as demandas de carga 
- Use o <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - uma Content Distribution Network rápida que entrega de forma segura os dados para os clientes globalmente com baixa latência e altas velocidades de transferência, integrando de forma transparente com o <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> para mitigação de DDoS.

### Performance Efficiency
- Implemente o <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> para lidar com mudanças de arquivos nos Webservers
- Use o <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront with AWS S3</a> como uma custom origin para distribuir conteúdo estático com baixa latência para seus clientes com baixo custo

### Cost optimization
- Use as <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot instances</a> - selecione tipos de máquina usando o <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, algumas instâncias permitem atingir **90% de economia** com <5% de frequência de interrupção
- Use tipos de máquinas <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer"> com custo otmiziado</a>

### Arquitetura de referência

O diagrama abaixo descreve a arquitetura de referência da solução com todos os componentes acima mencionados implementados.

![Reference Architecture](/opt/aws-ref-arch.png)

Para mais detalhes veja a <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">Arquitetura de Referência de Wordpress na AWS</a>!
