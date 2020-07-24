+++
title = "Creëer een Amazon ECS cluster"
weight = 40
+++

### Activeer awsvpcTrunking

Elke Amazon ECS taak die gebruik maakt van **awsvpc network mode** krijgt een eigen **Elastic Network Interface (ENI)** toegewezen, die aan de **container instance** gekoppeld wordt waarop de taak draait. Er bestaat een standaard limiet hoeveel network interfaces aan een Amazon EC2 machine gekoppeld kunnen worden. Om meer ENI's beschikbaar te hebben voor een **container instance**, dienen we "awsvpcTrunking" te activeren. Voor meer informatie, zie de <a href="https://docs.aws.amazon.com/AmazonECS/latest/developerguide/container-instance-eni.html" target="_blank">Amazon ECS Documentatie</a>




Om **awsvpcTrunking** te activeren, ga naar **Services** in het **AWS console** en selecteer **ECS** en klik dan op **Account Settings**
Onder **Account Settings**, scroll omlaag naar **AWSVPC Trunking** en zet een vinkje aan naast "AWSVPC Trunking".

![awsvpc-trunking](/ecs/awsvpc-trunking.png)

{{% notice note %}}
Wanneer je **awsvpcTrunking** activeert in je account instellingen, zijn extra ENIs beschikbaar voor alle nieuwe **container instances** die vanaf nu gecreëerd worden. Deze configuratie staat het toe om meer taken die **awsvpc network mode** gebruiken te draaien op een **container instance**. Bijvoorbeeld: op een **m5.large instance** met **awsvpcTrunking** kun je nu maximaal 12 ENI's hebben. De **container instance** heeft een primaire netwerk interface en Amazon ECS creëert en verbindt de "trunk" netwerk interface aan de **container instance**. Dus deze configuratie maakt het mogelijk om 10 taken te draaien op een **container instance** in plaats van de standaard hoeveelheid van twee taken.
{{% /notice %}}

### Creëer een Amazon ECS cluster

In het **AWS console**, ga naar **Services**, selecteer **ECS** en klik dan op de **Create Cluster** knop.

Selecteer **EC2 Linux + Networking** als cluster template en klik dan op **Next step**.

![create-cluster](/ecs/create-cluster.png)

In de cluster configuratie sectie, vul een naam in voor de cluster (b.v. unicorns-cluster), selecteer de **EC2 instance type** voor de container instances (b.v. m5a.xlarge), en specificeer het aantal instances (b.v. 2).

![configure-cluster](/ecs/configure-cluster.png)

Onder **Networking** selecteer de VPC (b.v TargetVPC) en alle **private subnets** van de VPC. Selecteer dan de **ECS-SG** security groep in het **Security group** veld. In het **Container instance IAM role** veld, selecteer **ecsInstanceRole**. 

![ecs-networking](/ecs/ecs-networking.png)

Activeer dan **CloudWach container insights** om meer diepgaande meetpunten voor **Amazon CloudWatch**.

![cloudwatch-insights](/ecs/cloudwatch-insights.png)

Tot slot, druk op de **Create** knop om het Amazon ECS cluster aan te maken.