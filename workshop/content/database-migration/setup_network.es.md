+++
title = "Configurar redes"
weight = 15
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

2. Agregar regla de entrada al grupo de seguridad  **DB-SG**

    a. Vuelva a la **Consola de AWS > Services > EC2 > Security Groups** haga clic en el **Security Group ID** del grupo de seguridad de base de datos **DB-SG** creado anteriormente
    
    b. En los detalles de la pantalla del grupo de seguridad  **DB-SG**, presione el botón **Edit inbound rules**
      
    c. En la pantalla **Edit inbound rules** presione el botón **Add rule** y configure la regla para permitir **el tráfico entrante** del grupo de seguridad de la **instancia de replicación DMS** en el puerto 3306 y presione el botón **Save rules** button
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
