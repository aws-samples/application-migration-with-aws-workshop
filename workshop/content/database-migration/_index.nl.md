+++
title = "Database Migratie"
weight = 10
pre = "<b>1. </b>"
+++

In dit deel, ga je de database migratie uitvoeren van de MySQL database in de bronomgeving naar de Amazon RDS for MySQL database in de doelomgeving met **AWS Database Migration Service**.

Het gaat in dit geval om een homogene database migratie (de database-engines in de bron- en doelomgeving zijn hetzelfde). Dus de database schemastructuur, datatypes, en de databasecode zijn compatibel tussen de bron- en doelomgeving. Dit betekent dat er geen database schema conversie nodig is.

![1](/db-mig/DMS-overview.png)

U kunt meer over deze service leren door de onderstaande video te bekijken.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In deze workshop, voer je de onderstaande stappen uit:

1. [Opzetten DB in doelomgeving]({{< ref "/Create-target-DB.nl.md" >}})

2. [Netwerkconfiguratie]({{< ref "/setup_network.nl.md" >}})

3. [Aanmaken van de Replicatie Machine]({{< ref "Create-Replication-instance.nl.md" >}})

4. [Configureren van Source en Target **Endpoints**]({{< ref "Create-Source-and-Target-endpoints.nl.md" >}})

5. [Configureren van de database in de bronomgeving]({{< ref "configure_source_database.nl.md" >}})

6. [Creëren van een replicatietaak]({{< ref "Create-and-run-Replication-task.nl.md" >}})

7. [Samenvatting]({{< ref "Summary.nl.md" >}})
