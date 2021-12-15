+++
title = "Crea un Amazon ECS Task Definition"
weight = 50
+++

Dalla **AWS console**, vai su **Services**, seleziona **ECS**, quindi clicca **Task Definitions** e **Create new Task Definition**.

![create-task-def](/ecs/create-task-def.png)

Scegli **FARGATE** come tipo di compatibilità e clicca **Next step**

Nello **Step 2: Configure task and container definition**, inserisci il **Nome del Task Definition** (e.g. unicron-task-def) e seleziona **ecsTaskExcutionRole** per entrambi **Task Role** e **Task execution role**. Per la Modalità di Network, selezionare **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

nel **Task size** Specificare il **Task memory (GB)** e il **Task CPU (vCPU)**

![task-size](/ecs/task-size.png)

Poiché stiamo cercando di montare il volume **Amazon EFS** sul contenitore, dobbiamo aggiungere il volume prima alla definizione dell'attività prima di aggiungere il contenitore.

Scorri verso il basso fino alla sezione **Volumes** nella configurazione della definizione dell'attività e fai clic sul pulsante **Add Volume**.

![volumes](/ecs/volumes.png)

Nella finestra **Add volume** , seleziona **volume type** come **EFS** e fornisci un nome per il volume (eg. wp-content). Nel **File system ID** selezionare il volume EFS creato in precedenza, e abilitare **Encrption in transit**.

![add-volume](/ecs/add-volume.png)

Alla fine premi il pulsante **Add** , ora scorri fino a **Container definition** inella pagina di definizione dell'attività.



![add-container](/ecs/add-container.png)

Clicca **Add container** nella sezione della definizione dei Container , inserisci **Container name** (e.g. unicorn-web-container) e in **Image** (deve essere **public.ecr.aws/docker/library/wordpress:latest** - stiamo usando <a href="https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer">l'immagine docker ufficiale di WordPress</a>). **Memory Limits** e **Port mappings** dovrebbe essere configurato come nella schermata qui sotto.

![add-container-details](/ecs/add-container-details.png)

Nella sezione **Environment variables** , configura i parametri dal **Parameter Store**, che hai definito in precedenza, come nello screenshot qui sotto.

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

Nella sezione **STORAGE AND LOGGING**, selezionare il **Mount point** e specificare il percorso del container **/var/www/html/wp-content** (qui è dove i file wordpress che hai copiato nel filesystem Amazon EFS dovrebbero essere disponibili per essere raccolti da wordpress).

Alla fine fai clic sul pulsante **Add** per il contenitore e **Create** nella pagina di definizione dell'attività.
