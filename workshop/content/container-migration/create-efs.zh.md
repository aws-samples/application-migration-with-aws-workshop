+++
title = "创建 Amazon EFS 文件系统"
weight = 20
+++

在 **AWS 控制台** 中，转到 **服务** 并选择 **EFS**，然后单击 **创建文件系统**。

选择您在研讨会开始时创建的 VPC（例如 TargetVPC）、在每个挂载目标中，选择对应可用区域的私有子网以及每个挂载目标的 EFS-SG 安全组，然后单击 **下一步**。

![create-efs](/ecs/create-efs.zh.png)


在 **步骤 2：配置文件系统设置** 中，您可以启用生命周期策略、更改吞吐量模式和启用加密。在本实验中，启用加密并为其他选项保留默认值。

![efs-enc](/ecs/efs-enc.zh.png)

最后，检查您的设置，然后单击 **创建文件系统**。

![efs-review](/ecs/efs-review.zh.png)


完成创建后，请复制文件系统的 **DNS 名称**，在 **创建任务定义** 步骤中，将会需要它。
![efs-details](/ecs/efs-details.zh.png)

现在，您可以将此文件系统暂时挂载到 Webserver 实例中，以将源 WordPress 内容复制到其中。

### 将文件系统挂载到 Webserver

单击 Amazon EFS 文件系统详细信息中的 **Amazon EC2 挂载说明（从本地 VPC）** 链接，然后按照它们进行操作。

安装 Ubuntu 实例的 nfs 客户端，请使用以下命令：

```
sudo apt-get install nfs-common
```

按照以下说明挂载文件系统：

![efs-mount](/ecs/efs-mount.zh.png)

挂载文件系统后，将整个 **/var/www/html/wp-content** 文件夹从 Webserver 复制到挂载的文件系统。

示例：
```
sudo cp -r /var/www/html/wp-content/* efs/
```
