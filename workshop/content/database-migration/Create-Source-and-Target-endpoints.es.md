+++
title = "Crear los endpoints de origen y destino"
weight = 30
+++


### Crear los endpoints de origen y destino

Vuelva a la consola de AWS, a la pantalla de **AWS Database Migration Sercice**, haga clic en **Endpoints** y en el botón **Create endpoint** button.

1. Crear el **endpoint de origen**

    Utilice los siguientes parámetros para configurar el endpoint:

    | Parámetros           | Valor                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Para obtener esta información cuando está utilizando **el laboratorio a su propio ritmo** vaya a la pestaña **Outputs** en la sección de <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">plantilla de CloudFormation</a> de **ApplicationMigrationWorkshop**, <br>Para **eventos de AWS** - use el **IP del servidor de bases de datos** del Panel de equipo de Event Engine.   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Abra la sección **Test endpoint connection (optional)**, luego en el menú desplegable **VPC** seleccione **TargetVPC** y haga clic en el botón **Run test** para verificar que su configuración del endpoint sea válida.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    La prueba se ejecutará durante un minuto y debería ver un mensaje **successful** en la columna **Status**. Haga clic en el botón **Create endpoint**.
    
    En caso de errores, asegúrese de haber configurado los parámetros del endpoint correctamente y de que la instancia de replicación se haya creado con el parámetro **Publicly Accessible** marcado.

2. Crear el **endpoint de destino**

    Repita todos los pasos para crear el endpoint de destino con los siguientes valores de parámetros:

    | Parámetros           | Valor                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | Marcado                                            |
    | RDS Instance        | Seleccione su instancia de RDS en el menú desplegable (si no está visible, ingrese los valores manualmente)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (será pre-poblado)                                                |
    | Server Name         | Nombre DNS de su base de datos RDS (deje el valor rellenado previamente)                            |
    | Port                | 3306     (será pre-poblado)                                             |
    | SSL mode            | none                                                  |
    | User name           | (deje el valor pre-poblado)                                                 |
    | Password            | Ingrese la contraseña que utilizó cuando creó la base de datos RDS|


3. En **Endpoint-specific settings -> Extra connection attributes** copie y pegue los siguientes parámetros de conexión:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. En **Test endpoint connection (optional)**, seleccione **TargetVPC** en el menú desplegable **VPC** y haga clic en el botón **Run test** para verificar que su endpoint sea válido.

    La prueba se ejecutará durante un minuto y al final debería ver un mensaje **successful** en la columna **Status**. Haga clic en el botón **Create endpoint**.

En caso de algún error, asegúrese de que el **grupo de seguridad VPC** de su base de datos RDS permita el tráfico entrante en el puerto 3306 del grupo de seguridad de la **instancia de replicación de AWS DMS** (o, por ejemplo, de todo el **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Se pueden realizar pruebas de conexión adicionales, yendo a la lista de **Endpoints** y haciendo clic en el botón **Actions** y luego en **Test connection**.
{{% /notice %}}
