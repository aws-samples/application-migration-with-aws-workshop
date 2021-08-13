+++
title = "执行切换"
weight = 40

+++
### CloudEndure Migration 测试/切换

一旦完成了卷复制（在主机名称旁边的状态会显示 **Continuous Data Replication**），您就可以执行 **测试/切换**。

在您每次执行 **测试/切换**，CloudEndure Migration 会删除之前创建的实例并创建一个 **新的目标实例**，该实例包含了源环境数据的最新拷贝。

{{% notice note %}}
按照最佳实践，在现实环境中，您应当在目标迁移日期前至少 **一周** 执行 **测试** 迁移，目的是发现潜在的蓝图配置问题或者复制卷转换问题，并解决这些问题。  
在本实验中，您可以直接执行 **切换** （这个实例转换已经被执行了超过 3000 次，它肯定可以正常运行！）。
{{% /notice %}}


1. 确认卷被完整复制
   
    确认实例处于 **Continuous Data Replication** 状态，您可以在 **DATA REPLICATION PROGRESS** 列找到它。

    如果复制还没有完成，请等待，直到它处于 **Continuous Data Replication** 状态。在等待期间，您可以查看<a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">CloudEndure 文档</a>.

2. 触发切换
   
    从 **Machines** 列表中选择希望切换的服务器，点击屏幕右上角的 **LAUNCH 1 TARGET MACHINE** 按钮，然后选 **Cutover Mode** ，在确认弹出窗口中点 **CONTINUE**。

    ![CE-Cutover](/ce/CE-Cutover.zh.png)

    CloudEndure 将对卷进行最后的同步/快照，在目标基础架构中开始创建新服务器，并确保数据一致性。请查看 **Job Progress** 屏幕了解详细信息。


    ![CE-job-progress](/ce/CE-job-progress.zh.png)

    监控 **Job Progress** 日志，直到您看到 **Job finished** 消息（它预计需要 3-5 分钟）。在此期间，您可以查看 <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">CloudEndure 文档</a>，这里提供了有关切换过程的详细信息。

    {{% notice tip %}}
如果在 **Job Progress** 窗口没有找到您的 Job，请刷新浏览器（F5），确保滚动到 CloudEndure jobs下拉列表的顶部，您就会找到它。
{{% /notice %}}

3. 在 AWS 账号中查看由 CloudEndure 创建的资源
   
    转到 **AWS 控制台**，如有必要，请导航到目标 AWS 区域 (US-west-2/俄勒冈)。
   
    您将看到多了两个由 CloudEndure 管理的实例：
    - **CloudEndure Machine Converter** - 用于源根卷的转换，进行 AWS 相关的 bootloader 更改，注入 hypervisor 驱动，安装云工具。在每一次 Test 或 cutover时，它会运行几分钟。
    - **CloudEndure Replication Server** - 用于从安装在源环境的代理接收加密数据。在数据复制时，它会一直运行。

    这两个实例都是由 CloudEndure 管理，用户不能访问。

    一旦切换完成，您就会在列表中看到另一个 EC2 实例 - 这个是 CloudEndure 创建的目标 Web 服务器。记下公有和私有 IP，在后续步骤中会用到它们。

    {{% notice tip %}}
如果您想了解那些实例的更多信息，它们的用途和网络需求，可以查看 <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">CloudEndure 文档</a>。
{{% /notice %}}
