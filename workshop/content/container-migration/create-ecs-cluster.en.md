+++
title = "Create an Amazon ECS cluster"
weight = 40
+++


### Create Amazon ECS cluster

From **AWS console**, go to **Services**, select **ECS** and then click **Create Cluster** button

Select **Networking only** for cluster template and click **Next step**.

![create-cluster](/ecs/create-cluster.png)

In cluster configuration section, provide a name of the cluster (e.g. unicorns-cluster), check the "Enable Container Insights" box to enable the **CloudWach container insights** for more in-depth metrics provided through **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)


Finally press the **Create** button to create the Amazon ECS cluster.
