+++
title = "Datenbankmigration"
weight = 10
pre = "<b>1. </b>"
+++

In diesem Abschnitt führen Sie eine Datenbankmigration unter Verwendung der MySQL-Quelldatenbank 
auf eine Amazon RDS for MySQL-Zieldatenbank mit **AWS Database Migration Service** durch. 
Da es sich um eine homogene Datenbankmigration handelt (die Quell- und Zieldatenbankmodule 
sind identisch), sind die Schemastruktur, die Datentypen und der Datenbankcode zwischen 
der Quell- und der Zieldatenbank kompatibel, sodass für diese Art der Migration keine 
Schema-Anpassungen erforderlich sind.

![1](/db-mig/DMS-overview.png)

Weitere Informationen zu diesem Service finden Sie im folgenden Video.
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Während dieser Übung werden Sie folgenden Schritte ausführen:

1. [Erstelle Zieldatenbank]({{< ref "/Create-target-DB.de.md" >}})

2. [Netzwerk einrichten]({{< ref "/setup_network.de.md" >}})

2. [Replikationsinstanz erstellen]({{< ref "Create-Replication-instance.de.md" >}})

3. [Erstellen Sie Quell- und Zielendpunkte]({{< ref "Create-Source-and-Target-endpoints.de.md" >}})

4. [Konfigurieren Sie die Quelldatenbank]({{< ref "configure_source_database.de.md" >}})

4. [Replikation-Task erstellen und ausführen]({{< ref "Create-and-run-Replication-task.de.md" >}})

5. [Zusammenfassung]({{< ref "Summary.de.md" >}})
