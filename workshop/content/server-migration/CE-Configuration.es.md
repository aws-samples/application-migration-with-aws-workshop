+++
title = "Configuración de CloudEndure"
weight = 10
+++


Para comenzar, deberá configurar CloudEndure con **credenciales de AWS** para acceder a su cuenta de AWS y ubicación de **destino de replicación** (subred) dentro de la cuenta de AWS de destino para el servidor de replicación de CloudEndure.

### Configure las credenciales de AWS.

1. Inicie sesión en la consola de CloudEndure en  [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    Para **el laboratorio a su propio ritmo** - use su cuenta de migración de CloudEndure existente o cree una nueva [cuenta de migración de CloudEndure](https://console.cloudendure.com/#/register/register) y un nuevo <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">proyecto de CloudEndure</a>
	
    Para **eventos de AWS** - use el **nombre de usuario** y la **contraseña** de CloudEndure que figuran en el <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Panel de equipo de Event Engine</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    Si no se muestran en <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine – Panel de equipo</a>, comuníquese con el presentador para proporcionarle las credenciales.

2. Vaya a la pestaña **Setup & Info** > **AWS Credentials**.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Haga clic en el botón **EDIT** e ingrese el **AWS Access Key ID** y **AWS Secret Access Key**
   
    Para **el laboratorio a su propio ritmo** - copie esta información de la sección **Output** de la <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">plantilla de CloudFormation</a> **ApplicationMigrationWorkshop**, se verá como en la siguiente captura de pantalla.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    Para **eventos de AWS** - copie esta información del <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Panel de equipo – Event Engine</a> sección **CloudEndure AWS Credentials**, se verá como en la siguiente captura de pantalla.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Sobrescriba cualquier valor que ya esté presente en los campos ID de **AWS Access Key ID** y **AWS Secret Access Key**

4. Una vez que ingresó el **AWS Access Key ID** y **AWS Secret Access Key**, haga clic en el botón **SAVE**.

### Configure las configuraciones de replicación.

Una vez que guarde sus **credenciales de AWS**, será redirigido automáticamente a la pestaña **Setup & Info > REPLICATION SETTINGS**, aquí es donde configurará los detalles **del servidor de replicación CloudEndure**.

{{% notice note %}}
Antes de continuar, **actualice el navegador** para recuperar la información más reciente de su cuenta de AWS (puede hacerlo presionando el botón **F5** o actualizando manualmente su navegador haciendo clic en el botón Actualizar).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Actualice la configuración de **REPLICATION SETTINGS** para que coincida con los valores a continuación:

    | Parámetros                                  | Valor                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | Desmarcado                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | Desmarcado                                                |
    | Enable volume encryption                   | Marcado                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.png)

2. Desplácese hasta la parte inferior de la pantalla y haga clic en el botón **SAVE REPLICATION SETTINGS**.

    {{% notice tip %}}
Si en la parte superior de la pantalla ve un aviso que dice que las credenciales de AWS deben actualizarse, actualice el navegador (F5).
{{% /notice %}}
