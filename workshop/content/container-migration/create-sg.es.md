+++
title = "Crear grupos de seguridad adicionales"
weight = 10
+++


### Crear grupos de seguridad para tu VPC

Desde la  **Consola de AWS**, vete a **Servicios (Services)** y selecciona **VPC**. En el panel de la izquierda, haz click en **Grupos de Seguridad (Security Groups)** dentro de la seccion de Seguridad y despues en **Crear grupo de Seguridad (Create security group)**.

Introduce los parametros siguientes para el **Grupo de Seguridad (Security group)** (repite los pasos anteriores para crear los 4 grupos de seguridad de acuerdo a la tabla de abajo).


| Nombre del grupo de Seguridad    | Descripcion      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Grupo de seguridad del balanceador de carga            | La VPC que has creado antes (ejemplo TargetVPC)  |
| ECS-Tasks-SG           | Permite la comunicacion entre el LB y las tareas de ECS| La VPC que has creado antes (ejemplo TargetVPC)  |
| EFS-SG                 | Permite la comunicacion entre las tareas de ECS y EFS       | La VPC que has creado antes (ejemplo TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)





### Editar y configurar los grupos de seguridad

Una vez hayas creado los grupos de seguridad, selecionalos uno a uno y haz click en **Reglas de Entrada (Inbound Rules)** y luego en **Editar Reglas (Edit rules)**. Añade las reglas para cada uno de los grupos de seguridad como sigue:

#### 1. LB-SG Inbound rules

Añade acceso HTTP, y HTTPS desde cualquier sitio para permitir a los usuarios acceder al sitio web.

| Tipo    | Protocolo      								   | Fuente           |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. ECS-Tasks-SG Inbound rules

Permite la communicacion entre el balanceador de carga y las tareas ECS.

| Tip    | Protocolo      								   | Fuente           |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. EFS-SG Inbound rules

Permite la comunicacion entre las tareas ECS y Amazon EFS. El acceso de los servidores Web a EFS estara habilitado solo temporalmente, para permitir montar el volumen de EFS y copiar el contenido estático de la web (lo eliminaras mas tarde).

| Tip   | Protocolo     								   | Fuente           |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Modifica el grupo de seguridad de la base de datos

Modifica el grupo de seguridad de la base de datos (DB-SG) para permitir el trafico de entrada a traves del puerto 3306 TCP (puerto MySQL) desde ECS-Tasks-SG y ECS-SG – para permitir la comunicación entre las tareas de ECS y la base de datos.

| Tipo    | Protocolo    								   | Fuente         |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
