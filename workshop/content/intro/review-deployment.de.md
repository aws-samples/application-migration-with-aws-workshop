
+++
title = "Umgebung überprüfen"
weight = 40
+++
## Quellumgebung

Die folgende Quellumgebung wird während der Umgebungsvorbereitung bereitgestellt.

![source-env](/intro/source-env.png)

Die Quellumgebung besteht aus einer dreistufigen E-Commerce-Anwendung. 
Ein Ubuntu-Linux Webserver, auf dem Apache mit PHP, Wordpress, WooCommerce ausgeführt wird
und ein Datenbankserver unter Ubuntu mit MySQL Version 5.7.

## Zielumgebung

Das folgende Zielnetzwerk **Amazon Virtual Private Cloud (VPC)** wird während 
der Umgebungsvorbereitung bereitgestellt.

![target-env](/intro/target-vpc.png)

Die Netzwerkumgebung (VPC) besteht aus 6 Subnetzen (2 öffentliche, 2 private 
für den Webserver und 2 private für Datenbanken) in zwei Verfügbarkeitszonen (AD's).

Jetzt können Sie [AWS Migration Hub]({{< ref "/migration-hub.de.md" >}}) aktivieren.  
