+++
title = "清理"
weight = 50
pre = "<b>5. </b>"
+++

针对自行操作的实验，最后确保删除您创建的*所有*资源，包括：

1. 在 <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure 控制台</a> 中      
   - 选择已迁移的计算机（带复选框），然后点击 **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - 选择已迁移的计算机（带复选框），然后点击 **Machine Actions** -> **Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.zh.png)

2. 在 <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS 控制台</a> 中         
   - 修改创建的 **数据库** 以禁用删除保护（选择立即应用更改）
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.zh.png)

   - 删除创建的 **数据库** （无需最终快照，也不用保留自动备份）
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.zh.png)

3. 在 <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS 控制台</a> 中           
   - 停止迁移任务，当它处于 “已停止” 状态时，删除创建的 **任务**。*等待任务被删除*。
   - 删除创建的 **终端节点**. *等待终端节点被删除*。
   - 删除创建的 **复制实例**. *等待复制实例被删除*。
   - 删除创建的 **子网组**。

     转到 <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS 控制面板</a> ，确认所有内容都已删除（假设您之前没有使用 DMS，您应该在各个项中看到 0，如下面的屏幕截图）
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.zh.png)

4. 在 <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS 控制台</a> 中       
   - 删除创建的 **EFS 文件系统**

5. 在 <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS 控制台</a> 中     
   - 删除创建的 **服务**
   - 删除创建的 **任务定义**
   - 删除创建的 **集群**  

6. 在 <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 控制台</a> 中      
   - 终止创建的 **EC2 实例** （包括那些名称以 'CloudEndure' 开头的实例）
   - 删除创建的 **负载均衡器**

7. 在 <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a> 中           
   - 删除 **ApplicationMigrationWorkshop** 堆栈

删除 **ApplicationMigrationWorkshop** 堆栈后，请查看您的 AWS 账户并 **删除本实验期间创建的所有剩余资源**。

此外，如果您能为本次研讨会提供 <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">匿名反馈</a>，我们将不胜感激。
