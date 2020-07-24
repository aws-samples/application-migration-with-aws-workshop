+++
title = "Crie um Amazon ECS Service"
weight = 60
+++

Com a **Amazon ECS Task Definition** completa, você está pronto para criar um **Amazon ECS Service**.

Selecione o **ECS cluster** criado anteriormente, clique na aba **Services** e então no botão **Create**.

![create-service](/ecs/create-service.png)

### Step 1: Configure service

No assistente **Create Service**, siga a configuração abaixo (certifique-se de selecionar **FARGATE** no **Launch type**).  

- Selecione a **Task Definition** criada anteriormente  
- Selecione a **Platform version 1.4.0**                                                                           
- Selecione o **ECS Cluster** criado anteriormente e dê um **Service name** (ex. unicorns-svc)                                   
- Configure o Number of tasks como 2  
- Deixe o default para o restante e clique em **Next step**  


![configure-service](/ecs/configure-service.png)

### Step 2: Configure network

Na configuração de rede, selecione a VPC criada anteriormente e especifique as subnets e ECS-Tasks-SG como security group.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Selecione **Application Load Balancer** no load balancer type e escolha o load balancer criado anteriormente.

![container-lb](/ecs/container-lb.png)

Clique em **Add to load balance** para adicionar o container name:port

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
Na seção Service discovery (optional), **desmarque** o "Enable service discovery integration" e pressione Next step

### Step 3: Configure o Auto Scaling

Na configuração do Auto Scaling, selecione **Configure Service Auto Scaling** e especifique o número **mínimo, desejado e máximo** de tasks.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

Em **Automatic task scaling policies**, configure o scaling policy type como **Target Tracking**, dê um nome para a scaling policy (ex. Requests-policy), selecione a service metric (ex. ALBRequestCountPerTarget) e então configure o Target value (e.g. 300).

{{% notice note %}}
Você pode repetir os passos para diferentes service metrics (ex. CPU e Memory utilization).
{{% /notice %}}  

### Step 4: Review

Finalmente, revise as configurações e clique **Create Service**.

Uma vez que o Service status esteja como **Active** e todas as tasks estejam como **Running**, navegue até o web site usando o DNS do loadbalancer.

{{% notice note %}}
Você pode também configurar autoscaling para os nós ECS, cheque [este guia para mais detalhes](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
Caso tenha problemas, cheque [o guia Amazon ECS Troubleshooting](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
