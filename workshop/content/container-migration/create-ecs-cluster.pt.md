+++
title = "Crie um Amazon ECS cluster"
weight = 40
+++


### Crie um Amazon ECS cluster

Na **AWS console**, vá até **Services**, selecione **ECS** e então clique no botão **Create Cluster** 

Selecione **Networking only** como cluster template e clique **Next step**.

![create-cluster](/ecs/create-cluster.png)

Na seção de cluster configuration, dê um nome para o cluster (ex. unicorns-cluster), marque a caixa "Enable Container Insights" para habilitar os **CloudWach container insights** e obter métricas mais profundas através do **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)


Finalmente pressione **Create** para criar o Amazon ECS cluster.
