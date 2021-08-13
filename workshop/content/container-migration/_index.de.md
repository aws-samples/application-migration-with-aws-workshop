+++
title = "Implementieren Sie Container"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
In diesem Abschnitt wird davon ausgegangen, dass Sie die Schritte **1. Database Migration** and **2. Server Migration** bereits abgeschlossen haben. 
{{% /notice %}}


#### Übersicht über den Amazon Elastic Container Service (ECS)

**Amazon Elastic Container Service (Amazon ECS)** ist ein vollständig verwalteter Container-Orchestrierungsdienst. 
Sie können Ihre ECS-Cluster folgendermaßen ausführen: 

- als eine AWS Fargate Variante, die als Serverless-Platform für die Container zu sehen ist,   
- oder auf EC2 Instanzen die Sie verwalten.

In diesem Lab verwenden Sie die **AWS Fargate** Variante, um den IT-Betrieb-Aufwand, Skalierung, Verwaltung 
und Sicherung-Herausforderungen der Backend-Infrastruktur zu minimieren.

Das folgende Diagramm zeigt die allgemeine Architektur von Amazon ECS unter Verwendung des AWS Fargate Starttyps:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Amazon ECS haupt Komponenten:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> ist eine logische Gruppierung von Ressourcen.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> ist eine JSON-Datei, 
die einen oder mehrere Container (bis zu maximal zehn) beschreibt, die Ihre Anwendung bilden. 
Sie können sich ein Task als eine Vorlage/Blueprint für Ihre Anwendung vorstellen.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> ist die Instanziierung 
einer Task-Definition innerhalb eines Clusters. Nachdem Sie in Amazon ECS eine Task-Definition für Ihre Anwendung 
erstellt haben, können Sie die Anzahl der Aufgaben angeben, die in Ihrem Cluster ausgeführt werden.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> 
- mit Amazon ECS können Sie eine bestimmte Anzahl von Instanzen einer Task-Definition gleichzeitig 
in einem Cluster ausführen und verwalten. Dies wird als ein Dienst (service) bezeichnet. 
Sollte eine Ihrer Tasks aus irgendeinem Grund fehlschlagen oder anhalten, startet der Amazon ECS-Dienstplaner (scheduler) 
eine andere Instanz Ihrer Aufgabendefinition, um sie zu ersetzen und die gewünschte Anzahl von Aufgaben 
im Dienst (service) abhängig von der verwendeten Planungsstrategie (scheduling strategy) beizubehalten.

Weitere Informationnen zu **AWS Fargate** finden Sie im folgenden Video.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migrieren der Webanwendung in einen Container:


Um die Webanwendung in Container zu migrieren, führen Sie die folgenden Schritte aus:

1. [Erstellen Sie zusätzliche Sicherheitsgruppen für Ihre VPC]({{< ref "/create-sg.de.md" >}})

2. [Erstellen Sie ein Elastic File System]({{< ref "/create-efs.de.md" >}})

3. [Konfigurieren Sie den **Parameters Store**]({{< ref "/configure-parameters-store.de.md" >}})

4. [Erstellen Sie einen **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.de.md" >}})

5. [Erstellen Sie einen **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "/create-ecs-cluster.de.md" >}})

6. [Erstellen Sie eine **Amazon ECS Task Definition**]({{< ref "/create-task-definition.de.md" >}})

7. [Erstellen Sie einen **Amazon ECS Service**]({{< ref "/create-service.de.md" >}})
