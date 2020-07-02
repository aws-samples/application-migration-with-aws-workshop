+++
title = "Database Migration"
weight = 10
pre = "<b>1. </b>"
+++

In questa sezione, eseguirai una migrazione del database utilizzando il database MySQL di origine su un database Amazon RDS per MySQL di destinazione con **AWS Database Migration Service**. Poiché si tratta di migrazioni di database omogenee (i motori di database di origine e di destinazione sono gli stessi) - la struttura dello schema, i tipi di dati e il codice del database sono compatibili tra i database di origine e di destinazione, il che significa che questo tipo di migrazione non richiede alcun conversione dello schema.

![1](/db-mig/DMS-overview.png)

Puoi ottenere maggiori dettagli su questo servizio guardando il video qui sotto.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In questo laboratorio, eseguirai i seguenti passaggi:

1. [Crea il DB Destinazione]({{< ref "/Create-target-DB.it.md" >}})

2. [Configura il  Networking]({{< ref "/setup_network.it.md" >}})

2. [Crea l'istanza di replica]({{< ref "Create-Replication-instance.it.md" >}})

3. [Crea gli Endopoints di Source e Target]({{< ref "Create-Source-and-Target-endpoints.it.md" >}})

4. [Configura il Database di origine]({{< ref "configure_source_database.it.md" >}})

4. [Crea ed Esegui il Replication Task]({{< ref "Create-and-run-Replication-task.it.md" >}})

5. [Summary]({{< ref "Summary.it.md" >}})
