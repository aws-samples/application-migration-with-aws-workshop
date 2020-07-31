+++
title = "创建其它安全组"
weight = 10
+++


### 为您的 VPC 创建安全组

从 **AWS 控制台** 中，转到 **服务** 并选择 **VPC**。在左侧面板中，单击安全性部分下的 **安全组**，然后单击 **创建安全组**。

为 **安全组** 输入以下参数（重复步骤以创建所有 3 个安全组，如下表所示）。


| 安全组名称               | 描述      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | 您之前创建的 VPC （如 TargetVPC） |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| 您之前创建的 VPC （如 TargetVPC）  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | 您之前创建的 VPC （如 TargetVPC）  |

![create-lb-sg](/ecs/create-lb-sg.zh.png)





### 编辑和配置安全组

创建安全组后，逐个选择，然后单击 **入站规则**，然后单击 **编辑规则**。您将为每个安全组添加规则，如下所示：

#### 1. LB-SG 入站规则

添加从任何地方访问 HTTP 和 HTTPS 的权限，以允许用户访问网站。

| 类型    | 协议      				   | 源            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | 任何位置   |
| HTTPS               | TCP            | 任何位置   |

![edit-lb-sg](/ecs/edit-lb-sg.zh.png)


#### 2. ECS-Tasks-SG 入站规则

允许负载平衡器和 ECS 任务之间的通信。

| 类型                    | 协议     	   | 源            |
| ---------------------- | -------------- |----------------|
| 所有 TCP                | TCP            | 自定义 > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.zh.png)

#### 3. EFS-SG 入站规则

允许 ECS 任务和Amazon EFS 之间的通信。仅临时启用 Webserver 对 EFS 的访问权限，以便能够挂载 EFS 卷和复制 Web 应用程序静态文件（稍后将其删除）。

| 类型                | 协议           | 源            |
| ---------------------- | ---------- |----------------|
| NFS                | TCP            | 自定义 > ECS-Tasks-SG  |
| NFS                | TCP            | 自定义 > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.zh.png)

### 修改数据库安全组

修改数据库安全组 (DB-SG)，允许来自 ECS-Tasks-SG 在端口 3306 (MySQL 端口) 上的入站流量 — 允许 ECS 任务与目标数据库之间的通信。

| 类型                  | 协议   		   | 源            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | 自定义 > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.zh.png)
