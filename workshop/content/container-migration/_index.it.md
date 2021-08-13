+++
title = "Spostarsi in Containers"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
Questa sezione presuppone che tu abbia già completato le sezioni **1. Database Migration** e **2. Server Migration**.
{{% /notice %}}


#### Overview di Amazon Elastic Container Service (ECS) 

**Amazon Elastic Container Service (Amazon ECS)** è un servizio di orchestrazione di container completamente gestito. Puoi scegliere di eseguire i cluster ECS usando:    

- Tipo di avvio di AWS Fargate, che fornisce funzionalità di calcolo senza server per i containers, oppure   
- Istanze EC2 che gestisci.

In questo laboratorio utilizzerai il tipo di avvio **AWS Fargate** per eseguire l'applicazione senza il fastidio e l'onore di gestione di provisioning, ridimensionamento, gestione e protezione dell'infrastruttura di back-end.

Di seguito, vedi il diagramma che mostra l'architettura generale di Amazon ECS utilizzando il tipo di lancio di AWS Fargate:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Componenti core di Amazon ECS :

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> è un raggruppamento logico di risorse.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> è un file JSON, che descrive uno o più contenitori (fino a un massimo di dieci), che formano l'applicazione. Puoi pensare a un'attività come il modello per la tua applicazione.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> è l'istanza di una definizione di attività all'interno di un cluster. Dopo aver creato una definizione di attività per l'applicazione all'interno di Amazon ECS, è possibile specificare il numero di attività che verranno eseguite sul cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> - Amazon ECS ti consente di eseguire e mantenere contemporaneamente un numero specificato di istanze di una definizione di attività in un cluster. Questo si chiama un servizio. Se una qualsiasi delle tue attività dovesse fallire o interrompersi per qualsiasi motivo, lo scheduler dei servizi Amazon ECS avvia un'altra istanza della definizione delle attività per sostituirla e mantenere il conteggio desiderato delle attività nel servizio a seconda della strategia di pianificazione utilizzata.

Puoi saperne di più su **AWS Fargate** guardando il video qui sotto.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migrazione di una applicazione Web in container:


Per migrare l'applicazione Web in container, eseguirai le seguenti azioni:

1. [Crea gruppi di sicurezza aggiuntivi per il tuo VPC]({{< ref "/create-sg.it.md" >}})

2. [Crea un file system **Amazon EFS** (Elastic File System) ]({{< ref "/create-efs.it.md" >}})

3. [Aggiungi le variabili del database nell'archivio parametri **AWS Systems Manager**]({{< ref "/configure-parameters-store.it.md" >}})

4. [Crea un **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.it.md" >}})

5. [Crea un **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "/create-ecs-cluster.it.md" >}})

6. [Crea un **Amazon ECS Task Definition**]({{< ref "/create-task-definition.it.md" >}})

7. [Crea un **Amazon ECS Service**]({{< ref "/create-service.it.md" >}})
