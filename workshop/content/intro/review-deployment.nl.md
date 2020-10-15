
+++
title = "Overzicht"
weight = 30
+++
## Bronomgeving

De onderstaande bronomgeving is opgezet tijdens het voorbereiden van de workshopomgeving:

![source-env](/intro/source-env.png)

De bronomgeving bestaat uit een twee-laagse e-commerce applicatie; een webserver draaiende op Ubuntu met Apache, PHP, Wordpress, WooCommerce en een Database server draaiende op Ubuntu met MySQL versie 5.7.


## Doelomgeving

De onderstaande **Amazon Virtual Private Cloud (VPC)** doelomgeving is opgezet tijdens het voorbereiden van de workshopomgeving:

![target-env](/intro/target-vpc.png)

Het bovenstaande diagram illustreert de VPC in de AWS cloud bestaande uit 6 subnetten (2 public, 2 private voor de webservers en 2 private voor de database) verspreid over 2 availability zones.

Nu kun je verder gaan met het opzetten van [AWS Migration Hub]({{< ref "/migration-hub.nl.md" >}})