+++
title = "Instalar agentes en máquinas de origen"
weight = 20
+++


Desde la <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">consola de CloudEndure</a>, navegue a la pantalla **Machines** que le mostrará cómo agregar máquinas (**How to Add Machines**) y le proporcionará instrucciones para instalar el agente en las máquinas de origen.

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Instalar el agente en el servidor web

1. Obtenga la información del servidor web de origen

    Para **el laboratorio a su propio ritmo** - vaya a la sección **Outputs** de la <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">plantilla de CloudFormation </a> **ApplicationMigrationWorkshop**.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    Para **eventos de AWS** - el **IP del servidor web**, **nombre de usuario del servidor web** y **clave SSH del servidor web** están en el <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">panel del equipo de Event Engine</a>.

    ![Centos-pem](/ce/Centos-pem.png)

2. Descargue y guarde localmente (por ejemplo, como archivo **webserver.pem**) la **clave SSH del servidor web** (.pem)
 
    Si usa el sistema operativo Microsoft Windows, convierta el archivo .pem de la clave SSH a .ppk usando PuttyGen y luego use Putty para conectarse (puede encontrar <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">más detalles aquí</a>).

3. Conéctese al **servidor web de origen** utilizando el terminal SSH

    Para los usuarios de Microsoft Windows, revise  <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">este artículo</a>.  
    Para usuarios de Mac OS, revise  <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">este artículo</a>.

4. Ejecute los comandos copiados de **How to Add Machines** para descargar e instalar el agente:

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    Cuando se haga correctamente, recibirá un mensaje que indica que la **instalación finalizó correctamente**.
    
    {{% notice tip %}}
Los comandos para instalar el agente también se pueden obtener de la consola de **CloudEndure; Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Una vez que el agente esté instalado, el servidor aparecerá en la **consola de CloudEndure** -> pestaña **Machines**.

    ![CE-server-progress](/ce/CE-server-progress.png)

