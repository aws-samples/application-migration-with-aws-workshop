+++
title = "配置蓝图"
weight = 30
+++

在实例复制时，我们可以配置 **CloudEndure 目标主机蓝图**，这将确定 AWS 中启动的目标主机（复制实例）的规格。它包括很多参数，包括主机类型（比如 t3.medium），主机运行所在的 **子网**， **私有 IP** 地址和磁盘类型。

为了配置蓝图，进入 **Machines** 页面，点击希望配置的主机名称，然后导航到 **BLUEPRINT** 部分。

![CE-BluePrints](/ce/CE-BluePrints.png)

使用以下信息：

| 参数                                    | 值                         |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                   |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | 添加值为 'Webserver' 的 'Name' 标签 |


其它部分保留缺省值，但您可以查看它们，以理解目标实例可用的配置选项。

{{% notice warning %}}
如果您在参加 AWS 活动，请选择 **Machine type** 不大于 *.large 的机型，否则提供给您的 IAM 权限将会阻止后续创建实例的操作。
{{% /notice %}}



{{% notice tip %}}
如果您在 BLUEPRINT 页面看不到可输入的字段，或者无法滚动，请缩小您的浏览器屏幕 (Control -)。
{{% /notice %}}

填写完成后，请点击页面底部的 **SAVE BLUEPRINT** 按钮保存。
