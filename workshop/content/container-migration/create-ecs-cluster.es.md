+++
title = "Crear un cluster de Amazon ECS"
weight = 40
+++


### Create Amazon ECS cluster

Desde la **Consola de AWS**, vete a **Servicios (Services)**, selecciona **ECS** y despues haz click en el boton **Crear Cluster (Create Cluster)** 

Selecciona **Solo Red (Networking only)** para la plantilla del cluster y haz click en el **Proximo Paso (Next step)**.

![create-cluster](/ecs/create-cluster.png)

En la seccion de la configuración del cluster, proporciona un nombre al cluster (por ejemplo unicorns-cluster), marca el check de la caja "Habilitar la vista sobre contenedores" ("Enable Container Insights") para habilitar las  **vistas de contenedores de CloudWach (CloudWach container insights)**  para ver mas metricas en detalles proporcionadas por **Amazon CloudWatch**.

![configure-cluster](/ecs/configure-cluster.png)


Finalmente pulsa el boton **Crear (Create)** para crear el cluster de Amazon ECS.
