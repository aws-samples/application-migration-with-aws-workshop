+++
title = "Create an Amazon ECS Service"
weight = 60
+++

Once you completed the **Amazon ECS Task Definition**, you are ready to create an **Amazon ECS Service**.

Select the **ECS cluster** that you created earlier, click the **Services** tab and then **Create** button.

![create-service](/ecs/create-service.png)

### Step 1: Configure service

In the **Create Service** wizard, follow the below configuration (make sure you select **FARGATE** in the **Launch type**).  

- Select the **Task Definition** that you created earlier  
- Select the **Platform version 1.4.0**                                                                           
- Select the **ECS Cluster** that you created earlier and enter the **Service name** (e.g. unicorns-svc)                                   
- Set Number of tasks to 2  
- Leave the default for the remaining and click **Next step**  


![configure-service](/ecs/configure-service.png)

### Step 2: Configure network

In the network configuration, select the VPC that you created earlier and specify your subnets and ECS-Tasks-SG in the security group.

![configure-network-svc](/ecs/configure-network-svc.png)


![svc-lb](/ecs/svc-lb.png)

Select **Application Load Balancer** in the load balancer type, and choose the load balancer that you created earlier.

![container-lb](/ecs/container-lb.png)

Click **Add to load balance** to add the container name:port

![container-lb-details](/ecs/container-lb-details.png)


![service-discovery](/ecs/service-discovery.png)
In the Service discovery (optional) section, **uncheck** the "Enable service discovery integration" and press [Next step]

### Step 3: Set Auto Scaling

In Auto Scaling configuration, select **Configure Service Auto Scaling** and specify the **minimum, desired, maximum** number of tasks.

![svc-autoscaling](/ecs/svc-autoscaling.png)
![svc-autoscaling-policy](/ecs/svc-autoscaling-policy.png)

In the **Automatic task scaling policies**, set the scaling policy type to **Target Tracking**, provide name of the scaling policy (e.g. Requests-policy), select the service metric (e.g. ALBRequestCountPerTarget) and then set the Target value (e.g. 300).

{{% notice note %}}
You can repeat that for different service metric (e.g. CPU and Memory utilization).
{{% /notice %}}  

### Step 4: Review

Finally, Review and click **Create Service** to create the Amazon ECS Service.

Once the Service status is in **Active** state and all the tasks are in the **Running** state, browse to the target web site using the loadbalancer DNS.

{{% notice note %}}
You might also need to configure autoscaling for the ECS nodes, check the [this guide for more details](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch_alarm_autoscaling.html)
{{% /notice %}}  


{{% notice tip %}}
In case you encounter any issues, Please check [Amazon ECS Troubleshooting guide](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/troubleshooting.html)
{{% /notice %}}
