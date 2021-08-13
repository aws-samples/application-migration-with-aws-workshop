+++
title = "Abilita Migration Hub"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> fornisce un'unica posizione per tenere traccia dell'avanzamento delle migrazioni delle applicazioni tra più soluzioni AWS e partner.

Per abilitarlo , all'interno di  **AWS Console** vai su **Services -> AWS Migration Hub**, quindi dal menu di sinistra fai click su  **Migrate** e seleziona **US West Oregon** come regione di residenza.

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Quindi fai click su  **Migrate -> Tools** per selezionare gli strumenti che forniranno gli aggiornamenti a  **AWS Migration Hub**. CloudEndure Migration è già pronto all'uso, ma devi configurare l'integrazione con  **AWS Database Migration Service**.

Scorri fino alla fine della pagina e fai click sul pulsante  **Connect** nella scheda **AWS Database Migration Service card**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

In pochi secondi, lo stato dell'integrazione dovrebbe cambiare da  **Not connected**, a **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

Tutto qui, tutte le attività future in **CloudEndure Migration** e **AWS Database Migration Service** verranno riportate attraverso la dashboard **AWS Migration Hub** .