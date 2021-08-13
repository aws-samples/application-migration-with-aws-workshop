+++
title = "Re-platform - Containers"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>- </b>"
+++

{{% notice info %}}
This section assumes that you have already completed  **1. Database Migration** and **2.Server Migration -Re-host with CloudEndure** sections.
{{% /notice %}}


#### Amazon Elastic Container Service (ECS) Overview

**Amazon Elastic Container Service (Amazon ECS)** is a fully managed container orchestration service. You can choose to run your ECS clusters using:    

- AWS Fargate launch type, which provides serverless compute capabilities for containers, or   
- EC2 instances that you manage.

In this lab you will use the **AWS Fargate** launch type to run the application without the hassle and undifferentiating heavy lifting of provisioninig, scaling, managing and securing the backend infrastructure.

Please see below for diagram that shows the general architecture of Amazon ECS using the AWS Fargate launch type:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Amazon ECS core components:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> is a logical grouping of resources.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> is a JSON file, that describes one or more containers (up to a maximum of ten), that form your application. You can think of a task as the blueprint for your application.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> is the instantiation of a task definition within a cluster. After you have created a task definition for your application within Amazon ECS, you can specify the number of tasks that will run on your cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> - Amazon ECS allows you to run and maintain a specified number of instances of a task definition simultaneously in a cluster. This is called a service. If any of your tasks should fail or stop for any reason, the Amazon ECS service scheduler launches another instance of your task definition to replace it and maintain the desired count of tasks in the service depending on the scheduling strategy used.

You can learn more about **AWS Fargate** by watching the video below.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migrating the Web application to container:


To migrate the web application to containers, you will perform the following actions:

1. [Create additional security groups for your VPC]({{< ref "/create-sg.en.md" >}})

2. [Create an **Amazon EFS** (Elastic File System) file system]({{< ref "/create-efs.en.md" >}})

3. [Add the database variables into **AWS Systems Manager** Parameters Store]({{< ref "/configure-parameters-store.en.md" >}})

4. [Create an **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.en.md" >}})

5. [Create an **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "/create-ecs-cluster.en.md" >}})

6. [Create an **Amazon ECS Task Definition**]({{< ref "/create-task-definition.en.md" >}})

7. [Create an **Amazon ECS Service**]({{< ref "/create-service.en.md" >}})
