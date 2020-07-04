+++
title = "Configura el Almacenamiento de Parametros"
weight = 30
+++

Como vamos a utilizar la imagen oficial de docker para wordpress con una base de datos RDS, vamos a tener que proporcionar las credenciales de la base de datos, el nombre de la base de datos y los detalles del servidor para la configuración de wordpress.

La mejor forma de hacerlo es gestionar estos parametros en el almacenamiento de Parametros del **AWS Systems Manager** en lugar de almacenarlos dentro de la imagen docker o la definición de tarea de ECS.

Desde la **Consola AWS**, selecciona **Servicios (Services)**, luego **Gestor del Sistema (Systems Manger)** y vete al  **Almacenamiento de Parametros (Parameter Store)**.

Click en el boton **Crear parametro (Create parameter)** e introduce los **Detalles del Parametros (Parameter Details)** (Nombre, Descripcion, Tipo y Valor) para los parametros como esta descrito en la tabla de abajo.

![parameter-details](/ecs/parameter-details.png)

Tienes que repetir los pasos descritos arriba para todos los parametros siguientes:


| Parametro              | Tipo             | Valor                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | name of the target database  (wordpress-db)  |
| DB_USERNAME            | String           | RDS database username          |
| DB_PASSWORD            | SecureString     | RDS database password          |
