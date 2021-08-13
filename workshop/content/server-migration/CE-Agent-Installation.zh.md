+++
title = "在源主机上安装代理"
weight = 20
+++


从 <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure 控制台</a>，导航到 **Machines** 页面，您将看到 **How to Add Machines** 信息，它提供了如何在源主机上安装代理。

![CE-Agent-install](/ce/CE-Agent-install.png)


#### 在 Web 服务器上安装代理

1. 获取源 Web 服务器信息

    针对 **自行操作的实验** - 此信息描述在 **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation 模板</a> 中的 **输出** 部分。

    ![Centos-pem](/ce/webserver-self-paced-info.zh.png)    

    针对 **AWS 活动** - 此信息描述在 <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine 仪表板</a> 中，见 **Webserver IP**, **Webserver Username** 和 **Webserver SSH Key**。

    ![Centos-pem](/ce/Centos-pem.png)

2. 下载 **Webserver SSH key** (.pem)，并保存到本地（比如 **webserver.pem** 文件）  

    如果您使用 Windows 操作系统，请使用 PuttyGen 将 SSH key .pem 文件转换为 .ppk，然后使用 Putty 连接（更多的细节可以看 <a href="https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">这里</a>。  

3. 用 SSH 终端连接到 **源 Web 服务器**

    - 对于微软 Windows 用户，请查看 <a href="https://docs.aws.amazon.com/zh_cn/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">这篇文章</a>。 
    - 对于 Mac OS 用户，请查看 <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">这篇文章</a>。

4. 运行从 **How to Add Machines** 中拷贝的命令下载和安装代理：

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.zh.png)

    执行完成后，您将会接收到一条消息，指出 **Installation finished successfully**。
    
    {{% notice tip %}}
安装代理的命令也可以从 **CloudEndure** 控制台的 **Machines -> MACHINE ACTIONS -> Add Machines** 中获取。
{{% /notice %}}

5. 一旦代理安装完成，主机将会显示在 **CloudEndure 控制台** -> **Machines** 页面中。

    ![CE-server-progress](/ce/CE-server-progress.zh.png)

