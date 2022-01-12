+++
title = "Création d'une \"Task Definition\" Amazon ECS "
weight = 50
+++

A partir de **AWS console**, allez dans **Services**, sélectionnez **ECS**, puis cliquez sur **Task Definitions** et **Create new Task Definition**.

![create-task-def](/ecs/create-task-def.png)

Choisissez **FARGATE** "Launch type compatibility" et cliquez sur **Next step**

Dans **Step 2: Configurer la tâche et la définition du container**, entrez la **Task Definition Name** (ex : unicron-task-def) et sélectionnez **ecsTaskExcutionRole** pour **Task Role** et **Task execution role**. Pour "Network Mode", sélectionnez **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

Dans **Task size** spécifiez **Task memory (GB)** et **Task CPU (vCPU)**

![task-size](/ecs/task-size.png)

Comme nous voulons "monter" le volume **Amazon EFS** dans le container, nous devons d'abord ajouter le volume à la définition de la tâche avant de l'ajouter au container.

Paginez vers le bas jusqu'à la section **Volumes** dans la configuration de la définition de tâche et cliquez sur le bouton **Add volume**.

![volumes](/ecs/volumes.png)

Dans la fenêtre **Add volume** sélectionnez **EFS** comme **volume type** et donnez un nom au volume (ex : wp-content). Dans **File system ID** sélectionnez le volume EFS que vous avez créé précédemment puis activez **Encryption in transit**.

![add-volume](/ecs/add-volume.png)

Enfin, pressez le bouton **Add**, maintenant paginez vers le haut jusqu'à **Container definition** dans la page de définition de la tâche.



![add-container](/ecs/add-container.png)

Cliquez sur **Add container** dans la section "Container definitions", entrez **Container name** (ex : unicorn-web-container) et **Image** (doit être **public.ecr.aws/docker/library/wordpress:latest** - nous allons utiliser l'<a href="https://hub.docker.com/_/wordpress" target="_blank" rel="noopener noreferrer">image docker officielle pour wordpress</a>). **Memory Limits** et **Port mappings** doivent être configurés comme indiqué dans la copie d'écran ci-dessous.

![add-container-details](/ecs/add-container-details.png)

Dans la section **Environment variables**, configurez les paramètres contenus dans **Parameter Store** que vous avez définis précédemment, comme indiqué ci-dessous. 

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

Dans **STORAGE AND LOGGING**, sélectionnez le **Mount point** et spécifiez le chemin dans le container **/var/www/html/wp-content** (c'est l'endroit où sont stockés les fichiers que vous avez copiés dans le file system Amazon EFS et qui seront utilisés par wordpress).

A la fin, cliquez sur le bouton **Add** pour le container et **Create** sur la page de définition de la tâche.
