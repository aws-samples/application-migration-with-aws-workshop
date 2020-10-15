+++
title = "Configureer de Parameter Store"
weight = 30
+++

Omdat we de officiële **Wordpress docker image** gebruiken met onze RDS database, dienen we inloggegevens, DB name en serverinformatie voor de database aan de applicatie te geven. 

De beste manier om dat te doen is door deze informatie te beheren via de **AWS Systems Manager - Parameter Store** zodat we deze gegevens niet op een onveilige manier in de **docker image** of in de ECS Taak Definitie hoeven te zetten.

In het **AWS Console**, selecteer **Services**, en druk dan op **Systems Manger** en ga naar **Parameter Store**.

Klik op de **Create parameter** knop en vul de **Parameter Details** in (Name, Description, Type and Value) voor de parameters zoals weergegeven in de onderstaande tabel.

![parameter-details](/ecs/parameter-details.png)

Herhaal de bovenstaande stappen voor elke parameter in the tabel.


| Parameter              | Type             | Waarde                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | naam van de database in de doelomgeving (wordpress-db)  |
| DB_USERNAME            | String           | RDS database username          |
| DB_PASSWORD            | SecureString     | RDS database password          |
