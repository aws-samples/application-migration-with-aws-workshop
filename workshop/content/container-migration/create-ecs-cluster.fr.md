+++
title = "Création d'un cluster Amazon ECS"
weight = 40
+++


### Créer le cluster Amazon ECS 

A partir de la **console AWS**, allez dans **Services**, Sélectionnez **ECS** puis cliquez sur le bouton **Create Cluster** 

Sélectionnez **Networking only** pour "cluster template" et cliquez sur **Next step**.

![create-cluster](/ecs/create-cluster.png)

Dans la section "cluster configuration" , donnez un nom au cluster (ex : unicorns-cluster), cochez la boîte "Enable Container Insights" pour activer **CloudWach container insights** afin d'obtenir une métrologie plus détaillée dans **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)


A la fin, pressez le bouton **Create** pour créer le cluster Amazon ECS.
