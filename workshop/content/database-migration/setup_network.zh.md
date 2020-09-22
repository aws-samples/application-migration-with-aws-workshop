+++
title = "设置网络"
weight = 10
+++

在本研讨会中，我们不会使用 **VPN** 或者 **AWS Direct Connect**，因此，**DMS 复制实例** 需要通过公共互联网连接到源数据库，通过私有网络连接到目标数据库。

![Replication Instance Architecture](/db-mig/ri-network-conf.zh.png)

### 配置安全组

在本研讨会中，**VPC 安全组** 必须允许来自 **DMS 复制实例** 到目标 RDS 数据库的入站流量。

1. 为 **DMS 复制实例** 创建安全组

    a. 进入 **AWS 控制台 > 服务 > EC2 > 安全组**，点击 **创建安全组** 按钮。

    b. 输入 **安全组名称** （比如 RI-SG），填写一个 **描述**，从 VPC 下拉列表中选择 **TargetVPC**，点击 **创建安全组** 按钮。

    ![Adding inbound rule for Replication instance](/db-mig/ri-sg.zh.png)

    {{% notice note %}}
  无需给 **DMS 复制实例** 安全组 **RI-SG** 添加任何入站规则。
  {{% /notice %}}

2. 为 **目标数据库** 创建安全组

    a. 仍然在 **AWS 控制台 > 服务 > EC2 > 安全组** 界面中，点击 **创建安全组** 按钮。

    b. 输入 **安全组名称** （比如 DB-SG），填写一个 **描述**，从 VPC 下拉列表中选择 **TargetVPC**。

    c. 在 **入站规则** 部分点击 **添加规则** 按钮，配置规则以允许来自 **DMS 复制实例** 安全组在端口 3306 上的 **入站** 流量，然后点击 **创建安全组** 按钮

    ![Adding inbound rule for target database](/db-mig/security-group-inbound-rule.zh.png)
