+++
title = "Creëer een Amazon ECS cluster"
weight = 40
+++

### Creëer een Amazon ECS cluster

In het **AWS console**, ga naar **Services**, selecteer **ECS** en klik dan op de **Create Cluster** knop.

Selecteer **Networking only** als cluster template en klik dan op **Next step**.

![create-cluster](/ecs/create-cluster.png)

In de cluster configuratie sectie, vul een naam in voor de cluster (b.v. unicorns-cluster), selecteer de **Enable Container Insights** optie voor het activeren van **CloudWach container insights** voor het verkrijgen van dieper inzicht via **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)

Tot slot, druk op de **Create** knop om het Amazon ECS cluster aan te maken.