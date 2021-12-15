+++
title = "Crie um Amazon ECS Task Definition"
weight = 50
+++

Na **AWS console**, vá até **Services**, selecione **ECS**, então clique **Task Definitions** e **Create new Task Definition**.

![create-task-def](/ecs/create-task-def.png)

Escolha **FARGATE** e clique **Next step**

No **Step 2: Configure task and container definition**, entre o **Task Definition Name** (ex. unicron-task-def) e selecione **ecsTaskExcutionRole** tanto para **Task Role** quanto para **Task execution role**. Como Network Mode, selecione **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

No **Task size** especifique a **Task memory (GB)** e a **Task CPU (vCPU)**

![task-size](/ecs/task-size.png)

Como queremos montar o volume **Amazon EFS** no container, temos de adicionar o volume primeiro à  task definition antes de adicioná-lo ao container.

Vá até a seção **Volumes** section natask definition e clique no botão **Add volume**.

![volumes](/ecs/volumes.png)

Na janela **Add volume**, selecione **volume type** como **EFS** e dê um nome ao volume (ex. wp-content). No **File system ID** selecione o EFS volume criado anteriormente e então habilite a **Encrption in transit**.

![add-volume](/ecs/add-volume.png)

Finalmente aperte o botão **Add**, agora vá até **Container definition** na página task definition.



![add-container](/ecs/add-container.png)

Cliqie **Add container** na seção Container definitions, entre o **Container name** (ex. unicorn-web-container) e a **Image** (tem de ser **public.ecr.aws/docker/library/wordpress:latest** - estamos usando a imagem oficial <a href="https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer">WordPress docker </a>). **Memory Limits** e **Port mappings** devem configurados como na imagem abaixo.

![add-container-details](/ecs/add-container-details.png)

Na seção **Environment variables**, configure parâmetros do **Parameter Store** definidos anteriormente, como na imagem abaixo.

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

Em **STORAGE AND LOGGING**, selecione o **Mount point** e especifique o container path **/var/www/html/wp-content** (é onde estão os arquivos wordpress copiados para o Amazon EFS filesystem e devem estar disponíveis para o wordpress acessá-los).

No fim clique o botão **Add** para o container e **Create** na página task definition.
