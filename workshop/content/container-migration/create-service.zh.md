+++
title = "创建 Amazon ECS 服务"
weight = 60
+++

完成 **Amazon ECS 任务定义** 后，即可创建 **Amazon ECS 服务**。

选择之前创建的 **ECS 群集**，单击 **服务** 选项卡，然后单击 **创建** 按钮。

![create-service](/ecs/create-service.zh.png)

### 步骤 1：配置服务


在 **创建服务** 向导中，按照以下配置操作（确保在 **启动类型** 中选择 **FARGATE**）。  

- 选择您之前创建的 **任务定义**   
- 选择 **平台版本 1.4.0**                                                                           
- 选择您之前创建的 **ECS 群集** 并输入 **服务名称**（例如，unicorns-svc）                                   
- 将任务数设置为 2   
- 保留剩余部分的默认值，然后单击 **下一步**   


![configure-service](/ecs/configure-service.zh.png)

### 步骤 2：配置网络

在网络配置中，选择您之前创建的 VPC，指定您的子网并选择安全组 ECS-Tasks-SG，如下图所示。

![configure-network-svc](/ecs/configure-network-svc.zh.png)

在负载均衡器类型中选择 **Application Load Balancer**，然后选择之前创建的负载均衡器。

![svc-lb](/ecs/svc-lb.zh.png)

![container-lb](/ecs/container-lb.zh.png)

单击 **添加到负载均衡器** 添加容器名称:端口

![container-lb-details](/ecs/container-lb-details.zh.png)

在服务发现（可选）部分，**取消选中** “启用服务发现集成”，然后按 **下一步**

![service-discovery](/ecs/service-discovery.zh.png)


### 步骤 3：设置 Auto Scaling


在 Auto Scaling 配置中，选择 **配置服务 Auto Scaling**，并指定 **最小、预期、最大** 任务数。

![svc-autoscaling](/ecs/svc-autoscaling.zh.png)

在 **自动任务扩展策略** 中，将扩展策略类型设置为 **目标跟踪**，提供扩展策略的名称（例如，Requests-policy），选择 ECS 服务指标（例如，ALBRequestCountPerTarget），然后设置目标值（例如，300）。

![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.zh.png)


{{% notice note %}}
您可以针对不同的服务指标（例如 CPU 和内存使用率）重复此操作。
{{% /notice %}}  

### 步骤 4：审核

最后，查看并单击 **创建服务** 以创建 Amazon ECS 服务。

在服务状态处于 **ACTIVE** 状态并且所有任务都处于 **RUNNING** 状态后，请使用负载均衡器 DNS 浏览目标网站。


{{% notice note %}}
您可能还需要为 ECS 节点配置自动缩放，请查看 [本指南了解更多详情](https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
如果您遇到任何问题，请查看 [Amazon ECS 故障排除指南](https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
