+++
title = "数据库迁移"
weight = 10
pre = "<b>1. </b>"
+++

在本节中，您将使用 **AWS Database Migration Service** 执行从源 MySQL 数据库到目标 Amazon RDS for MySQL 数据库的迁移。由于这是同构数据库迁移（源数据库引擎和目标数据库引擎相同）- schema 结构、数据类型和数据库代码在源数据库和目标数据库之间兼容，这意味着此类迁移不需要做任何 schema 转换。

![1](/db-mig/DMS-overview.zh.png)

您可以通过观看以下视频了解有关此服务的更多详细信息。

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>


在本实验中，您将执行以下步骤：

1. [创建目标数据库]({{< ref "/Create-target-DB.zh.md" >}})

2. [设置网络]({{< ref "/setup_network.zh.md" >}})

2. [创建复制实例]({{< ref "Create-Replication-instance.zh.md" >}})

3. [创建源端点和目标端点]({{< ref "Create-Source-and-Target-endpoints.zh.md" >}})

4. [配置源数据库]({{< ref "configure_source_database.zh.md" >}})

4. [创建和运行复制任务]({{< ref "Create-and-run-Replication-task.zh.md" >}})

5. [小结]({{< ref "Summary.zh.md" >}})
