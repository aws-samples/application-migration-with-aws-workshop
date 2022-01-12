+++
title = "创建 Amazon ECS 任务定义"
weight = 50
+++

在 **AWS 控制台** 中，转到 **服务**，选择 **ECS (Elastic Container Service)**，然后单击 **任务定义** 和 **创建新任务定义**。

![create-task-def](/ecs/create-task-def.zh.png)

选择 **FARGAT** 启动类型兼容性，然后单击 **下一步**。


在 **步骤 2：配置任务和容器定义** 中，输入 **任务定义名称**（例如，unicorn-task-def），然后为 **任务角色** 和 **任务执行角色** 选择 **ecsTaskExcutionRole**。对于网络模式，选择 **awsvpc**。

![configure-task-def](/ecs/configure-task-def.zh.png)

在 **任务大小** 中指定 **任务内存 (GB)** 和 **任务 CPU (vCPU)**。

![task-size](/ecs/task-size.zh.png)

当我们希望将 **Amazon EFS** 卷装入容器时，我们必须先将卷添加到任务定义中，然后再添加容器。

向下滚动到任务定义配置中的 **卷** 部分，然后单击 **添加卷** 按钮。

![volumes](/ecs/volumes.zh.png)

在 **添加卷** 窗口中，选择 **卷类型** 为 **EFS**，并提供卷的名称（例如，wp-content）。在 **文件系统 ID** 中，选择您之前创建的 EFS 卷，然后启用 **Encrption in transit**。

![add-volume](/ecs/add-volume.zh.png)

最后按 **添加** 按钮，现在滚动到任务定义页面中的 **容器定义**。



![add-container](/ecs/add-container.zh.png)

单击 “容器定义” 部分中的 **添加容器**，输入 **容器名称**（例如，unicorn-web-container）和 **映像**（必须是 **public.ecr.aws/docker/library/wordpress:latest** - 我们使用的是 <a href="https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer"> WordPress 容器官方映像 </a>）。**内存限制** 和 **端口映射** 应按照下面的屏幕截图进行配置。

![add-container-details](/ecs/add-container-details.zh.png)

在 **环境变量** 部分中，按照您之前在 **参数存储** 中定义的参数进行配置，如下面的屏幕截图所示。

| 密钥                | ValueFrom        | 值                |
| ---------------------- | ---------------- |----------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                 |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME              |
| WORDPRESS_DB_PASSWORD| ValueFrom       | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom           | DB_USERNAME          |

![environment-variables](/ecs/environment-variables.zh.png)


在 **存储和日志记录** 中，选择 **挂载点** 并指定容器路径 **/var/www/html/wp-content**（这是您已复制到 Amazon EFS 文件系统中的 WordPress 文件，WordPress 应用将会使用它们）。

![storage-logging](/ecs/storage-logging.zh.png)


最后单击容器的 **添加** 按钮和任务定义页面上的 **创建**。
