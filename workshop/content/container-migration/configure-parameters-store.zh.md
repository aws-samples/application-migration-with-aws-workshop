+++
title = "配置参数存储"
weight = 30
+++

由于我们将使用官方的 WordPress 容器镜像与 RDS 数据库，我们将需要提供数据库凭据，数据库名称和服务器详细信息给 WordPress 配置。

实现这一目标的最佳方法是在 **AWS Systems Manager** 参数存储中管理这些参数，而不是将它们存储在容器镜像或 ECS 任务定义中。

在 **AWS 控制台** 中，选择 **服务**，然后选择 **Systems Manger**，然后点击左侧菜单中的 **Parameter Store**。

单击 **创建参数** 按钮，然后输入 **参数详细信息**（名称、说明、类型和值），如下表所示。

![parameter-details](/ecs/parameter-details.zh.png)

您需要重复上述步骤创建所有 4 个参数：


| 参数                   | 类型              | 值                             |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS 终端节点                   |
| DB_NAME                | String           | 目标数据库名称  (wordpress-db)  |
| DB_USERNAME            | String           | RDS 数据库用户名                |
| DB_PASSWORD            | SecureString     | RDS 数据库密码                  |
