+++
title = "Migración a Contenedores"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
Esta seccion asume que ya has completado las secciones **1. Migración de Bases de Datos** y **2. Migración de Servidores**.
{{% /notice %}}


#### Introduccion a Amazon Elastic Container Service (ECS) 

**Amazon Elastic Container Service (Amazon ECS)** es un servicio completamente gestionado de orquestación de contenedores. Puedes escoger que tus clusters de ECS funcionen usando:    

- Lanzando AWS Fargate, que proporciona capacidades serverless de computación para contenedores, o
- Instancias EC2 que tu gestionas.

En este laboratorio vamos a usar **AWS Fargate** para ejecutar la aplicación sin preocuparse de provisionar, escalar, gestionar y asegurar la infraestructura de soporte.

Por favor mira debajo el diagrama que muestra la arquitectura general de Amazon ECS usando AWS Fargate:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Componentes de Amazon ECS:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> es una agrupación logica de recursos.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Definición de Tareas (Task Definition)</a> es un fichero en formato JSON, que describe uno o mas contenedores (hasta un máximo de diez), que forman tu aplicación. Puedes pensar en las tareas como el esquema de tu aplicación.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Tareas</a> es la instancia de una definición de una tarea dentro de un cluster. Despues de haber creado una definición de tareas para tu aplicación dentro de Amazon ECS, puedes especificar el numero de tareas que se ejecutaran en tu cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Servicios</a> - Amazon ECS permite correr y mantener un numero especifico de instancias de una definicion de tareas de forma simultanea en un cluster. A esto se le llama Servicio. Si cualquiera de las tareas se cae o se para por cualquier razon, el servicio de planificador de Amazon ECS lanza otra instancia de su definición de tareas para reemplazar la y mantener el numero deseado de tareas en el servicio dependiendo de la estrategia de planificación usada.

Puedes aprender mas sobre **AWS Fargate** viendo el video de abajo.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migrar la aplicacion Web a contenedores:


Para migrar la aplicación web a contenedores, ejecuta las acciones siguientes:

1. [Crea grupos de seguridad adicionales para tu VPC]({{< ref "/create-sg.es.md" >}})

2. [Crea un sistema de ficheros elastico (Elastic File System) **Amazon EFS**]({{< ref "/create-efs.es.md" >}})

3. [Añade las variables de la base de datos en el almacenamiento de Parametros (Parameters Store) de **AWS Systems Manager** ]({{< ref "/configure-parameters-store.es.md" >}})

4. [Crea un Balanceador de Carga Elastico **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.es.md" >}})

5. [Crea un Cluster de Servicios de Contenedores Elastico **Amazon ECS (Elastic Container Service)**]({{< ref "/create-ecs-cluster.es.md" >}})

6. [Crea una definicion de Tarea **Amazon ECS Task Definition**]({{< ref "/create-task-definition.es.md" >}})

7. [Crea un Servicio de **Amazon ECS Service**]({{< ref "/create-service.es.md" >}})
