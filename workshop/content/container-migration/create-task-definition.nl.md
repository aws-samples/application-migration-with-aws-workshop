+++
title = "Creëer een Amazon ECS Taak Definitie"
weight = 50
+++

In het **AWS console**, ga naar **Services**, selecteer **ECS**, en klik op **Task Definitions**. Klik op **Create new Task Definition**.

![create-task-def](/ecs/create-task-def.png)

Kies **EC2** als **ECS launch type** en klik op **Next step**

In **Stap 2: Configure task and container definition**, geef de taak definitie een naam (b.v. unicron-task-def) en selecteer **ecsTaskExcutionRole** voor zowel **Task Role** als **Task execution role**. Voor **Network Mode**, selecteer **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

Omdat we het **Amazon EFS** file systeem aan de container willen koppelen, dienen we eerst het file systeem toe te voegen aan de taak definitie voordat we het aan de container kunnen koppelen.

Scroll omlaag naar **Volumes** in de taak definitie en klik op de **Configure via JSON** knop.

![volumes](/ecs/volumes.png)

Zoek in de JSON naar de sectie **volumes** en voeg hetvolgende toe:

{{% notice note %}}
In de onderstaande code dien je de DNS naam van je EFS file systeem aan te passen met de DNS naam van het EFS file systeem dat je eerder in deze workshop hebt aangemaakt.
{{% /notice %}}   

```
        "volumes": [
            {
              "name": "wp-content",
              "host": null,
              "dockerVolumeConfiguration": {
                "autoprovision": null,
                "labels": null,
                "scope": "task",
                "driver": "local",
                "driverOpts": {
                  "type": "nfs",
                  "device": "fs-xxxx.efs.<region>.amazonaws.com:/",
                  "o": "addr=fs- xxxx.efs.<region> .amazonaws.com,nfsvers=4.0,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2"
                }
              }
            }
          ],
```

Nadat je dit hebt toegevoegd, scroll omhoog naar de **Container definition** in de taak definitie pagina.

![add-container](/ecs/add-container.png)

Klik op **Add container** in de **Container definitions** sectie, voer een naam in voor **Container name** (b.v. unicorn-web-container). **Image** (moet **wordpress:latest** zijn - we gebruiken <a href="https://hub.docker.com/_/wordpress" target="_blank">WordPress docker official image</a>). **Memory Limits** en **Port mappings** dienen geconfigureerd te worden zoals in de onderstaande illustratie.

![add-container-details](/ecs/add-container-details.png)

Onder **Environment variables**, configureer de parameters van de **Parameter Store**, die je al eerder hebt gedefiniëerd zoals in onderstaande illustratie.

![environment-variables](/ecs/environment-variables.png)


| Key              | ValueFrom             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

Onder **STORAGE AND LOGGING**, selecteer het **Mount point** en specificeer als folder voor de container **/var/www/html/wp-content** (dit is waar de Wordpress web inhoud staat die je vanaf de web server hebt gekopiëerd.

Tot slot, klik op de **Add** knop voor de container en druk dan op **Create** op de taakdefinitie pagina.
