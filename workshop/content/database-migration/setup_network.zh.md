+++
title = "设置网络"
weight = 15
+++

在本研讨会中，我们不会使用 **VPN** 或者 **AWS Direct Connect**，因此，**DMS 复制实例** 需要通过公共互联网连接到源数据库，通过私有网络连接到目标数据库。

![Replication Instance Architecture](/db-mig/ri-network-conf.zh.png)

### 创建复制子网组

使用 **AWS DMS** 的一个需求是已经配置了 **子网组**，它是 **DMS 复制实例** 使用的一组子网。

1. 进入 **AWS 控制台 > 服务 > Database Migration Service > 子网组**，点击 **创建子网组** 按钮。
2. 在 **创建复制子网组** 中，输入下面的参数值：

    | 参数                 | 值                       |
    | ------------------- | ------------------------ |
    | 名称                 | dms-subnet-group                 |
    | 描述                 | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC                        |
    | 添加子网             | 选择 **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.zh.png)

3. 点击 **创建子网组** 按钮

### 配置安全组

在本研讨会中，**VPC 安全组** 必须允许来自 **DMS 复制实例** 到目标 RDS 数据库的入站流量。

1. 为 **DMS 复制实例** 创建安全组

    a. 进入 **AWS 控制台 > 服务 > EC2 > 安全组**，点击 **创建安全组** 按钮。

    b. 输入 **安全组名称** （比如 RI-SG），填写一个 **描述**，从 VPC 下拉列表中选择 **TargetVPC**，点击 **创建安全组** 按钮。

    ![Replication-instance-networ](/db-mig/ri-sg.zh.png)

    {{% notice note %}}
  无需给 **DMS 复制实例** 安全组 **RI-SG** 添加任何入站规则。
  {{% /notice %}}

2. 给 **DB-SG** 安全组增加入站规则

    a. 仍然在 **AWS 控制台 > 服务 > EC2 > 安全组** 屏幕中选择之前创建的数据库安全组 **DB-SG** 
    
    b. 在 **DB-SG** 安全组屏幕的详细信息中，点击 **编辑入站规则** 按钮
      
    c. 在 **编辑入站规则** 屏幕中点击 **添加规则** 按钮，配置规则以允许来自 **DMS 复制实例** 安全组在端口 3306 上的 **入站** 流量，点击 **保存规则** 按钮
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.zh.png)
