+++
title = "Creëer een Amazon ECS Service"
weight = 60
+++

Nadat je de Amazon ECS Taak Definitie hebt geconfigureerd, kun je nu een **Amazon ECS Service** aanmaken.

Selecteer de **ECS cluster** die je eerder hebt aangemaakt, klik dan op **Services** en op de **Create** knop.

![create-service](/ecs/create-service.png)

### Stap 1: Configureer de ECS service

In de **Create Service** wizard, volg de onderstaande configuratie (verzeker jezelf ervan dat je **FARGATE** als **Launch type** hebt geselecteerd).  
- Selecteer de Taak Definitie die je al eerder hebt aangemaakt
- Selecteer **Platform version 1.4.0** 
- Selecteer de ECS Cluster die je hebt aangemaakt
- Geef een name voor de **Service** (b.v. unicorns-svc)  
- Zet het aantal taken op 2  
- Laat de rest van de standaardwaarden staan en klik op **Next step**  

![configure-service](/ecs/configure-service.png)

### Stap 2: Configureer het netwerk

Onder netwerk configuratie, selecteer de VPC die je hebt aangemaakt en kies jouw subnets en selecteer ECS-Tasks-SG als de security groep.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Selecteer **Application Load Balancer** als het type load balancer, en kies de load balancer die je eerder hebt aangemaakt.

![container-lb](/ecs/container-lb.png)

Klik op **Add to load balancer** om de container name:port toe te voegen

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
In de **Service discovery (optional)** sectie, de-activeer de optie **Enable service discovery integration** en klik **Next step**

### Stap 3: Configureer Auto-Scaling

Onder Auto-Scaling configuratie, selecteer **Configure Service Auto Scaling** en specificeer het **minimum, desired, maximum** aantal taken.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

Onder **Automatic task scaling policies**, zet het type scaling policy als **Target Tracking**, geef een naam voor de **scaling policy** (b.v. Requests-policy), selecteer het service meetpunt (b.v. ALBRequestCountPerTarget) en stel de doelwaarde in (b.v. 300).

{{% notice note %}}
Ju kunt bovenstaande stappen herhalen voor andere meetpunten zoals **CPU** en **Memory utilization**).
{{% /notice %}}  

### Stap 4: Controleer de configuratie

Tot slot, controleer de configuratie en druk op **Create Service** om de **Amazon ECS Service** aan te maken.

Zodra de status van de **Service** op **Active** staat en de status van alle taken staat op **Running**, ga dan naar in je web browser naar de URL van je web pagina in de doelomgeving via de loadbalancer DNS naam.

{{% notice note %}}
Het kan zijn dat je ook de auto-scaling voor de ECS nodes dient te configureren. Bekijk  [deze documentatie](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  

{{% notice tip %}}
In het geval van problemen, bekijk dan de [Amazon ECS Troubleshooting guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
