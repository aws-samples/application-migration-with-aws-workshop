+++
title = "Mova para Containers"
date = 2019-10-22T20:48:41+02:00
weight = 30
pre = "<b>3. </b>"
+++

{{% notice info %}}
Esta seção assume que você já completou as seções **1. Migração de Banco de Dados** e **2. Migração do Servidor**.
{{% /notice %}}


#### Visão geral do Amazon Elastic Container Service (ECS)

O **Amazon Elastic Container Service (Amazon ECS)** é um serviço totalmente gerenciado de orquestração de containers. Você pode escolher rodar seus ECS clusters usando:    

- AWS Fargate, que provê capacidades computacionais serverless para containers, ou   
- Instâncias EC2 gerenciadas por você.

Neste lab você usará o **AWS Fargate** para rodar a aplicação sem complicações e sem ter de provisionar, escalar, gerenciar e manter segura sua infraestructure de retaguarda.

Veja o diagrama abaixo que mostra a arquitetura geral do Amazon ECS usando AWS Fargate:

![ecs-ec2type-arch](/ecs/overview-fargate.png)

#### Principais componentes do Amazon ECS:

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/clusters.html" target="_blank" rel="noopener noreferrer">Amazon ECS Cluster</a> é um agrupamento lógico de recursos.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html" target="_blank" rel="noopener noreferrer">Task Definition</a> é um arquivo JSON, que descreve um ou mais containers (até o máximo de dez), que compõem sua aplicação. Você pode pensar numa task como a planta baixa da sua aplicação.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/scheduling_tasks.html" target="_blank" rel="noopener noreferrer">Task</a> é uma instancialização de uma task definition em um cluster. Após criar uma task definition para sua aplicação dentro do Amazon ECS, você pode especificar o númbero de tasks quer rodarão no cluster.

<a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs_services.html" target="_blank" rel="noopener noreferrer">Services</a> - o Amazon ECS permite que você rode e  mantenha um número específico de instâncias de uma task definition simultaneamente no cluster. Isto é chamado de service. Caso alguma de suas tasks falhem ou parem por qualquer razão, o agendadador de serviços do Amazon ECS lança outra instância da sua task definition para substituí-la e mantem a contagem desejada de tasks dependendo da estratégia de agendamento usada.

Você pode conhecer mais sobre o **AWS Fargate** vendo o vídeo abaixo.
<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/IEvLkwdFgnU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

#### Migrando a aplicação Web para container:


Para migrar a aplicação web para containers, você executará as seguintes ações:

1. [Criar security groups adicionais para sua VPC]({{< ref "create-sg.pt.md" >}})

2. [Criar um **Amazon EFS** (Elastic File System) file system]({{< ref "create-efs.pt.md" >}})

3. [Adicionar variáveis do banco de dados no **AWS Systems Manager** Parameters Store]({{< ref "configure-parameters-store.pt.md" >}})

4. [Criar um **AWS Elastic Load Balancer**]({{< ref "create-loadbalancer.pt.md" >}})

5. [Criar um **Amazon ECS (Elastic Container Service)** Cluster]({{< ref "create-ecs-cluster.pt.md" >}})

6. [Criar um **Amazon ECS Task Definition**]({{< ref "create-task-definition.pt.md" >}})

7. [Criar um **Amazon ECS Service**]({{< ref "create-service.pt.md" >}})
