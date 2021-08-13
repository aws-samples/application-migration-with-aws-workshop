+++
title = "启用 Migration Hub"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/cn/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> 让您可以在一个位置跟踪不同 AWS 和合作伙伴解决方案中的应用程序迁移进度。

要启用它，请在 **AWS 控制台** 内转到 **服务 -> AWS Migration Hub**，然后从左侧菜单中单击 **Migrate** 并选择 **US West (Oregon)** 作为您的使用区域（home region）。

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.zh.png)

然后单击 **Migrate -> Tools** 以选择将提供更新给 **AWS Migration Hub** 的工具。Cloudendure Migration已经开箱即用，但您需要配置与 **AWS Database Migration Service** 的集成。

滚动到页面底部，然后单击 **AWS Database Migration Service 卡** 中的 **Connect** 按钮。

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.zh.png)

在几秒钟内，集成状态应从 **Not connected** 更改为 **Connected**。

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.zh.png)

就这样，您将来在 **Cloudendure Migration** 和 **AWS Database Migration Service** 中的所有活动都将展示到 **AWS Migration Hub** 控制面板中。
