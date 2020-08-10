+++
title = "Crear grupos de seguridad adicionales"
weight = 10
+++


### Crear grupos de seguridad para tu VPC

Desde la  **Consola de AWS**, vete a **Servicios (Services)** y selecciona **VPC**. En el panel de la izquierda, haz click en **Grupos de Seguridad (Security Groups)** dentro de la seccion de Seguridad y despues en **Crear grupo de Seguridad (Create security group)**.

### 1. Crea un grupo de seguridad para el balanceador de carga

Introduce los parametros siguientes para el **Grupo de Seguridad (Security group)** 


| Nombre del grupo de Seguridad    | Descripcion      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Grupo de seguridad del balanceador de carga            | La VPC que has creado antes (ejemplo TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)

Baja por la pagina y en la seccion de **Reglas de Entrada (Inbound Rules)** añade acceso HTTP, y HTTPS **desde cualquier sitio (Anywhere)** para permitir a los usuarios acceder al sitio web.

| Tipo    | Protocolo      								   | Fuente           |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

Haz click en el boton **Crear grupo de seguridad (Create security group)**  para crear el grupo de seguridad.

#### 2. Crear grupo de seguridad para el Servicio de Contenedores Elastico (Elastic Container Service) 

Vete a la pantalla **Grupos de Seguridad (Security Groups)**, haz click en **Crear grupo de seguridad (Create security group)** e introduce los valores siguientes.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| TargetVPC  |

Baja por la pagina hasta **Reglas de Entrada (Inbound Rules)** y permite la comunicacion entre el balanceador de carga y las tareas de ECS (selecciona el grupo de seguridad LB-SG en el desplegable **Fuente (Source)**)

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Haz click en el boton **Crear grupo de seguridad (Create security group)**  para crear el grupo de seguridad.

#### 3. Crear grupo de seguridad para el Sistema de Ficheros Elastico

Vete a la pantalla de **Grupos de Seguridad (Security Groups)**, haz click en **Crear grupo de seguridad (Create security group)** e introduce los valores siguientes.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Allow communication between ECS Tasks and EFS       | TargetVPC  |

Baja por la pagina hasta **Reglas de Entrada (Inbound Rules)** y permite la comunicacion entre las tareas de ECS y Amazon EFS. El acceso del servidor web a EFS estaba habilitado temporalmente, para permitir montar el volumen de EFS y copiar los ficheros estáticos de la aplicacion web (eliminaremos el acceso despues).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Haz click en el boton **Crear grupo de seguridad (Create security group)**  para crear el grupo de seguridad.

### 4. Modifica los grupos de seguridad existentes para la base de datos

Vete a la pantalla de los **Grupos de Seguridad (Security Groups)**  y modifica el grupo de seguridad (DB-SG) para permitir el trafico de entrada TCP en el puerto 3306 (puerto MySQL) desde ECS-Task-SG a la base de datos objetivo (ya deberias tener aqui reglas de entrada para el servidor Web y para la instancia de replicacion),

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)

