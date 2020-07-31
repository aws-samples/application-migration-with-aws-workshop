+++
title = "Erstellen Sie einen **AWS Elastic Load Balancer**"
weight = 35
+++


Besuchen Sie **AWS Console**, **Services**, **EC2** und dann klicken Sie auf **Load Balancers** darauf.

Wählen Sie die Schaltfläche **Create Load Balancer** auf und den **Application Load Balancer** wie auf dem Bild unten:

![create-loadbalancer](/ecs/create-lb.png)

In dem ersten Schritt ** 1. Configure Load Balancer**, geben Sie den Load Balancer **Name** ein (z. B. unicorn-lb), 
wählen Sie die von Ihnen verwendete VPC aus (z.B. **TargetVPC**) und wählen Sie Ihre öffentlichen Subnetze 
für mindestens zwei Subnetze wie folgt aus (public-a, public- b):

![configure-loadbalancer](/ecs/configure-lb.png)

In dem dritten Schritt **3. Configure Security Group** wählen Sie die **LB-SG** Sicherheitsgruppe aus.

In dem vierten Schritt **4. Configure Routing** wählen Sie **New target group** in **Target group** Menü
und fügen Sie den Namen für die Zielgruppe hinzu (z.B. unicorn-tg). 
Beim **Target type**, wählen Sie die **IP** aus, übernehmen Sie die Standardeinstellung 
für die anderen Dateien und klicken Sie auf die Schaltfläche **Next: Register Targets** darauf.

![configure-routing](/ecs/configure-routing.png)

Übernehmen Sie die Standardeinstellungen für die Registerziele (register targets), 
klicken Sie auf **Next: Review** darauf und dann auf **Create** um den Load Balancer zu erstellen.
