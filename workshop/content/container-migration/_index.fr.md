+++
title = "Replatform vers des Containers"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>- </b>"
+++

{{% notice info %}}
Pour l'exécution de cette section nous considérons que vous avez terminé les sections **1. Migration Base de données** and **2. Migration Serveurs**.
{{% /notice %}}


#### Présentation de Amazon Elastic Container Service (ECS) :

**Amazon Elastic Container Service (Amazon ECS)** est un système d'orchestration de containers totalement "géré". Vous pouvez choisir d'exécuter votre Cluster ECS en utilisant :   
            
- AWS Fargate qui fournit des capacités de calcul "serverless" pour les containers, ou  
- des instances EC2 que vous gérez. 
  
Dans ce lab, vous allez utiliser **AWS Fargate** pour exécuter l'application sans avoir à provisionner, mettre à l'échelle, gérer et sécuriser la plateforme technique. 

Merci de regarder ci-dessous le diagramme qui présente l'architecture générale de Amazon ECS utilisant AWS Fargate :

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### composants de base de Amazon ECS :

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> est un regroupement logique de ressources. 

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> est un fichier JSON qui décrit un ou plusieurs containers (jusqu'à dix), qui forment l'applications. Vous pouvez considérer la "task" comme la définition de votre applications.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> est l'instanciation de la "task definition" au sein du cluster. Après avoir créé une "task definition" pour votre application dans Amazon ECS, vous pouvez définir le nombre de "tasks" qui seront exécutées sur le cluster. 

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> - Amazon ECS vous permet d'exécuter un nombre défini d'instances de "task definition" simultanément dans le cluster grâce à la fonction service. Si l'une de vos tâches échoue ou s'arrête pour quelque raison que ce soit, le "service scheduler" de Amazon ECS lance une nouvelle instance de votre "task definition" pour la remplacer et maintenir le nombre voulu de tâches. 

Vous pouver en apprendre plus sur **AWS Fargate** en regardant la video ci-dessous.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center> 

#### Migrer l'application web vers des containers :


Pour migrer l'application web dans des containers, vous allez réaliser les actions suivantes :

1. [Création des "security groups" supplémentaires pour votre VPC]({{< ref "/create-sg.fr.md" >}})

2. [Création d'un File System **Amazon EFS** (Elastic File System)]({{< ref "/create-efs.fr.md" >}})

3. [Ajout des variables base de données dans **AWS Systems Manager** Parameters Store]({{< ref "/configure-parameters-store.fr.md" >}})

4. [Création d'un **Elastic Load Balancer AWS**]({{< ref "/create-loadbalancer.fr.md" >}})

5. [Création d'un cluster **Amazon ECS (Elastic Container Service)**]({{< ref "/create-ecs-cluster.fr.md" >}})

6. [Création d'une **"Task Definition" Amazon ECS**]({{< ref "/create-task-definition.fr.md" >}})

7. [Création d'un **Service Amazon ECS**]({{< ref "/create-service.fr.md" >}})
