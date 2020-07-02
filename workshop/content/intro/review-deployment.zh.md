
+++
title = "审查部署的环境"
weight = 40
+++
## 源环境

在环境准备过程中部署了以下源环境。

![source-env](/intro/source-env.zh.png)

源环境包括一个三层电子商务应用程序; 一个Web服务器运行 Ubuntu 与 Apache, PHP, Wordpress, WooCommerce 和一个运行 Ubuntu 的 MySQL 5.7 数据库服务器。


## 目标环境

在环境准备过程中部署了以下目标 **Amazon Virtual Private Cloud (VPC)**。

![target-env](/intro/target-vpc.zh.png)

VPC 由跨两个可用区的 6 个子网（2 个公有子网，2 个私有子网用于Web服务器，2 个私有子网用于数据库）组成。

现在您可以启用 [AWS Migration Hub]({{< ref "/migration-hub.zh.md" >}})。 
