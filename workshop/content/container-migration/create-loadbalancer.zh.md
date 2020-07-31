+++
title = "创建 AWS 弹性负载均衡器"
weight = 35
+++


在 **AWS 控制台** 中，选择 **服务**、**EC2**，然后选择 **负载均衡器**。

单击 **创建负载平衡器** 按钮和 **应用程序负载平衡器**，如下所示：

![create-loadbalancer](/ecs/create-lb.zh.png)

在 **步骤 1：配置负载均衡器** 中，输入负载均衡器 **名称**（例如，Uniorn-lb），选择您使用的 VPC（例如 TargetVPC），然后至少选择两个公有子网（public-a、public-b），如下所示：

![configure-loadbalancer](/ecs/configure-lb.zh.png)

在 **步骤 3：配置安全组** 中，选择 LB-SG 安全组。

在 **步骤 4：配置路由** 中，在 **目标组** 中选择 **新建目标组**，并提供目标组的名称（例如，Unicorn-tg）。对于 **目标类型**，选择 **IP**，保留其他字段为默认值，然后单击 **下一步：注册目标**。

![configure-routing](/ecs/configure-routing.zh.png)

保留注册目标的默认值，单击 **下一步：审核**，然后单击 **创建** 以创建负载均衡器。