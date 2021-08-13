+++
title = "容器化改造"
date = 2020-06-28T08:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
本节假定您已经完成了 **1. 数据库迁移** 和 **2. 服务器迁移**。
{{% /notice %}}


#### Amazon Elastic Container Service (ECS) 概述

**Amazon Elastic Container Service (Amazon ECS)** 是一项完全托管的容器编排服务。您可以选择使用以下方式运行 ECS 群集：    

- AWS Fargate 启动类型，为容器提供无服务器计算功能；或  
- 您管理 EC2 实例。

在本实验中，您将使用 **AWS Fargate** 启动类型来运行应用程序，而不会对预配置、扩展、管理和保护后端基础设施造成麻烦和沉重负担。

有关使用 AWS Fargate 启动类型的 Amazon ECS 通用架构，请参阅下图：

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Amazon ECS 核心组件

<a href="https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS 集群</a> 是资源的逻辑分组。

<a href="https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">任务定义</a> 是一个 JSON 文件，描述构成应用程序的一个或多个容器（最多 10 个）。您可以将任务视为应用程序的蓝图。

<a href="https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">任务</a> 是集群内任务定义的实例化。在 Amazon ECS 中为应用程序创建任务定义后，您可以指定集群上运行的任务数。

<a href="https://docs.aws.amazon.com/zh_cn/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">服务</a> - Amazon ECS 允许您在集群中同时运行和维护指定数量的任务定义实例。这称为服务。如果您的任何任务因任何原因而失败或停止，Amazon ECS 服务调度程序会启动您的任务定义的另一个实例来替换它，并根据使用的调度策略保持服务中所需的任务数量。

您可以通过观看以下视频了解有关 **AWS Fargate** 的更多信息。
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### 将 Web 应用程序迁移到容器


要将 Web 应用程序迁移到容器，您将执行以下操作：

1. [为您的 VPC 创建其它安全组]({{< ref "/create-sg.zh.md" >}})

2. [创建 **Amazon EFS** (Elastic File System) 文件系统]({{< ref "/create-efs.zh.md" >}})

3. [将数据库变量添加到 **AWS Systems Manager** 参数存储（Parameters Store）]({{< ref "/configure-parameters-store.zh.md" >}})

4. [创建 **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.zh.md" >}})

5. [创建 **Amazon ECS (Elastic Container Service)** 集群]({{< ref "/create-ecs-cluster.zh.md" >}})

6. [创建 **Amazon ECS 任务定义**]({{< ref "/create-task-definition.zh.md" >}})

7. [创建 **Amazon ECS 服务**]({{< ref "/create-service.zh.md" >}})
