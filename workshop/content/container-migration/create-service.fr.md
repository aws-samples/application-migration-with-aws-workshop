+++
title = "Création d'un service Amazon ECS"
weight = 60
+++

Dès que vous avez terminé la **Task Definition Amazon ECS**, vous êtes prêts à créer un **Service Amazon ECS**.

Sélectionnez le **cluster ECS** que vous avez créé précédemment, cliquez l'onglet **Services** puis le bouton **Create**.

![create-service](/ecs/create-service.png)

### Step 1: Configurer le service

Dans le "wizard" **Create Service** , suivez la configuration décrite ci-dessous (assurez-vous d'avoir sélectionné **FARGATE** dans **Launch type**).  

- Sélctionnez la **Task Definition** que vous avez créé plus tôt 
- Sélectionnez **Platform version 1.4.0**                                                                           
- Sélectionnez le **Cluster ECS** que vous avez créé précédemment et entrez le **Service name** (ex : unicorns-svc)                                   
- Positionnez le nombre de "tasks" à 2  
- Laissez les valeurs par défaut pour les autres paramètres et cliquez sur **Next step**  


![configure-service](/ecs/configure-service.png)

### Step 2: Configurer le réseau 

Dans la configuration réseau, sélectionnez le VPC que vous avez créé plus tôt et spécifiez vos "subnets" et ECS-Tasks-SG dans le "security group".

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Sélectionnez **Application Load Balancer** dans le type du "load balancer" et choisissez le "load balancer" que vous avez créer avant.

![container-lb](/ecs/container-lb.png)

Cliquez sur **Add to load balancer** pour ajouter le "container name:port"

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
Dans la section "Service discovery" (option) , **décochez** "Enable service discovery integration" et pressez [Next step]

### Step 3: mettre en place Auto Scaling

Dans "Auto Scaling configuration", sélectionnez **Configure Service Auto Scaling** et spécifiez le nombre de tâches **minimum, desired, maximum**.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

Dans **Automatic task scaling policies**, positionnez "scaling policy type" à **Target Tracking**, fournissez le nom de la "scaling policy" (ex : Requests-policy), sélectionnez la "service metric" (ex : ALBRequestCountPerTarget) et puis indiquez la "Target value" (ex : 300).

{{% notice note %}}
Vous pouvez répéter cela pour différentes "service metrics" (ex : CPU and Memory utilization).
{{% /notice %}}  

### Step 4: Vérifier

Enfin, vérifiez et cliquez sur **Create Service** pour créer le "Service" Amazon ECS.

Dès que le statut du Service est dans l'état **Active** et que toutes les tâches sont dans l'état **Running**, Accéder le site cible en utilisant l'adresse DNS du "load balancer".

{{% notice note %}}
Vous pouvez aussi configurer l'"autoscaling" pour les noeuds du cluster ECS, consultez le guide [this guide for more details](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
Si vous recontrez des problèmes, merci de consulter [Amazon ECS Troubleshooting guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
