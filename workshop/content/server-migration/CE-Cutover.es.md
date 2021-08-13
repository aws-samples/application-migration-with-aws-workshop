+++
title = "Hacer el corte (transferencia de origen a destino)"
weight = 40

+++
### Prueba/Corte de CloudEndure Migration

Una vez que haya completado la replicación de los volúmenes (de modo que el estado junto al nombre de la máquina dice **Replicación continua de datos**), podrá realizar una Prueba/Corte (**Test/Cutover**).

Cada vez que inicia **Test/Cutover**, CloudEndure Migration elimina todas las instancias creadas previamente y crea **una nueva instancia de Target** que está actualizada con la última copia de los datos del entorno de origen.


{{% notice note %}}
De acuerdo con las mejores prácticas, y en la vida real, debe realizar una migración de **prueba** al menos **una semana** antes de la fecha de migración objetivo. Esto es para identificar posibles desafíos con su configuración de Blueprint o con la conversión de volumen replicada y abordarlos.
En este laboratorio, realizará un corte (**Cutover**) (esta conversión de instancia se realizó casi 3.000 veces, ¡así que sabemos que funciona!).

{{% /notice %}}


1. Confirme que los volúmenes están completamente replicados
   
    Confirme que la instancia se encuentra en un estado de replicación continua de datos (**Continuous Data Replication**) en la columna **DATA REPLICATION PROGRESS**.

    Si todavía se está replicando, espere hasta que alcance el estado **Replicación continua de datos**. Mientras espera, puede revisar la <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">documentación de CloudEndure</a>.

2. Active el corte
   
    En la lista de **Machines**, seleccione el servidor que desea cortar, haga clic en el botón **LAUNCH 1 TARGET MACHINE** en la esquina superior derecha de la pantalla, luego **Cutover Mode** y **CONTINUE** en la ventana emergente de confirmación.

    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure ahora realizará una sincronización / instantánea final en los volúmenes y comenzará el proceso de construir nuevos servidores en la infraestructura de destino, todo mientras mantiene la consistencia de los datos. Vea la pantalla de **Job Progress** para más detalles.


    ![CE-job-progress](/ce/CE-job-progress.png)

    Supervise el registro de progreso **Job Progress** hasta que vea el mensaje **Finished starting converters** (debería tardar entre 3 y 5 minutos). Mientras tanto, puede revisar la  <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">documentación de CloudEndure que proporciona detalles sobre el proceso de transición</a>.

    {{% notice tip %}}
Si no ve su trabajo en la ventana **Job Progress**, actualice el navegador (F5) y asegúrese de desplazarse a la parte superior de la lista desplegable de trabajos de CloudEndure.
{{% /notice %}}

3. Revise los recursos creados por CloudEndure en su cuenta de AWS
   
    Vuelva a la **consola de AWS** y navegue a su región de AWS de destino si es necesario (US-west-2 / Oregon).
   
    Verá dos instancias adicionales administradas por CloudEndure:
    - **CloudEndure Machine Converter** - se utiliza para la conversión del volumen de arranque de origen, realizar cambios en el cargador de arranque específicos de AWS, inyectar controladores de hipervisor e instalar herramientas en la nube. Se ejecuta durante un par de minutos por cada prueba o transición.
    - **CloudEndure Replication Server** - se utiliza para recibir datos cifrados de agentes instalados en el entorno de origen. Se ejecuta cuando se realiza la replicación de datos.

    CloudEndure gestiona completamente ambos tipos de instancias y los usuarios NO pueden acceder a ellas.

	Tan pronto como finalice la transición, verá otra instancia de EC2 en la lista: este es su servidor web objetivo creado por CloudEndure. Tome nota de sus IP públicas y privadas, ya que las necesitará en el próximo paso.


    {{% notice tip %}}
Si desea saber más sobre esos servidores, su propósito y los requisitos de red, consulte la <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">documentación de CloudEndure</a>.
{{% /notice %}}
