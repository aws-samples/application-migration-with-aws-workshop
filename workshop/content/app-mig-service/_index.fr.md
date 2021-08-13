+++
title = "Rehost avec AWS Application Migration Service"
weight = 22
pre = "<b>- </b>"
+++

#### Présentation d'AWS Application Migration Service

<a href="https://aws.amazon.com/fr/application-migration-service/" target="_blank" rel="noopener noreferrer"> AWS Application Migration Service</a> vous permet de profiter rapidement des avantages de la migration d'applications vers le cloud sans entraîner de changements et avec un temps d'interruption minimal.

**AWS Application Migration Service** limite les processus manuels chronophages et sujets à des erreurs en convertissant automatiquement vos serveurs sources issus d'une infrastructure physique, virtuelle ou cloud afin qu'ils s'exécutent de manière native sur AWS. Le service simplifie encore davantage la migration en vous permettant d'utiliser le même processus automatique pour une large gamme d'applications.

![Application Migration Service - Fonctionnement](/app_mig_serv/how-it-works.en.jpg)

**Les avantages d'AWS Application Migration Service incluent:**

- Accès aux technologies avancées
- Temps d'interruption minime pendant la migration
- Réduction des coûts

{{% notice note %}}
**AWS Application Migration Service** est disponible **gratuitement** pour toute migration vers AWS pendant 90 jours (soit 2160 heures). Pour tout dépassement de cette limite, les heures de réplication supplémentaires seront tarifées.
{{% /notice %}}  

Vous pouvez en apprendre plus sur **AWS Application Migration Service** en regardant la video ci-dessous.
<center><iframe width="560" height="315" src="https://www.youtube.com/embed/ao8geVzmmRo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Dans ce lab, vous allez effectuer un "re-hosting" (réhébergement) du serveur web en déroulant les étapes suivantes:
1. [Configuration d'AWS Application Migration Service]({{< ref "/setup.fr.md" >}})  
2. [Installation de l'agent sur la machine source]({{< ref "/install_agent.fr.md" >}})  
3. [Configuration détaillée de la réplication]({{< ref "/server_details.fr.md" >}})  
4. [Lancement du test de réplication]({{< ref "/test.fr.md" >}})  
5. [Lancement du cutover]({{< ref "/launch.fr.md" >}})  
6. [Configuration de l'application]({{< ref "/webserver_config.fr.md">}})
