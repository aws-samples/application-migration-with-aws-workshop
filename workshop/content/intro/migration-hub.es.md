+++
title = "Habilite Migration Hub"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> proporciona una ubicación única para rastrear el progreso de las migraciones de aplicaciones en múltiples soluciones de AWS y tecnologías de socios.

Para habilitarlo, dentro de la **Console de AWS** vaya a **Services -> AWS Migration Hub**, luego desde el menú izquierdo, haga clic en **Migrate** y seleccione **US West Oregon** como su región de origen.

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Luego, haga clic en **Migrate -> Tools** para seleccionar las herramientas que proporcionarán actualizaciones a **AWS Migration Hub**. CloudEndure Migration ya está funcionando de forma inmediata, pero debe configurar la integración con **AWS Database Migration Service**.

Desplácese hasta la parte inferior de la página y haga clic en el botón **Connect** en la tarjeta de **AWS Database Migration Service**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

En cuestión de segundos, el estado de integración debería cambiar de  **Not connected**, a **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

Eso es todo, todas sus actividades futuras en **CloudEndure Migration** y **AWS Database Migration Service** se informarán a través del panel de control de **AWS Migration Hub**.
