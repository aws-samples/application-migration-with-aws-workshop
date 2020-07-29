
+++
title = "Revisando o ambiente implementado"
weight = 40
+++
## Ambiente Origem

O seguinte ambiente origem é implementado durante a prepação.

![source-env](/intro/source-env.png)

O Ambiente Origem consiste de uma applicação de comércio eletrónico de três camadas; um webserver rodando Ubuntu com Apache, PHP, Wordpress, WooCommerce e um servidor banco de dados rodando Ubuntu com MySQL 5.7.


## Ambiente Destino

A seguinte **Amazon Virtual Private Cloud (VPC)** destino é implementada durante a preparação do ambiente.

![target-env](/intro/target-vpc.png)

A VPC consiste de 6 subnets (2 públicas, 2 privadas para webservers e 2 privadas para banco de dados) cruzando duas zonas de disponibilidade.

Agora você pode habilitar o [AWS Migration Hub]({{< ref "/migration-hub.pt.md" >}})  
