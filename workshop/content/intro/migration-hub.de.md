+++
title = "Migration Hub aktivieren"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> 
bietet einen zentralen Speicherort, um den Fortschritt von Anwendungsmigrationen über mehrere AWS- und Partnerlösungen hinweg zu verfolgen.


Um es zu aktivieren, gehen Sie in **AWS Console** zu ** Services -> AWS Migration Hub ** bitte.
Klicken Sie dann im linken Menü auf **Migrate** und wählen Sie **US West Oregon** als Ihre Home-Region aus.

![Migration Hub - wähle Home-Region](/intro/migration-hub-choose-home-region.png)

Klicken Sie dann auf **Migrate -> Tools**, um Tools auszuwählen, die Updates bereitstellen
für **AWS Migration Hub**. Die CloudEndure-Migration funktioniert out-of-the-box.
Sie müssen jedoch die Integration mit **AWS Database Migration Service** konfigurieren.

Scrollen Sie zum Ende der Seite und klicken Sie auf die Schaltfläche **Verbinden** in der **AWS Database Migration Service card**.

![Migration Hub - verbinde DMS](/intro/migration-hub-connect-dms.png)

Innerhalb von Sekunden sollte sich der Integrationsstatus von **Nicht verbunden** in **Verbunden** ändern.

![Migration Hub - verbunden DMS](/intro/migration-hub-connect-dms-connected.png)

Das war's! All zukünftigen Aktivitäten in **CloudEndure Migration**
und **AWS Database Migration Service** werden über das **AWS Migration Hub** Dashboard gemeldet.
