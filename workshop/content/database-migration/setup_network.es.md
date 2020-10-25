+++
title = "Configurar redes"
weight = 10
+++

Como no usamos un **VPN** o **AWS Direct Connect** en este taller, la **instancia de replicación DMS** deberá conectarse a la base de datos de origen a través de Internet pública, mientras que a la base de datos de destino a través de una red privada.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Configurar el grupo de seguridad

**El grupo de seguridad VPC** en este taller debe permitir el tráfico entrante desde la  **instancia de replicación DMS** a la base de datos RDS de destino.

1. Crear un grupo de seguridad para la **instancia de replicación DMS**

    a. Vaya a la **Consola de AWS > Services > EC2 > Security Groups** y haga clic en el botón **Create Security Group**.

    b. Ingrese el **nombre del grupo de seguridad** (por ejemplo, RI-SG), dele una **descripción**, seleccione **TargetVPC** para el campo VPC y presione el botón **Create security group**.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  No es necesario agregar ninguna regla de entrada al grupo de seguridad de la **instancia de replicación DMS RI-SG**
  {{% /notice %}}

2. Crea un grupo de seguridad para la **Base de datos de Destino**

    a. Ve a **Consola de AWS > Services > EC2 > Security Groups** y haga clic en el boton **Crear un Grupo de Seguridad (Create Security Group)**.
    
    b. Introduzca **El nombre del grupo de seguridad (Security group name)** (por ejemplo DB-SG), dale una **descripcion (Description)**, selecciona la **VPC de destino (TargetVPC)** en el campo de VPC y pulsa el boton **Crear grupo de Seguridad (Create security group)**. 

    c. En la seccion **inbound rules** presione el botón **Add rule** y configure la regla para permitir **el tráfico entrante (inbound)** del grupo de seguridad (ej. RI-SG) desde la **instancia de replicación DMS (DMS Replication Instance)** en el puerto 3306 y presione el botón **Save rules** button
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
