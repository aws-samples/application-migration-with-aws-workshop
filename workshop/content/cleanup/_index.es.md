+++
title = "Limpieza del Entorno"
weight = 50
pre = "<b>5. </b>"
+++

Al acabar los laboratorios, asegurate de borrar _todos_ los recursos que hayas creado, incluyendo:

1. En la <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">Consola de CloudEndure</a>       
   - Selecciona las maquinas que han sido migradas (con un checkbox) y haz click en **Acciones de la maquina (Machine Actions)** -> **Deten la replica de datos para la maquina 1 (Stop Data Replication For 1 Machine)**
   - Selecciona las maquinas que fueron migradas (con un checkbox) y haz clien en **Acciones de la maquina (Machine Actions)** -> **Borra 1 Maquina de esta consola (Remove 1 Machine from This Console)**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. En la  <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">Consola AWS de RDS</a>         
   - Modifica la **base de datos** creada para eliminar la proteccion de eliminacion (aplicar cambios immediatamente)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - Elimina la **base de datos** (sin el snapshot final y sin retener las copias de seguridad automaticas)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. En la <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">consola de AWS DMS</a>            
   - Deten y (cuando esten en el estado Parado) - borra las **tareas** creadas. *Espera a que las tareas hayan sido borradas*.
   - Borra los **puntos de destino (endpoints)** creados . *Espera a que los puntos de destino se hayan borrado*.
   - Borra las **instancias de replicacion (replication instances)**. *Espera a que las instancias de replicacion sean borradas*.
   - Borra los **grupos de subred (subnet group)** creados

     Vete a <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> a confirmar que todo ha sido borrado (asumiendo que no hayas usado DMS antes, deberias ver todo 0's, como en la captura de pantalla de abajo).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

4. En <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">la consola de Amazon EFS </a>        
   - Borra el **Sistema de Ficheros Elastico (Elastic File Systems)** creado

5. En <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Borra los **servicios (services)** creados
   - Borra las **definiciones de tareas (task definitions)** creadas
   - Borra los **clusters** creados

6. En la <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">consola AWS EC2</a>      
   - Termina las **maquinas EC2 (EC2 machines)** (incluidas aquellas con el prefijo 'CloudEndure' en su nombre)
   - Borra los **Balanceadores de Carga (Load balancers)**

7. En <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Borra la pila **ApplicationMigrationWorkshop** 

Cuando la pila **ApplicationMigrationWorkshop** esta borrada, revisa tu cuenta de AWS y **borra todos los recursos adicionales que fueron creados durante este laboratorio**.

De forma adicional te agradeceriamos si pudieras proporcionarnos <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">tu opinion de forma anonima sobre este laboratorio</a>.
