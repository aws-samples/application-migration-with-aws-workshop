+++
title = "Erstellen Sie einen ECS Service"
weight = 60
+++

Sobald Sie die **Amazon ECS Task Definition** abgeschlossen haben, 
können Sie einen **Amazon ECS Service** erstellen.

Wählen Sie den zuvor erstellten **ECS Cluster** aus, klicken Sie 
auf dem Tab **Services** und dann auf die Schaltfläche **Create** darauf.

![create-service](/ecs/create-service.png)

### Schritt 1: Service-Konfiguration

Mit dem **Create Service** Wizard, konfigurieren Sie die folgende Konfiguration 
(stellen Sie sicher, dass Sie im Starttyp **FARGATE** auswählen):
- Wählen Sie die **Task Definition** die Sie vorher erstellt haben aus  
- Wählen Sie die **Platform version 1.4.0** aus                                                                           
- Wählen Sie den **ECS Cluster** den Sie vorher erstellt haben aus und dann fügen Sie **Service name** (z.B. unicorns-svc) zu.
- Setzen Sie die Anzahl der Tasks auf 2  
- Behalten Sie die Standardeinstellung für den Rest bei und klicken Sie auf **Next step** darauf.

![configure-service](/ecs/configure-service.png)

### Schritt 2: Netzwerk-Konfiguration

Wählen Sie die zuvor erstellte VPC in der Netzwerkkonfiguration aus 
und geben Sie Ihre Subnetze und ECS-Tasks SG in die Sicherheitsgruppe ein.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Wählen Sie im Load Balancer-Typ **Application Load Balancer** aus 
und wählen Sie den zuvor erstellten Load Balancer aus.

![container-lb](/ecs/container-lb.png)

Klicken Sie auf **Add to load balance** darauf um den Container name:port hinzufügen zu können.

![container-lb-details](/ecs/container-lb-details.png)

![service-discovery](/ecs/service-discovery.png)

Deaktivieren Sie bei "Service discovery (optional)" das Kontrollkästchen 
"Enable service discovery integration" und drücken Sie auf **Next step** darauf.

### Schritt 3: Auto-Scaling-Konfiguration

Wählen Sie in der Konfiguration für die automatische Skalierung **Configure Service Auto Scaling** aus 
und geben Sie die **minimum, desired, maximum** Anzahl von Tasks an.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

Stellen Sie in den **Automatic task scaling policies** 
den Skalierungsrichtlinientyp (scaling policy type) auf **Target Tracking** um.
Geben Sie den Namen **scalin policy** an (z.B. Requests-policy), 
wählen Sie die Service-Metrik (z.B. ALBRequestCountPerTarget) aus 
und legen Sie dann den Zielwert fest (target value) (z.B. 300) fest.

{{% notice note %}}
Sie können dies für verschiedene Service-Metriken wiederholen (z.B. CPU- und Memory -Auslastung).
{{% /notice %}}  

### Schritt 4: Überprüfung

Überprüfen Sie abschließend die Konfiguration und klicken Sie auf **Create Service** darauf, 
um den Amazon ECS-Service zu erstellen.

Wenn sich der Service-Status auf **Aktiv** ändert und sich alle Tasks auf Status **Running** ändern, 
besuchen Sie mithilfe des Loadbalancer-DNS die Website.

{{% notice note %}}
Möglicherweise müssen Sie auch die automatische Skalierung für die ECS-Nodes konfigurieren. 
Weitere Informationen finden Sie auf [diese Dokumentationsseite](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html).
{{% /notice %}}  

{{% notice tip %}}
Falls Sie auf Probleme stoßen, lesen Sie bitte das [Amazon ECS-Handbuch zur Fehlerbehebung](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html).
{{% /notice %}}
