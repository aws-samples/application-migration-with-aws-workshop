+++
title = "Crear un sistema de ficheros en Amazon EFS"
weight = 20
+++

Desde la **Consola de AWS**, vete a **Servicios (Services)** y selecciona **EFS**, despues haz click en **Crear sistema de ficheros (Create file system)**.

![create-efs](/ecs/create-efs.png)

Selecciona la VPC que has creado al principio de nuestro laboratorio (ejemplo TargetVPC), las subredes privadas por zonas de disponibilidad para los puntos de montaje y el grupo de seguridad EFS-SG para cada punto objetivo de montaje, luego haz click en **Siguiente Paso (Next Step)**.

En el  **Paso 2: Configurar opciones adicionales (Configure optional settings)**, puedes habilitar una politica de ciclo de vida, cambiar el modo de rendimiento y habilitar la encriptación. Para este ejercicio, habilita la encriptacion y deja el resto de valores por defecto.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Finalmente, revisa las opciones y haz click en **Crear Sistema de Ficheros (Create File System)**

Copia el **nombre del DNS (DNS name)** del sistema de ficheros que has creado, por que lo vas a necesitar despues, en el paso de **Crear Definicion de Tarea (Create a Task Definition)**.
![efs-details](/ecs/efs-details.png)

Ahora, ya puedes montar este sistema de ficheros temporalmente en la instancia de servidor web para copiar la fuente de contenido de wordpress en el.

### Montar el sistema de ficheros en el servidor web

Haz click en el link **instrucciones de montaje EC2 (desde una VPC local) - Amazon EC2 mount instructions (from local VPC)** en los detalles del sistema de ficheros EFS y siguelas.

Para instalar el cliente de nfs para la instancia Ubuntu, usa este comando:

```
sudo apt-get install nfs-common
```

Sigue las instrucciones de abajo para montar el sistema de ficheros:

![efs-mount](/ecs/efs-mount.png)

Una vez montado el sistema de ficheros, copia todo el contenido de la carpeta **/var/www/html/wp-content** desde el servidor web al sistema de ficheros montando.

Ejemplo:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
