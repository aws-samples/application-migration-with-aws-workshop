+++
title = "Database Migratie"
weight = 10
pre = "<b>1. </b>"
+++

In dit deel, ga je de database migratie uitvoeren van de MySQL database in de bronomgeving naar de Amazon RDS for MySQL database in de doelomgeving.

Het gaat in dit geval om een homogene database migratie (de database-engines in de bron- en doelomgeving zijn hetzelfde). Dus de database schemastructuur, datatypes, en de databasecode zijn compatibel tussen de bron- en doelomgeving. Dit betekent dat er geen database schema conversie nodig is.

![1](/db-mig/DMS-overview.png)

In deze workshop, voer je de onderstaande stappen uit:

1. [Opzetten DB in doelomgeving]({{< ref "/Create-target-DB.nl.md" >}})

2. [Netwerkconfiguratie]({{< ref "/setup_network.nl.md" >}})

2. [Aanmaken van de Replicatie Machine]({{< ref "Create-Replication-instance.nl.md" >}})

3. [Configureren van **Target Endpoints**]({{< ref "Create-Source-and-Target-endpoints.nl.md" >}})

4. [Configureren van de database in de doelomgeving]({{< ref "configure_source_database.nl.md" >}})

4. [Creëren van een replicatietaak]({{< ref "Create-and-run-Replication-task.nl.md" >}})

5. [Samenvatting]({{< ref "Summary.nl.md" >}})
