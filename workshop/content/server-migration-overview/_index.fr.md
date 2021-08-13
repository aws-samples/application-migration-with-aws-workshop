+++
title = "Migration de serveur"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### Stratégies de Migration de Serveur d'Application

Dans cette étape, vous allez migrer un serveur web en utilisant une ou plusieurs stratégies. Chaque stratégie demande de suivre des activités différentes à l'aide d'outils spécifiques. 

Voici une liste des principales stratégies :

1. **REHOST**: Migrer une application sans aucune modification, également appelé lift-and-shift. Pour réaliser une telle migration, il est possible d'utiliser des services avec un agent à installer sur le serveur source comme <a href="https://aws.amazon.com/fr/application-migration-service/">AWS Application Migration Service</a> ou <a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> mais aussi sans agent comme <a href="https://aws.amazon.com/server-migration-service/" target="_blank" rel="noopener noreferrer">AWS Server Migration Service</a>.
2. **REPLATFORM**: Faire de simples modifications pour obtenir un bénéfice tangible. L'architecture de l'application restera la même.
3. **REPURCHASE**: Passer de licenses classiques à un nouveau modèle adapté aux software-as-a-service. <a href="https://aws.amazon.com/mp/migration/" target="_blank" rel="noopener noreferrer">AWS Marketplace</a> propose un catalogue numérique organisé de solutions logicielles qui prennent en charge chaque phase de migration.
4. **REFACTOR**: Réimaginer comment l'application doit être structurée et la réécrire en utilisant toutes les possibilités du cloud.


![migration_strategies](/server_migration_overview/migration_options.png)


#### Choisir sa stratégie 

Il est donc temps pour vous de décider d'une stratégie. Continuez avec une des sections suivantes : 

1. [Rehost avec AWS Application Migration Service]({{< ref "/app-mig-service/_index.fr.md" >}}) - service recommandé pour toute migration vers AWS de type lift-and-shift

2. [Rehost avec CloudEndure]({{< ref "/server-migration/_index.fr.md" >}}) - service remplacé par AWS Application Migration Service

3. [Replatform vers des Containers]({{< ref "/container-migration/_index.fr.md" >}})
