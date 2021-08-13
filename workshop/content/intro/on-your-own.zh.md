+++
title = "自行运行研讨会"
weight = 20
+++

{{% notice warning %}}
只有在您自行运行研讨会时，才能完成本部分。如果您正在参加 AWS 主办的活动（例如 re:Invent、游戏日、研讨会或由 AWS 员工主办的任何其他活动），请转到 [在 AWS 活动中启动研讨会]({{< ref "/migration-hub.zh.md" >}})。
{{% /notice %}}


### 自主学习环境

本实验假定您有权访问具有 <a href="https://docs.aws.amazon.com/zh_cn/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">管理员权限</a> 的 **AWS 帐号**。 要创建新的 AWS 帐号，请遵循文章 <a href="https://aws.amazon.com/cn/premiumsupport/knowledge-center/create-and-activate-aws-account/?nc1=h_ls" target="_blank" rel="noopener noreferrer">如何创建并激活新的 Amazon Web Services 帐号？</a>

以下操作将在您的 AWS 账户中部署源环境，部署的资源包括两台 t3.micro EC2 机器（一台用于Web服务器，一台用于数据库）、一个 NAT 网关、一个 API 网关和两个 AWS Lambda 函数（便于检索 EC2 访问密钥）。整个实验部署的资源总成本应低于 5 美元（假定实验时长为 4 小时），其中一些资源由 <a href="https://aws.amazon.com/cn/free/" target="_blank" rel="noopener noreferrer">AWS 免费套餐</a> 覆盖。

请记住在运行实验后 [清理]({{< ref "/cleanup/_index.zh.md" >}}) 您的 AWS 帐号，以免产生不必要的费用！

#### 选项1: 简单部署

1. 点击下面的按钮 <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. 在 **步骤1 - 指定模版（Specify template）** 界面确认 URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml 已在 **Amazon S3 URL** 字段中输入，然后点击 **下一步**
  ![CloudFormation Step 1](/intro/cloudformation-step1.zh.png)

4. 在 **步骤2 - 指定堆栈详细信息（Specify stack details）** 屏幕上，确保 ApplicationMigrationWorkshop 已在 **堆栈名称** 字段中输入，然后点击 **下一步**
   ![CloudFormation Step 2](/intro/cloudformation-step2.zh.png)

5. 在 **步骤3 - 配置堆栈选项（Configure stack options）** 屏幕上不进行任何更改，直接点击 **下一步**  

6. 在 **步骤4 - 审查（Review）** 屏幕上，滚动到页面底部并选中所有复选框，如下面的屏幕截图所示，然后按 **创建堆栈**  
  ![CloudFormation Step 4](/intro/cloudformation-step4.zh.png)

当模板处于 **CREATE_COMPLETE** 时，您可以转到 **AWS 控制台 -> CloudFormation**，选择 **ApplicationMigrationWorkshop** 堆栈，然后转到 **输出** 选项卡，以查找有关已创建的源环境信息。您将看到下面的屏幕截图中类似的信息。

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.zh.png)

复制-粘贴此信息，因为您将在实验过程中会用到它。

现在，您可以启用 [AWS Migration Hub]({{< ref "/migration-hub.zh.md" >}})。




#### 选项2: 从源代码构建所有内容

{{% notice note %}}
如果您已经使用选项1部署了源环境，则无需继续执行选项2。
{{% /notice %}}

以下部分介绍了如何构建 CloudFormation 模板并使用 AWS 命令行界面 (CLI) 进行部署。

1. 安装 <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. 安装 <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> 并 <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">进行配置</a>

3. 从 <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop </a>  下载或克隆项目


4. 通过运行以下命令（将 **application-migration-workshop** 替换为自定义 S3 存储桶名称），在 **us-west-2 (俄勒冈)** 区域创建名称唯一的 S3 存储桶

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. 构建并部署模板（将 **application-migration-workshop** 替换为上一步中创建的自定义 S3 存储桶名称）  

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. 部署完成后，您将在控制台中看到有关源环境的信息，如下面的屏幕截图

![Source Environment in CLI Console](/intro/self-service-env-cli-info.zh.png)

您随时可以通过转到 **AWS 控制台 -> CloudFormation** 来找到它，选择已创建的 **ApplicationMigrationWorkshop** 堆栈，然后转到 **输出** 选项卡，如下面的屏幕截图所示。

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.zh.png)

现在您可以 [查看部署的环境]({{< ref "/review-deployment.zh.md" >}})。
