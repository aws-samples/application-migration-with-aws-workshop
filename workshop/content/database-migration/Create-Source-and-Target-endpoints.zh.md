+++
title = "创建源端点和目标端点"
weight = 35
+++


### 创建源端点和目标端点

仍旧在 **AWS DMS** 界面里，进入 **终端节点**，然后点击 **创建终端节点** 按钮。

1. 创建源终端节点

    使用下面的参数值配置终端节点：

    | 参数                | 值                                              |
    | ------------------- | ---------------------------------------------- |
    | 终端节点类型          | 源终端节点                                       |
    | 终端节点标识符        | source-endpoint                                |
    | 源引擎               | mysql                                          |
    | 服务器名称            | 源环境 - 对于 **自行操作的实验** ，请使用 **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation 模板</a>中 **输出** 部分的 **DBServerDNSName**; <br>对于 **AWS 活动** ，请使用 Event Engine 仪表板中的 **Database Server IP** |
    | 端口                 | 3306                                           |
    | 安全套接字层(SSL)模式   | none                                           |
    | 用户名                | wordpress-user                                 |
    | 密码                  | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.zh.png)

    打开 **测试终端节点连接（可选）** 部分，然后在 **VPC** 下拉列表中选择 **TargetVPC**， 点击 **运行测试** 按钮，以验证您的终端节点配置的有效性。

    ![test-source-endpoint](/db-mig/test-source-endpoint.zh.png)

    测试运行一会后，您应当会在 **状态** 列看到 **successful** 的消息。点击 **创建终端节点** 按钮创建终端节点。

    如果出现任何错误 - 请确保您配置了正确的终端节点参数，并且复制实例创建时选中了 **公开访问** 参数。

2. 创建目标终端节点

    使用下面参数值，重复上述所有步骤创建目标终端节点：

    | 参数                 | 值                                                   |
    | ------------------- | ----------------------------------------------------- |
    | 终端节点类型          | 目标终端节点                                       |
    | 选择 RDS 数据库实例    | 选中状态                                            |
    | RDS 实例             | 从下拉列表中选择您的 RDS 实例（如果不可见请手工输入）         |
    | 终端节点标识符         | target-endpoint                                       |
    | 目标引擎              | mysql （将被自动填充）                                   |
    | 服务器名称            | RDS 数据库的 DNS 名称 （保留自动填充的值）                 |
    | 端口                 | 3306  （将被自动填充）                                   |
    | 安全套接字层(SSL)模式   | none                                                  |
    | 用户名                | 保留自动填充的值                                         |
    | 密码                 | 输入您创建 RDS 数据库时使用的密码                           |


3. 在 **特定于终端节点的设置 -> 额外的连接属性** 拷贝粘贴下面的连接参数：

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. 在 **测试终端节点连接（可选）** 下，从 **VPC** 下拉列表中选择 **TargetVPC**，点击 **运行测试** 按钮验证终端节点的有效性。

    测试运行一会后，您应当会在 **状态** 列看到 **successful** 的消息。点击 **创建终端节点** 按钮创建终端节点。

如果出现任何错误，请确保 RDS 数据库的 **VPC 安全组** 允许来自 **AWS DMS 复制实例** 安全组在端口 3306 上的入站流量（或者来自整个 **TargetVPC** - 10.0.0.0/16）。

{{% notice note %}}
终端节点连接测试也可以在 **终端节点** 列表界面点击 **操作** 按钮，然后选择 **测试连接**。
{{% /notice %}}
