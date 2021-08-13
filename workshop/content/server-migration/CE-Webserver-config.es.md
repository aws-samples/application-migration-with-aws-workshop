+++
title = "Configurar aplicación"
weight = 50

+++

### Configure el servidor web para acceder a la base de datos de destino

Cuando finalice el corte (Cutover) y **CloudEndure Migration** haya creado una instancia en ejecución del servidor web en su cuenta de AWS, es hora de actualizar la configuración de la aplicación web para usar su base de datos replicada de AWS RDS (creada en el paso **Migración de la base de datos**).


1. Actualice el **grupo de seguridad del servidor web**

    a. Vaya a la **consola de AWS -> EC2** y seleccione el servidor web en la lista
	
    b. Tome nota de su dirección de **DNS público (IPv4)** e **IP privada**
	
    c. Haga clic en el grupo de seguridad que le ha asignado  

    ![Webserver details](/ce/webserver_details.png)

    d. Modifique las reglas de entrada para ese grupo de seguridad para permitir el tráfico desde cualquier lugar en el puerto **80** y desde su computadora en el puerto **22**

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Inicie sesión en el **servidor web** creado por CloudEndure  

    Utilice el mismo nombre de usuario (ubuntu) y la clave SSH .ppk como en el entorno de origen.

	Si no está seguro de cómo usar SSH para acceder a los servidores, verifique lo siguiente:
    - Para usuarios de Microsoft Windows, <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">vea este artículo</a>.  
    - Para usuarios de Mac OS, <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">vea este artículo</a>.

3. Modificar la **configuración de WordPress**

    Edite el archivo **/var/www/html/wp-config.php**, modificando
    - DB_HOST - Endpoint de la instancia RDS creada
    - DB_USER - el nombre de usuario configurado en el paso **Migración de la base de datos**
    - DB_PASSWORD - la contraseña configurada en el paso **Migración de la base de datos**
    
    Agregue también las dos líneas siguientes, reemplazando **TARGET_WEBSERVER_PUBLIC_DNS** con el **EC2 DNS público (IPv4)** del servidor web de destino (target), para asegurarse de que los enlaces en su sitio de wordpress apunten al nuevo servidor web.
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    por ejemplo
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

    {{% notice tip %}}
Para editar este archivo, puede usar, por ejemplo, <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> o <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Actualice el **grupo de seguridad VPC** de la instancia RDS para permitir el tráfico entrante desde el servidor web

    a. Vaya a **AWS Console> Services > EC2 > Security Groups** y seleccione **su grupo de seguridad RDS VPC** (DB-SG)
	
    b. Vaya a la pestaña **Inbound** y haga clic en el botón **Edit**
	
    c. Agregue una regla de entrada que permita el tráfico del **servidor web** (usando su **IP privada** o el **grupo de seguridad** al que pertenece) en el puerto **3306** (puerto MySQL)
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

    {{% notice tip %}}
Si usó un nombre de grupo de seguridad diferente para su instancia de RDS, puede encontrarlo en detalles de su instancia de RDS, sección **Connectivity & security, Security**
{{% /notice %}}     
    

5. **Valide** la migración

    Abra el nombre del DNS público del servidor web (IPv4) en su navegador web, debería ver una tienda de unicornios.

Si todo funciona bien, continúe con la siguiente fase, [¡Optimización!]({{< ref "../optimization/_index.es.md" >}})

## Solución de problemas

1.	Asegúrese de que la información relacionada con la base de datos RDS configurada en el servidor web en **/var/www/html/wp-config.php** sea correcta
2.	Asegúrese de que la base de datos RDS esté utilizando el grupo de seguridad **DB-SG**
3.	Asegúrese de que el plano (blueprint) de CloudEndure para el servidor web apunte a un **TargetVPC public-subnet-a**

