+++
title = "Crear un servicio en Amazon ECS"
weight = 60
+++

Una vez hayas completado la **Definicion de una tarea en Amazon ECS (Amazon ECS Task Definition)**, estas preparado para crear un **Servicio de Amazon ECS**.

Selecciona el **cluster de ECS** que has creado antes, haz click en **Servicios (Services)** y luego en el boton **Crear (Create)**.

![create-service](/ecs/create-service.png)

### Paso 1: Configurar el servicio

En el asistente de **Crear un Servicio (Create Service)**, sigue la configuración de abajo (asegurate de seleccionar **FARGATE** en  **tipos de Lanzamiento (Launch type)**).  

- Selecciona la **Definicion de Tarea (Task Definition)** que has creado antes
- Selecciona la **version de la Plataforma 1.4.0**                                                                           
- Selecciona el **Cluster ECS (ECS Cluster)** que has creado anteriormente e introduce el **Nombre del Servicio (Service name)** (ejemplo unicorns-svc)                                   
- Selecciona el numero de tareas a 2  
- Deja el resto de opciones por defecto y haz click en **Siguiente Paso (Next step)**  


![configure-service](/ecs/configure-service.png)

### Paso 2: Configura la red

En la configuración de red, selecciona la VPC que has creado anteriormente y especifica tus subredes, y ECS-Tasks-SG en el grupo de seguridad.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Selecciona **Balanceador de Carga de Aplicaciones (Application Load Balancer)** en el tip de balanceador de carga, y selecciona el balanceador de carga que has creado antes.

![container-lb](/ecs/container-lb.png)

Haz click en **Añadir al balanceador de carga (Add to load balancer)** para añadir el nombre:puerto del contenedor

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
En la seccion descubrir el Servicio (Service discovery), **No marques (uncheck)** la opcion "Habilitar integración de descubrimiento de servicio"("Enable service discovery integration") y pulsa [Next step]

### Paso 3: Configurar Auto Scaling

En la configuracion de Auto Escalado, selecciona **Configura el Servicio de Auto Escalado (Configure Service Auto Scaling)** y especifica el **minimo, deseado, maximo (minimum, desired, maximum)** numero de tareas.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

En las **Politicas Automaticas de escalado (Automatic task scaling policies)**, establece el tipo de politica de escalado a **Tracear Objetivo (Target Tracking)**, proporciona el nombre de la politica de escalado (ejemplo Requests-policy), selecciona la metrica del servicio (ejemplo ALBRequestCountPerTarget) y luego establece el valor objetivo(por ejemplo 300).

{{% notice note %}}
Puedes repetir esto ultimo para diferentes metricas de servicio (por ejemplo CPU y utilización de Memoria).
{{% /notice %}}  

### Paso 4: Revisar

Finalmente, Revisa y haz click en **Crear Servicio (Create Service)** para crear el Servicio de Amazon ECS.

Una vez el estado del servicio esta en **Activo (Active)** y todas las tareas estan en el estado **Corriendo (Running)**, navega hacia el sitio web objetivo usando el DNS del balanceador de carga.

{{% notice note %}}
Puede que tambien necesites configurar el auto escalado para los nodos ECS, compruebalo aqui [esta guia para mas  detalles](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
En caso de que encuentres algun problema, por favor comprueba aqui [Guia de resolucion de problemas deAmazon ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
