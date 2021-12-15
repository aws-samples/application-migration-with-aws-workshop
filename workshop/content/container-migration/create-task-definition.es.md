+++
title = "Crear una Definicion de Tarea de Amazon ECS "
weight = 50
+++

Desde la **Consola de AWS**, vete a **Servicios (Services)**, selecciona **ECS**, luego haz click en **Definicion de Tareas (Task Definition)** y **Crear nueva Definicion de Tarea (Create new Task Definition)**.

![create-task-def](/ecs/create-task-def.png)

Escoge **FARGATE** en compatibilidad de tipo de lanzamiento y haz click en **Proximo Paso (Next step)**

En el  **Paso 2: Configurar tarea y definicion de contenedor (Configure task and container definition)**, introduce **Nombre de Definicion de la Tarea (Task Definition Name)** (por ejemplo unicron-task-def) y selecciona **ecsTaskExcutionRole** para ambos **Role de Tarea (Task Role)** y **Role de Ejecucion de Tarea (Task execution role)**. Para el modo de Red, selecciona **awsvpc**.


![configure-task-def](/ecs/configure-task-def.png)

En el **Tamaño de la Tarea (Task size)** especifica la **Memoria de la Tarea (Task memory) (GB)** y la  **CPU de la Tarea (Task CPU) (vCPU)**

![task-size](/ecs/task-size.png)

Como estamos buscando montar el volumen de **Amazon EFS** en el contenedor, tenemos que añadir el volumen primero a la definición de la tarea antes de añadir el contenedor.

Baja hasta la seccion **Volumenes (Volumes)** en la definición de tarea, y haz click en el boton **Añadir Volumen (Add volume)**.

![volumes](/ecs/volumes.png)

En la ventana de **Añadir volumen (Add volume)**, selecciona el **tipo de volumen (volume type)** como **EFS** y proporciona el nombre del volumen (por ejemplo wp-content). En el **ID del sistema de Ficheros (File system ID)** selecciona el volumen de EFS que has creado antes, y luego habilita la **Encriptación en transito (Encrption in transit)**.

![add-volume](/ecs/add-volume.png)

Finalmente presiona el boton **Añadir (Add)**, ahora baja hasta **Definicion del Contenedor (Container definition)** en la pagina de definición de la tarea.



![add-container](/ecs/add-container.png)

Haz click en **Añadir contenedor (Add container)** en la seccion de definicion del contenedor, introduce el **Nombre del Contenedor (Container name)** (por ejemplo unicorn-web-container) y **Imagen (Image)** (deberia ser **public.ecr.aws/docker/library/wordpress:latest** - estamos usando la <a href="https://hub.docker.com/_/wordpress" target="_blank" rel="noopener noreferrer">imagen oficial de docker para WordPress</a>). **Limites de Memoria (Memory Limits)** y el **Mapeo de Puertos (Port mappings)** deberia ser configurado como en la captura de pantalla de abajo.

![add-container-details](/ecs/add-container-details.png)

En la seccion de **Variables de Entorno (Environment variables)**, configura los parametros desde el **Almacenamiento de Parametros (Parameter Store)**, que has definido antes, como en la captura de pantalla de abajo.

![environment-variables](/ecs/environment-variables.png)


| Clave              | ValueFrom             | Valor                          |
| ---------------------- | ---------------- |--------------------------------|
| WORDPRESS_DB_HOST| ValueFrom           | DB_HOST                  |
| WORDPRESS_DB_NAME| ValueFrom           | DB_NAME    |
| WORDPRESS_DB_PASSWORD| ValueFrom           | DB_PASSWORD          |
| WORDPRESS_DB_USER| ValueFrom     | DB_USERNAME          |


![storage-logging](/ecs/storage-logging.png)

En el  **ALMACENAMIENTO Y LOGS (STORAGE AND LOGGING)**, selecciona el **Punto de Montaje (Mount point)** y especifica la ruta del contenedor **/var/www/html/wp-content** (aqui es donde los ficheros the wordpress que has copiado al sistema de ficheros de Amazon EFS deberian estar disponibles para wordpress).

Al final haz click en el boton **Añadir (Add)** para el contenedor y en **Crear (Create)** en la pagina de definición de tarea.
