+++
title = "Stap over op Containers"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
Dit deel gaat er van uit dat je reeds klaar bent met **1. Database Migration** en **2. Server Migration**.
{{% /notice %}}


#### Amazon Elastic Container Service (ECS) Overzicht

Amazon Elastic Container Service (Amazon ECS) is een *fully managed* container orchestratie dienst. Je kunt kiezen om je ECS cluster te draaien via:

- **AWS Fargate**, wat een **serverless compute** optie is voor containers (geen serverbeheer noodzakelijk).
- **EC2 machines** die je zelf beheerd. 

In deze workshop gebruiken we de **AWS Fargate** optie, zodat we zelf geen infrastructuur voor de backend hoeven te configureren, schalen, managen en beveiligen.

Zie onderstaand diagram als overzicht van de belangrijkste componenten van een generieke architectuur voor ECS met de **AWS Fargate** optie:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Amazon ECS belangrijkste componenten:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> is een groepering van resources. 

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> is een tekstbestand, in JSON formaat, dat één of meerdere containers beschrijft (max. 10), die gezamelijk jouw applicatie vormen. Je kunt dit zien als een soort blauwdruk voor jouw applicatie.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> is het product van een **task definition** in een cluster. Nadat je de taak definitie hebt gecreëerd voor jouw applicatie in Amazon ECS, kun je specificeren hoeveel daarop gebaseerde taken je wilt draaien op de cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> - Amazon ECS maakt het mogelijk een gespecificeerde hoeveelheid taken gebaseerd op een taak definitie te draaien op een ECS Cluster. Dit wordt een **service** (dienst) genoemd. Als een taak stopt te functioneren voor welke reden dan ook, zal de **Amazon ECS service scheduler** een nieuwe taak instantiëren gebaseerd op de taak definitie om deze te vervangen. Hierdoor wordt de vereiste hoeveelheid taken als onderdeel van de dienst gewaarborgd.

Je kunt meer leren over **AWS Fargate** via de onderstaande video.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migratie van de Web applicatie naar containers:


Om de web applicatie naar een container setup te migreren voer je nu de volgende stappen uit:

1. [Creëer benodigde security groepen voor jouw VPC]({{< ref "/create-sg.nl.md" >}})

2. [Creëer een **Amazon EFS** (Elastic File System) file systeem]({{< ref "/create-efs.nl.md" >}})

3. [Voeg de database variabelen toe aan de **AWS Systems Manager - Parameters Store**]({{< ref "/configure-parameters-store.nl.md" >}})

4. [Creëer een **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.nl.md" >}})

5. [Creëer een **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "/create-ecs-cluster.nl.md" >}})

6. [Creëer een **Amazon ECS Task Definition**]({{< ref "/create-task-definition.nl.md" >}})

7. [Creëer een **Amazon ECS Service**]({{< ref "/create-service.nl.md" >}})
