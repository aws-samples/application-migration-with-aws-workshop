+++
title = "Crea un AWS Elastic Load Balancer"
weight = 35
+++


Dalla **AWS Console**, seleziona **Services**, **EC2** e quindi **Load Balancers**

Clicca sul bottone **Create Load Balancer** e **Application Load Balancer** come indicato qui sotto:

![create-loadbalancer](/ecs/create-lb.png)

Nello step  **1. Configure Load Balancer** , inserisci il **Nome** del load balancer(e.g. unicorn-lb), scegli il VPC che stai usando (e.g TargetVPC) e seleziona le tue subnet pubbliche per almeno due subnet (public-a, public-b) come di seguito:

![configure-loadbalancer](/ecs/configure-lb.png)

Nello step **3. Configure Security Group** , scegli il security group LB-SG.

Nello step **4. Configure Routing** , seleziona **New target group** nel **Target group** e fornire un nome per il gruppo target (e.g. unicorn-tg). Per il **Target type**, selezionare **IP**, lasciare il valore predefinito per gli altri campi e fare clic su **Next: Register Targets**

![configure-routing](/ecs/configure-routing.png)

Lasciare l'impostazione predefinita delle destinazioni del registro, clicca **Next: Review** e quindi clicca **Create** per creare il load balancer.
