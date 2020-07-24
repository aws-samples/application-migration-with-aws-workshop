+++
title = "Criar um AWS Elastic Load Balancer"
weight = 35
+++


Na **AWS Console**, selecione **Services**, **EC2** e então **Load Balancers**

Clique o botão **Create Load Balancer** e **Application Load Balancer** como indicado abaixo:

![create-loadbalancer](/ecs/create-lb.png)

No passo **1. Configure Load Balancer**, entre o **Nome** do load balancer (ex. unicorn-lb), escolha a VPC que você usará (ex. TargetVPC) e selecione pelo menos duas public subnets (public-a, public-b) como abaixo:

![configure-loadbalancer](/ecs/configure-lb.png)

No passo **3. Configure Security Group**, escolh o ecurity group LB-SG s.

No passo **4. Configure Routing**, selecione **New target group** no **Target group** e dê um nome fao target group (ex. unicorn-tg). Para o **Target type**, selecione **IP**, deixe o default nos demais campos e clique **Next: Register Targets**

![configure-routing](/ecs/configure-routing.png)

Deixe o default nos register targets, clique **Next: Review** e então clique em **Create** para criar o load balancer.
