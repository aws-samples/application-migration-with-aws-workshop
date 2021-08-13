+++
title = "创建目标数据库"
weight = 15
+++

### 数据库迁移

数据库迁移可以通过多种方式执行。在本研讨会中，我们将使用 <a href="https://aws.amazon.com/cn/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a> 采用 **持续数据复制** 模式执行迁移。

配置 **AWS DMS** 之前，您需要在提供的 AWS 账户中创建目标数据库。使用 **AWS Relation Database Service (RDS)** 执行此活动，以便在云中轻松设置、操作和扩展关系数据库。

### 为目标数据库创建子网组

1. 进入 **AWS 控制台**，选择 **服务** > **RDS**，然后从左侧菜单中选择 **子网组** 然后点击 **创建数据库子网组**

2. 在 **创建数据库子网组** 界面，输入下面的信息

    | 参数                 | 值                                 |
    | ------------------- | ---------------------------------- |
    | 名称                 | database-subnet-group              |
    | 描述                 | Subnets where RDS will be deployed |
    | VPC                 | TargetVPC                          |

    在 **添加子网** 面板中，从每个可用区（us-west-2a 和 us-west-2b）添加一个子网，使用 CIDRS 10.0.101.0/24 和 10.0.201.0/24，然后按 **创建** 按钮。

    ![RDS Subnet group creation](/db-mig/db-subnet-group.zh.png)    

### 创建目标数据库    

1. 现在从左侧菜单中选择 **数据库** 并点击 **创建数据库**

2. 在 **引擎选项** 中，选择 MySQL，版本选择 MySQL 5.7.22

    ![1](/db-mig/1.zh.png)


    {{% notice note %}}
您可以使用 SQL 查询从源数据库中检索有关源 MySQL 版本的信息 - **SELECT@@version;**
{{% /notice %}}

    在 **模板** 部分，选择 “免费套餐”

    ![2](/db-mig/create-db-select-template.zh.png)

    {{% notice note %}}
选择“免费套餐”模板将限制您在向导的下一步中进行选择，从而使您受到AWS免费套餐的限制。
{{% /notice %}}

    在 **设置** 部分，为您的新数据库实例配置数据库实例标识符（比如 database-1）、主用户名（比如 admin）和主密码。

    ![3_db](/db-mig/3_db.zh.png)

    {{% notice note %}}
请务必记下 **主用户名** 和 **主密码**，因为您稍后会使用它。
{{% /notice %}}

    从可突增数据库实例类中选择 **db.t2.micro**，存储类型选择 **通用型 (SSD)**，取消选中“启用存储自动扩展”（此数据库不需要超过20 GB的存储空间）。
    ![4_db](/db-mig/4_db.zh.png)

3. 在 **可用性与持久性** 部分，保持 **请勿创建备用实例** 以节省成本。

    {{% notice note %}}
对于生产工作负载，我们建议创建备用实例利用 <a href="https://docs.aws.amazon.com/zh_cn/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">多可用区部署</a> 实现更高的可用性
{{% /notice %}}  

    ![5_db](/db-mig/5_db.zh.png)

4. 在 **连接** 部分：

    * 在 **Virtual Private Cloud (VPC)** 中， 选择 **TargetVPC** （这个是为本实验自动创建的 <a href="https://aws.amazon.com/cn/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> ）
    * 在 **其它连接配置 -> 现有 VPC 安全组**中，中选择之前创建的 VPC 安全组（比如 "DB-SG"）。
    * 请注意，您之前创建的数据库子网组将被自动选择

    ![6_db](/db-mig/6_db.zh.png)


    {{% notice note %}}
注意：稍后将编辑此 VPC 安全组，以确保 DMS 复制实例能够访问目标数据库并允许从 Web 服务器进行访问。
{{% /notice %}}

5. 对于 **数据库身份验证**，选择 **密码身份验证**。
6. (此步骤只针对 AWS 主办的活动) 在 **其它配置** 部分，确保 **监控** 下面的 **启用增强监测** 不被选中，如下图所示：

    ![6_2_db](/db-mig/6_2_db.zh.png)


    ![8_db](/db-mig/8_db.zh.png)

    {{% notice note %}}
对于生产工作负载，使用 <a href="https://docs.aws.amazon.com/zh_cn/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">增强型监控</a> 是一个非常好的主意，在 AWS 主办活动中，由于为参会者配置的 IAM 角色的限制，我们会取消选中此选项。
{{% /notice %}}

6. 最后，审查 **月度估算费用**，点击 **创建数据库** 按钮。

   ![8_2_db](/db-mig/8_2_db.zh.png)
