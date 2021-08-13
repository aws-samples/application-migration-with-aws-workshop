+++
title = "Optimisation"
weight = 30
pre = "<b>4. </b>"

+++


Félicitations, si vous êtes ici, c'est que vous avez réussi à migrer (re-hosting d'un serveur web et re-platforming d'une base de données) une application e-commerce dans AWS. Vous pouvez maintenant regarder comment optimiser l'architecture pour la rendre encore plus sécurisée, résiliente et capable d'utiliser les services AWS de manière plus efficiente !
 
Ci-dessous, vous trouverez des idées pour réaliser tout cela selon les <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 pilliers du AWS Well-Architected Framework</a> - Excellence opérationnelle, Securité, Résilience, Efficience des performances and Optimisation des Coûts.

Vous pouvez aussi en savoir plus à propos de **AWS Well Architected** en regardant la video ci-dessous.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Excellence opérationnelle

- Configurer un <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer">Tableau de bord CloudWatch</a> pour surveiller vos ressources dans un point central, même à travers différentes régions AWS
- Configurer un <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">trail CloudTrail persistant</a> afin de surveiller, alerter et auditer tout ce qui se passe sur vos comptes AWS

### Securité  
- Basculer vers HTTPS avec <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> pour des Certificats SSL/TLS gérés pour crypter les données client "en transit" (les certificats sont déjà provisionés pour le workshop) 
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Crypter les volumes EBS </a> pour protéger les données des clients "en local"
- Activer <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> pour protéger vos applications web des attaques connues (vous pouvez le faire pour le service <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> ou encore mieux pour <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront distribution</a>)
- Utilisez <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> pour protéger votre compte AWS et vos charges de travail avec une détection intelligente des menaces et une surveillance continue

### Résilience
- Configurez un <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> pour distribuer le traffic vers les servuers web au travers de plusieurs "availability zones"
- Configurez <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">Amazon EC2 Auto Scaling Group</a> pour activer la haute-disponibilité dans le cas d'une défaillance d'un serveur web pour supporter la charge attendue
- Utilisez <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - un réseau de gestion de contenu rapide qui permet de mettre à disposition les données aux clients globallement avec une faible latence et une vitesse de transfert élevée, s'intégrant facilement avec <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> pour l'atténuation des attaques DDoS.

### Efficience des performances
- Déployer <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> pour partager les fichiers entre les serveurs web
- Utiliser <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront avec AWS S3</a> comme origine personalisée pour distribuer le contenu statique avec une faible latence à vos clients à un coût réduit

### Optimisation des Coûts
- Utiliser <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">les instances spot Amazon EC2</a> - sélectionnez le type d'instance <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, certaines instances permettent **90% de réduction** avec <5% de fréquence d'interruption
- Utilisez le plus possible <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">de types d'instances aux coûts optimisés</a>

### Architecture de référence

Le Diagramme ci-dessous décrit une architecture de référence de la solution avec tous les composants listés ci-dessus déployés.

![Architecture de référence](/opt/aws-ref-arch.png)

Pour plus d'information consultez <a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">l'architecture de référence pour Wordpress sur AWS</a> !
