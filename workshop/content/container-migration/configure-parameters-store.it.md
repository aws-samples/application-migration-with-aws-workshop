+++
title = "Configura il Parameter Store"
weight = 30
+++

Poichè utilizzeremo l'immagine ufficiale docker di wordpress con il database RDS , dovremo fornire le credenziali del database, il nome del database e i dettagli del server per la configurazione di wordpress.

Il modo migliore per raggiungere questo obiettivo è quello di gestire questi parametrinel **AWS Systems Manager** Parameter Store invece di memorizzarli nell'immagine docker o nella definizione dell'attività ECS.

Dalla **AWS Console**, selezionare **Services**, quindi **Systems Manger** e vai su **Parameter Store**.

clicca sul bottone **Create parameter** e inserisci i **Parameter Details** (Nome, Descrizione, Tipo e Valore) per i parametri come da tabella qui sotto.

![parameter-details](/ecs/parameter-details.png)

Dovrai ripetere quanto sopra per tutti i seguenti parametri:


| Parameter              | Type             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | endpoint RDS                    |
| DB_NAME                | String           | nome del database target (wordpress-db)  |
| DB_USERNAME            | String           | database RDS username          |
| DB_PASSWORD            | SecureString     | database RDS password          |
