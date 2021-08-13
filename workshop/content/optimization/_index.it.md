+++
title = "Ottimizzazione"
weight = 40
pre = "<b>4. </b>"

+++


Congratulazioni, dato che sei qui, sei riuscito a migrare un'applicazione di e-commerce in AWS e ora puoi cercare modi per ottimizzare l'architettura per renderla ancora più sicura, altamente performante, resistente e in modo che utilizzi l'infrastruttura AWS in modo efficiente!

Di seguito troverai idee su cosa puoi fare prendendo in considerazione <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">i 5 Pillars della AWS Well-Architected </a> - Eccellenza operativa, sicurezza, affidabilità, efficienza delle prestazioni e ottimizzazione dei costi.

Puoi anche saperne di più su **AWS Well Architected** guardando il video qui sotto.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Eccellenza operativa

- Configura una <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">dashboard CloudWatch</a> per monitorare le tue risorse in un'unica vista, anche attraverso le regioni AWS.
- Configura una <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">un percorso CloudTraill</a> per essere in grado di monitorare, controllare e creare allarmi su ciò che sta accadendo nei tuoi account AWS

### Sicurezza  
- Passa a HTTPS con <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> gestendo certificati SSL / TLS per crittografare i dati dei clienti in transito (certificati sono già previsti in questo workshop!)
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Crittografa i volumi EBS </a> per proteggere i dati dei clienti a riposo
- Abilita <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> per proteggere la tua applicazione web da attacchi noti (puoi farlo su <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> o meglio su una  <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">distribuzione Amazon CloudFront</a>)
- Usa <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> per proteggere il tuo account AWS e i carichi di lavoro con rilevamento intelligente delle minacce e monitoraggio continuo

### Affidabilità
- Configura un <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> per distribuire il traffico del server Web su più zone di disponibilità
- Configura <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a> per abilitare l'auto-riparazione nel caso in cui le istanze di Webserver non funzionino e per gestire il cambiamento del carico del cliente
- Usa <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - una rete di distribuzione dei contenuti rapida che fornisce dati in modo sicuro ai clienti a livello globale con bassa latenza e velocità di trasferimento elevate, integrandosi perfettamente con <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer"> AWS Shield </a> per la mitigazione DDoS.

### Efficienza delle prestazioni
- Distribuisci <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> per gestire le modifiche dei file su server web
- Usa <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront con AWS S3</a> come origine custom per distribuire contenuti statici per una latenza inferiore per i tuoi clienti e costi inferiori

### Ottimizzazione costi
- Usa <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">Amazon EC2 Spot instances</a> - selezionando il tipo di macchina <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, alcune istanze consentono un **risparmio del 90%** con una frequenza di interruzione <5%
- Utilizza la maggior parte <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">di tipologie di macchine cost-optimized</a>

### Architetture di riferimento

Lo schema seguente mostra un'architettura di riferimento della soluzione, con tutti i componenti sopra elencati distribuiti.

![Reference Architecture](/opt/aws-ref-arch.png)

Per maggiori dettagli , visiona <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">l'Architetture di Riferimento per Wordpress su AWS</a>!
