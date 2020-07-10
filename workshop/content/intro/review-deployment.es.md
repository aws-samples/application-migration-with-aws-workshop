
+++
title = "Revisar el entorno implementado"
weight = 40
+++
## Entorno de origen

El siguiente entorno de origen se implementa durante la preparación del entorno.

![source-env](/intro/source-env.png)

El entorno de origen consta de una aplicación de comercio electrónico de tres niveles; un servidor web que ejecuta Ubuntu con Apache, PHP, Wordpress, WooCommerce y un servidor de base de datos que ejecuta Ubuntu con MySQL versión 5.7.


## Entorno de destino

El siguiente destino de **Amazon Virtual Private Cloud (VPC)** se implementa durante la preparación del entorno.

![target-env](/intro/target-vpc.png)

La VPC consta de 6 subredes (2 públicas, 2 privadas para servidores web y 2 privadas para bases de datos) en dos zonas de disponibilidad.

Ahora puede habilitar [AWS Migration Hub]({{< ref "/migration-hub.es.md" >}})  
