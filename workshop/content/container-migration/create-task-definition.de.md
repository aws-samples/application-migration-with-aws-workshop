+++
title = "Erstellen Sie eine Amazon ECS Task Definition"
weight = 50
+++

Bei **AWS console**, **Services**, wählen Sie **ECS**, 
und dann klicken Sie auf **Task Definitions** und **Create new Task Definition** darauf.

![create-task-def](/ecs/create-task-def.png)

Wählen Sie **FARGATE launch type compatibility** und klicken Sie auf die Schaltfläche **Next step** darauf.

Geben Sie in **Step 2: Configure task and container definition** den **Task Definition Name** ein 
(z.B. Unicron-Task-Def) und wählen Sie **ecsTaskExcutionRole** für **Task Role** und **Task execution role** aus. 
Als Netzwerkmodus wählen Sie bitte **awsvpc** aus.

![configure-task-def](/ecs/configure-task-def.png)

Bei **Task size** wählen Sie **Task memory (GB)** und **Task CPU (vCPU)** aus.

![task-size](/ecs/task-size.png)

Da wir das **Amazon EFS**-Volume in den Container einbinden möchten, 
müssen wir das Volume zuerst zur Task-Definition konfigurieren, bevor wir den Container hinzufügen.

Scrollen Sie in der Konfiguration der Task-Definition zu **Volumes** runter und klicken Sie auf 
die Schaltfläche **Add volume** darauf.

![volumes](/ecs/volumes.png)

Wählen Sie **Add volume**, als **volume type** wählen Sie **EFS** aus 
und geben Sie einen Namen für das Volume ein (z.B. wp-content). 
Wählen Sie in der **File system ID** das zuvor erstellte EFS-Volume aus 
und aktivieren Sie dann die **Encryption in transit** (Verschlüsselung während Übertragung).

![add-volume](/ecs/add-volume.png)

Klicken Sie abschließend auf die Schaltfläche **Add** darauf 
und scrollen Sie auf der Seite bis zu **Container definition** runter.

![add-container](/ecs/add-container.png)

Klicken Sie im Abschnitt Containerdefinitionen auf **Add Container** darauf, 
geben Sie **Container name** (z.B. unicorn-web-container) und **Image** 
(muss **public.ecr.aws/docker/library/wordpress:latest** sein) ein - wir verwenden die <a href = "https://gallery.ecr.aws/docker/library/wordpress" target="_blank" rel="noopener noreferrer">offizielles 
WordPress Docker-Bild</a>). 
Die **Memory limits** und **Port mapping** sollten wie im folgenden Screenshot konfiguriert werden:

![add-container-details](/ecs/add-container-details.png)

Konfigurieren Sie bei den **Environment variable**, die Parameter aus dem zuvor 
definierten **Parameter store** um (siehe Abbildung unten).

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

Wählen Sie unter **STORAGE AND LOGGING** den **Mount point** aus und geben Sie 
den Containerpfad **/var/www/html/wp-content** an 
(hier werden die WordPress-Dateien gespeichert, die Sie auf Amazon EFS kopiert 
haben. Das Dateisystem sollte für WordPress verfügbar sein, um die Daten koppieren zu können.

Klicken Sie am Ende auf die Schaltfläche **Add** darauf 
für den Container und **Create** auf der Seite mit der Task-Definition.
