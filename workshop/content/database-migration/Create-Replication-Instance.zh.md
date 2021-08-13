+++
title = "创建复制实例"
weight = 20
+++

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

### 创建 AWS DMS 复制实例

在此步骤中，您将创建一个 <a href="https://aws.amazon.com/cn/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service</a> 复制实例，该实例启动源数据库到目标数据库之间的连接，传输数据，并缓存在初始数据加载期间发生在源数据库上的任何更改。


1. 在 **AWS 控制台** 中，从 **服务** 选择 **Database Migration Service**。  

2. 点击左侧菜单中的 **复制实例** ，然后点击 **创建复制实例** 按钮。

    ![Replication-instance-create](/db-mig/Replication-instance-create.zh.png)

3. 在 **创建复制实例** 屏幕上使用下面的参数配置一个新复制实例：

    | 参数                 | 值                       |
    | ------------------- | ------------------------ |
    | 名称                 | replication-instance     |
    | 描述                 | DMS replication instance |
    | VPC                  | TargetVPC               |
    | 多可用区              | 取消选择                |
    | 公开访问              | 选中状态                  |

    如下图所示。


    ![replication-instance-conf](/db-mig/replication-instance-conf.zh.png)


    在 **高级安全和网络配置** 中，确保选择您之前创建的复制子网组 & 复制实例安全组。

    ![Replication-instance-conf](/db-mig/advanced-security.zh.png)



4. 点击 **创建** 按钮。

    {{% notice note %}}
创建复制实例需要花几分钟时间，请等待，直到 **状态** 变为 **可用**，再执行后续步骤。在此期间，您可以查看在 <a href="https://aws.amazon.com/cn/dms/" target="_blank" rel="noopener noreferrer">AWS DMS 网页</a> 中描述的 AWS DMS 不同用例。
{{% /notice %}}
