+++
title = "服务器迁移"
date = 2020-06-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### CloudEndure Migration 概述

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> 使组织能够将最复杂的工作负载迁移到 Amazon Web Services (AWS)，而不会造成中断或数据丢失。通过连续块级复制，自动机器转换和应用堆栈编排，**CloudEndure Migration** 简化了迁移过程，并减少了人为错误的可能性。

无论您是迁移到 AWS 还是在 AWS 内部进行跨区域迁移，**CloudEndure Migration** 都为您提供了所需的灵活性，并为您提供了在当今快节奏的数字生态系统中取得成功所需的安全控制。

![cloudendure-intro](/ce/ce-home.zh.png)

**CloudEndure 在线迁移的好处包括：**

- 分钟级的切换窗口，无数据丢失
- 所有应用程序（包括数据库和旧版应用程序）100% 的数据完整性
- 大规模迁移，不影响性能
- 广泛的平台和源操作系统支持
- 自动迁移，最大限度地减少 IT 资源、缩短项目周期

{{% notice note %}}
***CloudEndure Migration** 现在可以免费用于所有到 AWS 的迁移。  
请到 [CloudEndure Migration 注册页面](https://console.cloudendure.com/#/register/register) 创建一个帐号，并在数分钟内开始迁移到 AWS！
{{% /notice %}}  

您可以通过观看以下视频了解有关 **CloudEndure Migration** 的更多信息。
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

在本实验中，您将使用 **CloudEndure Migration** 对 Web 服务器执行重新托管（也称为搬迁式迁移），请参照如下步骤：

1. [CloudEndure 配置]({{< ref "/CE-Configuration.zh.md" >}})  
2. [在源主机上安装代理]({{< ref "/CE-Agent-Installation.zh.md" >}})  
3. [配置蓝图（Blueprint）]({{< ref "/CE-Blueprints.zh.md" >}})  
4. [执行切换（Cutover）]({{< ref "/CE-Cutover.zh.md" >}})  
5. [配置应用]({{< ref "/CE-Webserver-config.zh.md" >}})  
