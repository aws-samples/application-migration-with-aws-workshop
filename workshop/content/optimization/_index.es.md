+++
title = "Optimizacion"
weight = 40
pre = "<b>4. </b>"

+++


Enhorabuena, si has llegado aqui has conseguido migrar una aplicación de commercio electrónico a AWS y ahora puedes mirar como optimizar la arquitectura para hacerlo incluso mas seguro, de alto rendimiento, fiable y ¡que use la infraestructura de AWS eficientemente!

Mas abajo encontrara ideas que puede considerar <a href="https://aws.amazon.com/architecture/well-architected/" target="_blank" rel="noopener noreferrer">5 Pilares del Marco de Buena Arquitectura de AWS</a> - Excelencia Operativa, Seguridad, Fiabilidad, Eficacia del rendimiento y Optimizacion de costes.

Tambien puede aprender mas sobre **Marco de Buena Arquitectura** viendo el video de abajo.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/MfxF-FYEFjY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

### Excelencia Operativa

- Configura un a <a href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html" target="_blank" rel="noopener noreferrer"> informe de CloudWatch </a> para monitorizar tus recursos en una unica vista, incluso a traves de varias regiones de AWS.
- Configura un <a href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-create-and-update-a-trail.html" target="_blank" rel="noopener noreferrer">registro persistente de CloudTrail</a> para ser capaz de monitorizar, auditar y alertar que esta pasando en tus cuentas de AWS

### Seguridad  
- Cambia a HTTPS con <a href="https://aws.amazon.com/certificate-manager/" target="_blank" rel="noopener noreferrer">AWS Certificate Manager</a> gestiona certificados SSL/TLS para encriptar datos de cliente en transito (¡los certificados ya se proporcionan en este laboratorio!) 
- <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html" target="_blank" rel="noopener noreferrer">Encripta volumenes EBS</a> para proteger los datos del cliente en reposo
- Habilita <a href="https://aws.amazon.com/waf/"  target="_blank" rel="noopener noreferrer">AWS Web Application Firewall (AWS WAF)</a> para proteger tu aplicacion web de ataques conocidos (puedes hacerlo aqui <a href="https://aws.amazon.com/blogs/aws/aws-web-application-firewall-waf-for-application-load-balancers/" target="_blank" rel="noopener noreferrer">Application Load Balancer</a> o incluso mejor en <a href="https://docs.aws.amazon.com/waf/latest/developerguide/cloudfront-features.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront distribution</a>)
- Usa <a href="https://aws.amazon.com/guardduty/" target="_blank" rel="noopener noreferrer">Amazon GuardDuty</a> para proteger tu cuenta de AWS y las cargas de trabajo con deteccion inteligente de amenazas y monitorización continua

### Fiabilidad
- Configura un <a href="https://docs.aws.amazon.com/elasticloadbalancing/latest/application/create-application-load-balancer.html" target="_blank" rel="noopener noreferrer"> Balanceador de Carga de Aplicaciones (Application Load Balancer)</a> para distribuir la carga de los servidores Web a traves de multiples Zonas de Disponibilidad
- Configura <a href="https://docs.aws.amazon.com/autoscaling/ec2/userguide/GettingStartedTutorial.html" target="_blank" rel="noopener noreferrer">grupos de auto escalado de Amazon (Amazon EC2 Auto Scaling Group)</a> para habilitar la autoreparacion en el caso de que las instancias de los servidores web se caigan y puedan gestionar la carga de los clientes
- Usa <a href="https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/distribution-working-with.html" target="_blank" rel="noopener noreferrer">Amazon CloudFront</a> - una Red de Distribucion de Contenido (Content Distribution Network) rapida que puede entregar datos de forma segura a los clientes de forma global, con baja latencia y con grandes velocidades de trasferencia, integrando de forma transparente con <a href="https://aws.amazon.com/shield/" target="_blank" rel="noopener noreferrer">AWS Shield</a> para mitigar DDoS.

### Rendimiento Eficiente
- Deploy <a href="https://docs.aws.amazon.com/efs/latest/ug/getting-started.html" target="_blank" rel="noopener noreferrer">Amazon Elastic File System</a> to handle changes of files on Webservers
- Use <a href="https://aws.amazon.com/blogs/networking-and-content-delivery/amazon-s3-amazon-cloudfront-a-match-made-in-the-cloud/" target="_blank" rel="noopener noreferrer">Amazon CloudFront with AWS S3</a> as custom origin to distribute static content for lower latency for your customers and lower cost

### Optimizacion de Costes
- Usa <a href="https://aws.amazon.com/ec2/spot/" target="_blank" rel="noopener noreferrer">instancias Spot de Amazon EC2</a> - selecciona el tipo de maquina usando <a href="https://aws.amazon.com/ec2/spot/instance-advisor/" target="_blank" rel="noopener noreferrer">EC2 Spot Advisor</a>, algunas instances permiten obtener **90% ahorros** con <5% interrupciones
- Usa los <a href="https://aws.amazon.com/ec2/spot/pricing/" target="_blank" rel="noopener noreferrer">tipos de maquinas mas optimas para el coste</a>

### Arquitectura de Referencia

El Diagrama de abajo describe una arquitectura de referencia de la solución, con todos los componentes listados abajo desplegados.

![Reference Architecture](/opt/aws-ref-arch.png)

Para mas detalles visita<a href="https://github.com/aws-samples/aws-refarch-wordpress" target="_blank" rel="noopener noreferrer">Arquitectura de Referencia de Wordpress en AWS</a>!
