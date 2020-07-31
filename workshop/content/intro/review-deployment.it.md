
+++
title = "Rivedere l'ambiente distribuito"
weight = 40
+++
## Ambiente d'origine

Il seguente ambiente d'origine viene distribuito durante la preparazione dell'ambiente.

![source-env](/intro/source-env.png)

L'ambiente d'origine consiste in una applicazione e-commerce a tre livelli; un server web che esegue Ubuntu con Apache, PHP, Wordpress, WooCommerce e un database server che esegue Ubuntu con MySQL versione 5.7.


## Ambiente di destinazione

Il seguente target **Amazon Virtual Private Cloud (VPC)** viene distribuito durante la preparazione dell'ambiente.

![target-env](/intro/target-vpc.png)

La VPC consiste in 6 sottoreti (2 publiche, 2 private per i servers web e 2 private per il database) attraverso due zone di disponibilità.

Ora puoi usare [AWS Migration Hub]({{< ref "/migration-hub.it.md" >}})  
