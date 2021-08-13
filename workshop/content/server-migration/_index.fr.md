+++
title = "Rehost avec CloudEndure"
date = 2019-10-22T20:48:41+02:00
weight = 25
pre = "<b>- </b>"
+++

#### Overview de CloudEndure Migration

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> permet aux organisations de migrer les environnements les plus complexes vers Amazon Web Services (AWS) sans interruption de service ou perte de données. S'appuyant sur un mécanisme de réplication au niveau bloc, une conversion automatique des serveurs et une orchestration de la migration applicative, **CloudEndure Migration** simplifie le procesus de migration et réduit le risque d'erreurs humaines.

Que vous migriez à partir d'AWS ou d'une autre source vers AWS, **CloudEndure Migration** vous apporte la flexibilité dont vous avez besoin et exécute les contôles de sécurité qui sont nécessaires pour réussir dans un écosystème digital en rapide évolution.

![cloudendure-intro](/ce/ce-home.png)

**Les bénéfices de CloudEndure Live Migration incluent :**

- Une fenêtre d'interruption de service de quelques minutes et pas de perte de données
- Une intégrité des données à 100% pour toutes les applications (incluant les bases de données et les applications "legacy")
- Des migration à grande échelle sans impact sur les perforamnces
- Un support très large de plates-formes et de systèmes d'exploitation source
- Des migrations automatisées pour minimiser les ressources IT et la durée des projets

{{% notice note %}}
**CloudEndure Migration** est disponible **gratuitement**  pour toutes les migrations vers AWS.  
Aller sur la page <a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">CloudEndure Migration Registration</a> pour créer un compte et démarrer les migrations vers AWS en quelques minutes !
{{% /notice %}}  

Vous pouver en apprendre plus sur **CloudEndure Migration** en regardant la video ci-dessous.
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

Dans ce lab vous allez effectuer un "re-hosting" du serveur web en déroulant les étapes suivantes:  
1. [Configuration de CloudEndure]({{< ref "/CE-Configuration.fr.md" >}})  
2. [Installation de(s) l'Agent(s) sur le(s) machine(s) source]({{< ref "/CE-Agent-Installation.fr.md" >}})  
3. [Préparation du Blueprint]({{< ref "/CE-Blueprints.fr.md" >}})  
4. [Exécution du "Cutover"]({{< ref "/CE-Cutover.fr.md" >}})  
5. [Configuration de l'Application]({{< ref "/CE-Webserver-config.fr.md" >}})  
