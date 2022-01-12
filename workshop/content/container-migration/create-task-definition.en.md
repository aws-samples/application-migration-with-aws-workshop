+++
title = "Create an Amazon ECS Task Definition"
weight = 50
+++

From **AWS console**, go to **Services**, select **ECS**, then click **Task Definitions** and **Create new Task Definition**.

![create-task-def](/ecs/create-task-def.png)

Choose **FARGATE** launch type compatibility and click **Next step**

In the **Step 2: Configure task and container definition**, enter the **Task Definition Name** (e.g. unicorn-task-def) and select **ecsTaskExecutionRole** for both **Task Role** and **Task execution role**. For Network Mode, select **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

In the **Task size** Specify the **Task memory (GB)** and the **Task CPU (vCPU)**

![task-size](/ecs/task-size.png)

As we are looking to mount the **Amazon EFS** volume to the container, we have to add the volume first to the task definition before adding the container.

Scroll down to **Volumes** section in the task definition configuration, and click **Add volume** button.

![volumes](/ecs/volumes.png)

In the **Add volume** window, select **volume type** as **EFS** and provide a name for the volume (eg. wp-content). In the **File system ID** select the EFS volume that you created earlier, and then enable the **Encryption in transit**.

![add-volume](/ecs/add-volume.png)

Finally press the **Add** button, now scroll up to **Container definition** in the task definition page.



![add-container](/ecs/add-container.png)

Click **Add container** in the Container definitions section, enter **Container name** (e.g. unicorn-web-container) and **Image** (must be **public.ecr.aws/docker/library/wordpress:latest** - we're using the <a href="https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer">WordPress docker official image from Amazon ECR Public Gallery</a>). **Memory Limits** and **Port mappings** should be configured as on the screenshot below.

![add-container-details](/ecs/add-container-details.png)

In the **Environment variables** section, configure parameters from the **Parameter Store**, that you've defined earlier, as on the screenshot below.

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

In the **STORAGE AND LOGGING**, select the **Mount point** and specify the container path **/var/www/html/wp-content** (this is where wordpress files that you have copied into Amazon EFS filesystem should be available for wordpress to pick them up).

In the end click the **Add** button for the container and **Create** on the task definition page.
