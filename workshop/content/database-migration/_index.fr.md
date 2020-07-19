+++
title = "Migration de base de données"
weight = 10
pre = "<b>1. </b>"
+++

Dans cette section, vous allez effectuer une migration de base de données avec comme source une base de données MySQL et comme cible un base de données RDS MySQL avec **AWS Database Migration Service**. Comme cette migration est homogène (la source et la cible utilisent les mêmes moteurs) - la structure du schéma, les types de données et le code de la base de données sont compatibles entre la source et la destination. Il ne sera pas nécessaire de convertir ces éléments pour la migration. 

![1](/db-mig/DMS-overview.png)

Vous pouvez en apprendre plus sur ce service en regardant la video ci-dessous.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Dans ce lab, vous allez dérouler les étapes suivantes :

1. [Création de la base de données cible]({{< ref "/Create-target-DB.fr.md" >}})

2. [Configuration du réseau]({{< ref "/setup_network.fr.md" >}})

2. [Création de l'instance de réplication]({{< ref "Create-Replication-instance.fr.md" >}})

3. [Création des source et target "endpoints"]({{< ref "Create-Source-and-Target-endpoints.fr.md" >}})

4. [Configuration de la base de données source]({{< ref "configure_source_database.fr.md" >}})

4. [Création et exécution de la tâche de réplication]({{< ref "Create-and-run-Replication-task.fr.md" >}})

5. [Résumé]({{< ref "Summary.fr.md" >}})
