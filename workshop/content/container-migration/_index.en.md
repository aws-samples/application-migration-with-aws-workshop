+++
title = "Move to Containers"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>3. </b>"
+++

{{% notice info %}}
This section assumes that you have already completed sections **1. Database Migration** and **2. Server Migration**.
{{% /notice %}}


#### Amazon Elastic Container Service (ECS) Overview

Amazon Elastic Container Service (Amazon ECS) is a fully managed container orchestration service. you can choose to run your ECS clusters using AWS Fargate, which is serverless compute for containers. or you can choose to run it on EC2 instances that you manage. In this lab we will use the EC2 type as we will need to mount the Amazon EFS file system for the wordpress content files.

To familiarize your self with the main components of the Amazon ECS, the below diagram shows the general architecture of Amazon ECS using EC2 launch type:

![ecs-ec2type-arch](/ecs/ecs-ec2type-arch.png)

#### Amazon ECS core components:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank">Amazon ECS Cluster</a> is a logical grouping of resources. When using the EC2 launch type, then your clusters are a group of container instances you manage.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_instances.html" target="_blank">Amazon ECS Container Instances</a> is an Amazon EC2 instance that is running the Amazon ECS container agent and has been registered into a cluster. When you run tasks with Amazon ECS using the EC2 launch type, your tasks are placed on your active container instances.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank">Task Definition</a> is a text file, in JSON format, that describes one or more containers, up to a maximum of ten, that form your application. You can think of a task as the blueprint for your application.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank">Task</a> is the instantiation of a task definition within a cluster. After you have created a task definition for your application within Amazon ECS, you can specify the number of tasks that will run on your cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank">Services</a> - Amazon ECS allows you to run and maintain a specified number of instances of a task definition simultaneously in an Amazon ECS cluster. This is called a service. If any of your tasks should fail or stop for any reason, the Amazon ECS service scheduler launches another instance of your task definition to replace it and maintain the desired count of tasks in the service depending on the scheduling strategy used.


#### Migrating the Web application to container:


To migrate the web application to containers, you will perform the following actions:

1. [Create additional security groups for your VPC]({{< ref "/create-sg.en.md" >}})

2. [Create an **Amazon EFS** (Elastic File System) file system]({{< ref "/create-efs.en.md" >}})

3. [Add the database variables into **AWS Systems Manager** Parameters Store]({{< ref "/configure-parameters-store.en.md" >}})

4. [Create an **AWS Elastic Load Balancer**]({{< ref "/create-loadbalancer.en.md" >}})

5. [Create an **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "/create-ecs-cluster.en.md" >}})

6. [Create an **Amazon ECS Task Definition**]({{< ref "/create-task-definition.en.md" >}})

7. [Create an **Amazon ECS Service**]({{< ref "/create-service.en.md" >}})
