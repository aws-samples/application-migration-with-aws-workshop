+++
title = "创建 Amazon ECS 集群"
weight = 40
+++


### 创建 Amazon ECS 集群

在 **AWS 控制台** 中，转到 **服务**，选择 **ECS (Elastic Container Service)**，然后单击 **创建集群**。（如果您没有看到 **创建集群** 按钮，请点击左边菜单中的 **集群**）

为集群模板选择 **仅限联网**，然后单击 **下一步**。

![create-cluster](/ecs/create-cluster.zh.png)

在集群配置部分，提供集群的名称（例如，unicorns-cluster），选中 “启用 Container Insights” 复选框以启用 ** CloudWach Container Insights**，了解通过 **Amazon CloudWatch** 提供的更详细的指标。

![configure-cluster](/ecs/configure-cluster.zh.png)


最后点击 **创建** 完成 Amazon ECS 集群的创建。
