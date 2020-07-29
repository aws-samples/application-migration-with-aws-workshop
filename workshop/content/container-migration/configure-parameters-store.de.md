+++
title = "Konfigurieren Sie den **Parameters Store**"
weight = 30
+++

Da wir das offizielle WordPress-Docker-Image mit der RDS-Datenbank verwenden werden, 
müssen wir die Datenbankanmeldeinformationen, Datenbanknamen und Serverdetails 
für die WordPress-Konfiguration angeben.

Der beste Weg, dies zu tun, besteht darin, diese Parameter in **AWS Systems Manager/Parameter Store** 
zu verwalten, anstatt sie im Docker-Image oder in der ECS-Task-Definition zu speichern.

Besuchen Sie die **AWS Console**, **Services**, wählen Sie **Systems Manger** und dann **Parameter Store**.

Klicken Sie auf die Schaltfläche **Create parameter** darauf, und geben Sie ** Parameter Details** 
(Name, Beschreibung, Typ und Wert) für die Parameter gemäß der folgenden Tabelle ein.

![parameter-details](/ecs/parameter-details.png)

Sie müssen das die Schritte für alle folgenden Parameter wiederholen:

| Parameter              | Type             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | name of the target database  (wordpress-db)  |
| DB_USERNAME            | String           | RDS database username          |
| DB_PASSWORD            | SecureString     | RDS database password          |
