+++
title = "Migración de base de datos"
weight = 10
pre = "<b>1. </b>"
+++

En esta sección, realizará una migración utilizando la base de datos MySQL de origen a una base de datos Amazon RDS para MySQL de destino con **AWS Database Migration Service**. . Dado que esta es una migración de base de datos homogénea (los motores de base de datos de origen y destino son los mismos), la estructura del esquema, los tipos de datos y el código de la base de datos son compatibles entre las bases de datos de origen y destino, lo que significa que este tipo de migración no requiere ninguna conversión de esquema.

![1](/db-mig/DMS-overview.png)

Puede obtener más detalles sobre este servicio mirando el video a continuación.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

En este laboratorio, realizará los siguientes pasos:

1. [Crear base de datos de destino]({{< ref "/Create-target-DB.es.md" >}})

2. [Configurar redes]({{< ref "/setup_network.es.md" >}})

3. [Crear instancia de replicación]({{< ref "Create-Replication-instance.es.md" >}})

4. [Crear puntos finales de origen y destino]({{< ref "Create-Source-and-Target-endpoints.es.md" >}})

5. [Configurar la base de datos de origen]({{< ref "configure_source_database.es.md" >}})

6. [Crear y ejecutar tarea de replicación]({{< ref "Create-and-run-Replication-task.es.md" >}})

7. [Resumen]({{< ref "Summary.es.md" >}})
