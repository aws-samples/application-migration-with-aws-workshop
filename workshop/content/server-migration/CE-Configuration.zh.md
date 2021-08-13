+++
title = "CloudEndure 配置"
weight = 10
+++


首先，您需要为 CloudEndure 配置 **AWS 凭据** 来访问您的 AWS 帐号， CloudEndure 复制服务器需要托管在目标账号下的 **复制目标** 位置（子网）。

### 配置 AWS 凭据

1. 登录到 CloudEndure 管理控制台 [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    针对 **自行操作的实验** - 使用您现有的 CloudEndure Migration 帐号或者创建一个新的 [CloudEndure Migration 帐号](https://console.cloudendure.com/#/register/register) 和一个新的 <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">CloudEndure 项目</a>

    针对 **AWS 活动** - 使用 <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine 仪表板</a> 中为您提供的 **CloudEndure Username** 和 **Password**

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    如果您在 <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine 仪表板</a> 中没有找到，请联系支持人员。

2. 导航到 **Setup & Info** > **AWS Credentials** 页面

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. 点击 **EDIT** 按钮，输入 **AWS Access Key ID** 和 **AWS Secret Access Key** 
   
    针对 **自行操作的实验** - 从 **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation 模板</a>中的 **输出** 部分拷贝此信息，如下面的截图所示。

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.zh.png)

    针对 **AWS 活动** - 从 <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine 仪表板</a> 的 **CloudEndure AWS Credentials** 部分拷贝此信息，如下面的截图所示。  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    覆盖 **AWS Access Key ID** 和 **AWS Secret Access Key** 字段中的值，拷贝时请注意去掉前后多余的空格。

4. 在输入 **AWS Access Key ID** 和 **AWS Secret Access Key** 后，请点击 **SAVE** 按钮。

### 配置复制设置

在您保存了 **AWS 凭据** 后，会自动跳转到 **Setup & Info** > **REPLICATION SETTINGS** 页面，在这里您可以配置 **CloudEndure 复制服务器** 的细节。

{{% notice note %}}
在继续配置之前，建议 **刷新浏览器** 以获取AWS 账号中的最新信息（您可以按 **F5** 键或者手工刷新浏览器）。
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. 按照下面的值更新 **REPLICATION SETTINGS** 的配置：

    | 参数                                       | 值                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | 不要选中                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | 不要选中                                                |
    | Enable volume encryption                   | 选中状态                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.zh.png)

2. 滚动到屏幕下方，点击 **SAVE REPLICATION SETTINGS** 按钮。

    {{% notice tip %}}
如果在屏幕顶部看到一条通知，指出必须刷新 AWS 凭据，请刷新浏览器（F5）。
{{% /notice %}}
