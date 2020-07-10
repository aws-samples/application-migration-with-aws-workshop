+++
title = "Crea un Servizio Amazon ECS"
weight = 60
+++

Una volta completata **Amazon ECS Task Definition**, sei pronto per creare **Amazon ECS Service**.

Seleziona il **ECS cluster** che hai creato in precedenza, clicca il tab **Services** e quindi il bottone **Create**.

![create-service](/ecs/create-service.png)

### Step 1: Configura il servizio

Nella procedura guidata **Create Service** , seguire la configurazione seguente (assicurarsi di selezionare **FARGATE** in **Launch type**).

- Seleziona il **Task Definition** che hai creato in precedenza  
- Seleziona la **Platform version 1.4.0**                                                                           
- Seleziona il **ECS Cluster** che hai creato in precedenza e inserisci il **Service name** (e.g. unicorns-svc)                                   
- Impostare Number of tasks su 2  
- Lasciare il valore predefinito per i restanti valori e fare clic su **Next Step**


![configure-service](/ecs/configure-service.png)

### Step 2: Configura la network

Nella configurazione della network, seleziona la VPC creata in precedenzxa e specifica la tua  subnets e ECS-Tasks-SG nel security group.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Seleziona l' **Application Load Balancer** nel tipo di load balancer, e scegli il bilanciamento del carico che hai creato in precedenza.

![container-lb](/ecs/container-lb.png)

Clicca su **Add to load balance** per aggiungere al container name:port

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
Nella sezione Service discovery (optional) , **deselezionare**  "Enable service discovery integration" e premere [Next step]

### Step 3: Settare Auto Scaling

Nella configurazione dell'Auto Scaling, selezionare **Configure Service Auto Scaling** e specificare il numero dei task **minimo, desiderato, massimo**.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

In **Automatic task scaling policies**, impostare il tipo di criterio di ridimensionamento su **Target Tracking**, fornire il nome dello scaling policy (e.g. Requests-policy), selezionare il service metric (e.g. ALBRequestCountPerTarget) e settare il Target value (e.g. 300).

{{% notice note %}}
Puoi ripeterlo per diversi parametri di servizio (e.g. CPU e utilizzazione di Memory).
{{% /notice %}}  

### Step 4: Revisione

Infine, rivedi e fai clic su **Create Service** per creare Amazon ECS Service.

Una volta che lo stato del servizio è nello stato **Active** e tutte le attività sono nello stato **Running**, accedere al sito Web di destinazione utilizzando il DNS di bilanciamento del carico.

{{% notice note %}}
Potrebbe anche essere necessario configurare il ridimensionamento automatico per i nodi ECS, consultare [questa guida per maggiori dettagli](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
In caso di problemi, controllare [Amazon ECS Troubleshooting guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
