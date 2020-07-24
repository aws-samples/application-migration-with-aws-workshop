
+++
title = "Revue de l'environnement déployé"
weight = 40
+++
## Environnement Source

L'environnement source suivant est déployé durant la phase de préparation.

![source-env](/intro/source-env.png)

L'environnement source est une application e-commerce en architecture trois tiers; un serveur web sous Ubuntu avec Apache, PHP, Wordpress, WooCommerce et un serveur de base de données sous Ubuntu avec MySQL version 5.7.


## Environnement cible

L'environnement cible suivant **Amazon Virtual Private Cloud (VPC)** est déployé durant la phase de préparation de l'environnement.

![target-env](/intro/target-vpc.png)

Le VPC est composé de 6 sous-réseaux (2 publiques, 2 privés pour les serveurs web et 2 privés pour la base de données) répartis sur 2 zones de disponibilité.

Maintenant vous pouvez activer [AWS Migration Hub]({{< ref "/migration-hub.fr.md" >}})  
