+++
title = "Create an AWS Elastic Load Balancer"
weight = 35
+++


From **AWS Console**, select **Services**, **EC2** and then **Load Balancers**

Click **Create Load Balancer** button and **Application Load Balancer** as indicated below:

![create-loadbalancer](/ecs/create-lb.png)

In the **1. Configure Load Balancer** step, enter the load balancer **Name** (e.g. unicorn-lb), choose the VPC that you use (e.g TargetVPC) and select your public subnets for at least two subnets (public-a, public-b) as below:

![configure-loadbalancer](/ecs/configure-lb.png)

In the **3. Configure Security Group** settings step, choose the LB-SG security group.

In the **4. Configure Routing** step, select **New target group** in the **Target group** and provide a name for the target group (e.g. unicorn-tg). For the **Target type**, select **IP**, leave the default for the other fields and click **Next: Register Targets**

![configure-routing](/ecs/configure-routing.png)

Leave the default of register targets, click **Next: Review** and then click **Create** to create the load balancer.
