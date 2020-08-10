+++
title = "Crear un sistema de ficheros en Amazon EFS"
weight = 20
+++

Desde la **Consola de AWS**, vete a **Servicios (Services)** y selecciona **EFS**, despues haz click en **Crear sistema de ficheros (Create file system)**.

Nombra el sistema de ficheros (por ejemplo 'webserver-filesystem') y selecciona el VPC objetivo, donde el EFS sera desplegado.

![Create file system](/ecs/create-efs-name.en.png)

Haz Click en el boton **Crear (Create)**, y despues click en el nombre del **sistema de ficheros del servidor web (webserver-filesystem)** de la lista de nombres de EFS, para abrir los detalles.

![Select EFS from the list](/ecs/create-efs-select.en.png)

En los detalles del sistema de ficheros **webserver-filesystem**, vete a la seccion de  **Red (Network)** y haz click en el boton **Crear montaje objetivo (Create mount target)**.

![Go to Network mount targets](/ecs/create-efs-mount-target.en.png)

Selecciona la **VPC Objetivo (Target VPC)**  en el menu desplegable de Virtual Private Cloud (VPC) y añade los dos objetivos de montaje.

| Availability zone    | Subnet ID      								   | Security groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.en.png)

Haz Click en el boton **Salvar (Save)**.

Toma nota del **Identificador del sistema de Ficheros (File system ID)**, lo necesitaras mas tarde para montar el sistema de ficheros y para definir el nombre DNS del sistema de ficheros creado. El nombre DNS sigue el siguiente formato **file-system-id**.efs.**aws-region**.amazonaws.com, asi que en nuestro caso es **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (date cuenta que sera diferente en tu caso).

![EFS file system id](/ecs/create-efs-file-system-id.en.png)

Ahora, puedes montar el sistema de ficheros temporalmente en la instancia del servidor Web para copia el contenido de wordpress desde la fuente.

### Montar el sistema de ficheros en el servidor Web

SSH a tu **Servidor Web** y ejecuta los comandos siguientes: 
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Ejecuta el comando siguiente, reemplazando el **FILE_SYSTEM_ID** con el **ID del sistema de Ficheros (File system ID)** del sistema de ficheros Elastico que has creado.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Una vez hayas montado el sistema de ficheros, copia toda la carpeta **/var/www/html/wp-content** desde el servidor web al sistema de ficheros montado con el comando siguiente. 

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Resolución de Problemas

Si tienes algun problema al montar el EFS, por favor consulta aqui https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html para obtener mas detalles