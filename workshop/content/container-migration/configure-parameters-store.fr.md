+++
title = "Configuration de Parameter Store"
weight = 30
+++

Etant donné que nous allons utiliser l'image docker officielle de wordpress avec une base de données RDS, nous aurons besoin de fournir les accès à la base de donnée, le nom de la base de données et les détails du serveur pour la configuration wordpress. 

La meilleure manière de faire consiste à gérer ces paramètres dans **AWS Systems Manager** "Parameter Store"  au lieu de les stocker dans l'image docker ou la définition des tâches ECS.

A partir de **AWS Console**, sélectionnez **Services**, puis **Systems Manger** et aller dans **Parameter Store**.

Cliquez sur le bouton **Create parameter** et entrez **Les valeurs** (Nom, Description, Type et Valeur) pour les paramètres tel qu'indiqué dans le tableau ci-dessous.

![parameter-details](/ecs/parameter-details.png)

Vous aurez à répéter ceci pour chacun des paramètres suivants :


| Parameter              | Type             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | name of the target database  (wordpress-db)  |
| DB_USERNAME            | String           | RDS database username          |
| DB_PASSWORD            | SecureString     | RDS database password          |
