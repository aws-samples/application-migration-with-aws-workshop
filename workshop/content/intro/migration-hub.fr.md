+++
title = "Activer Migration Hub"
weight = 40
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> fournit un point central permettant de suivre l'avancement de la migration de ses applications utilisant des services AWS ou partenaires. 

Pour l'activer, sur **AWS Console** aller dans **Services -> AWS Migration Hub**, puis à partir du menu de gauche, cliquez sur **Migrate** et sélectionnez **US West Oregon** comme région d'origine.

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Cliquez sur **Migrate -> Tools** pour sélectionner les outils qui fourniront les informations à **AWS Migration Hub**. "CloudEndure Migration" est déjà intégré à Migration Hub, mais pour **AWS Database Migration Service** l'intégration doit être configurée.

Paginez vers le bas de la page et cliquez sur le bouton **Connect** dans **la cadre AWS Database Migration Service**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

En quelques secondes, le statut de l'intégration doit passer de **Not connected** à **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

C'est tout, toutes les nouvelles actions réalisées avec **CloudEndure Migration** et **AWS Database Migration Service** seront tracées dans le tableau de bord de **AWS Migration Hub**.
