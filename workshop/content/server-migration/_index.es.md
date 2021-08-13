+++
title = "Migración del servidor"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### Descripción general de CloudEndure Migration

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> permite a las organizaciones migrar las cargas de trabajo más complejas a Amazon Web Services (AWS) sin interrupciones, ni pérdida de datos. A través de la replicación continua a nivel de bloque, la conversión automática de máquinas y la organización de la pila de aplicaciones, **CloudEndure Migration** simplifica el proceso de migración y reduce la posibilidad de errores humanos.

Ya sea que esté migrando a AWS o a través de regiones dentro de AWS, **CloudEndure Migration** le brinda la flexibilidad que necesita y le brinda los controles de seguridad que requiere para tener éxito en el ecosistema digital acelerado de hoy.

![cloudendure-intro](/ce/ce-home.png)

**Los beneficios de CloudEndure Live Migration incluyen:**

- Transferencia de ventanas de minutos y sin pérdida de datos
- 100% de integridad de datos para todas las aplicaciones (incluidas bases de datos y aplicaciones heredadas)
- Migraciones a gran escala sin impacto en el rendimiento
- Amplia plataforma y fuente de soporte de sistemas operativos
- Migración automatizada para minimizar los recursos de TI y la duración del proyecto.


{{% notice note %}}
**CloudEndure Migration** ahora está disponible **sin cargo** para todas las migraciones a AWS.
¡Vaya a la página de <a href="https://console.cloudendure.com/#/register/register"  target="_blank" rel="noopener noreferrer">Registro de Migración de CloudEndure</a> para crear una cuenta y comenzar a migrar a AWS en minutos!
{{% /notice %}}  

Puede obtener más información sobre **CloudEndure Migration** viendo el video a continuación.
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

En este laboratorio, realizará el alojamiento (re-hosting) (también conocido como “Lift and Shift”) del servidor web siguiendo los pasos a continuación:

1. [Configuración de CloudEndure]({{< ref "/CE-Configuration.es.md" >}})  
2. [Instalar agente en máquinas de origen]({{< ref "/CE-Agent-Installation.es.md" >}})  
3. [Preparar los planos de los servidores]({{< ref "/CE-Blueprints.es.md" >}})  
4. [Hacer el corte (transferencia de origen a destino)]({{< ref "/CE-Cutover.es.md" >}})  
5. [Configurar aplicación]({{< ref "/CE-Webserver-config.es.md" >}})  
