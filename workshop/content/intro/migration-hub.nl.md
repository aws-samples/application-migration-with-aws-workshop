+++
title = "Het opzetten van Migration Hub"
weight = 40
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> biedt één locatie om de voortgang van applicatie migraties in meerdere AWS- en partneroplossingen bij te houden.

Voor het opzetten van **Migration Hub**, ga in de AWS console naar **Services -> AWS Migration Hub**. Druk dan op **Migrate** in het menu aan de linkerkant en kies **US West Oregon** als je AWS regio (home region).

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Druk dan op **Migrate -> Tools** om de hulpapplicaties te selecteren die gekoppeld worden aan **AWS Migration Hub**. 

**CloudEndure Migration** werkt automatisch al samen met **Migration Hub**. Maar je dient ook **AWS Database Migration Service** te koppelen aan **Migration Hub** voor deze workshop.

Scroll naar beneden op de pagina en druk op de **Connect** knop voor **AWS Database Migration Service**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

Binnen enkele seconden veranderd de integratiestatus van **Not connected**, naar **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

Dat was het! Alle volgende stappen in **CloudEndure Migration** en **AWS Database Migration Service** worden doorgegeven aan het **AWS Migration Hub** dashboard.
