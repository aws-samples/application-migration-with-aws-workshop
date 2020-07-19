+++
title = "Création d'un Elastic Load Balancer AWS"
weight = 35
+++


A partir de **AWS Console**, sélectionnez **Services**, **EC2** puis **Load Balancers**

Cliquez sur le bouton **Create Load Balancer** et **Application Load Balancer** comme indiqué ci-dessous :

![create-loadbalancer](/ecs/create-lb.png)

Dans l'étape **1. Configurer le load balancer**, entrez le **Nom** du "load balancer" (ex : unicorn-lb), choisissez le VPC que vous utilisez (ex : TargetVPC) et sélectionnez au minimum deux subnets public (public-a, public-b) comme ci-dessous :

![configure-loadbalancer](/ecs/configure-lb.png)

Dans l'étape de configuration **3. Configurer le "Security Group"** , choisissez le "security group" LB-SG.

Dans l'étape **4. Configurer le routage** , sélectionnez **New target group** dans **Target group** et fournissez un nom pour le "target group" (ex : unicorn-tg). pour le  **Target type**, sélectionnez **IP**, laissez les valeurs par défaut pour les autres champs et cliquez sur **Next: Register Targets**

![configure-routing](/ecs/configure-routing.png)

Laissez les valeurs par défaut pour "register targets", cliquez **Next: Review** et enfin, cliquez sur **Create** pour créer le "load balancer".
