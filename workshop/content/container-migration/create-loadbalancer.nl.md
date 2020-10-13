+++
title = "Creëer een AWS Elastic Load Balancer"
weight = 35
+++


In het **AWS Console**, selecteer **Services**, **EC2** en dan **Load Balancers**

Klik op de **Create Load Balancer** knop en **Application Load Balancer** zoals hieronder weergegeven:

![create-loadbalancer](/ecs/create-lb.png)

In de eerste stap **1. Configure Load Balancer**, geef de load balancer een naam (b.v. unicorn-lb), kies dan de **VPC** (b.v. TargetVPC) en selecteer jouw **public subnets** voor minimaal twee subnetten (public-a, public-b) alsvolgt:

![configure-loadbalancer](/ecs/configure-lb.png)

In stap **3. Configure Security Group**, kies de LB-SG security groep.

In stap **4. Configure Routing**, selecteer **New target group** onder **Target group** en geef een naam voor de **target group** (b.v. unicorn-tg). Voor **Target type**, selecteer **IP**, laat de rest op de standaardwaarden staan en klik op **Next: Register Targets**

![configure-routing](/ecs/configure-routing.png)

Laat de standaard waarden staan en klik op **Next: Review** en klik op **Create** om de load balancer te creëren.
