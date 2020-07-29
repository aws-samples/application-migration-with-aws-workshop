+++
title = "Crea un Amazon ECS cluster"
weight = 40
+++


### Crea un Amazon ECS cluster

Dalla **AWS console**, andare su **Services**, selezionare **ECS** e quindi seleziona il bottone **Create Cluster** 

Seleziona **Networking only** per il template del cluster e seleziona **Next step**.

![create-cluster](/ecs/create-cluster.png)

Nella sezione di configurazione del cluster, fornire un nome del cluster (ad es. Unicorns-cluster), selezionare la casella "Enable Container Insights" e abilita i **CloudWach container insights** per metriche più approfondite fornite attraverso **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)


Infine, premi il pulsante **Create** per creare il cluster Amazon ECS.
