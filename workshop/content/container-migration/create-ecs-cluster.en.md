+++
title = "Create an Amazon ECS cluster"
weight = 40
+++

### Enable awsvpcTrunking

Each Amazon ECS task that uses the awsvpc network mode receives its own ENI, which is attached to the container instance that hosts it. There is a default limit to the number of network interfaces that can be attached to an Amazon EC2 instance. to make more ENIs available for the container instance, we need to enable the "awsvpcTrunking".

To enable **awsvpcTrunking** , go to Services From AWS console and select ECS then click on **Account Settings**
In the Account Settings, scroll down to **AWSVPC Trunking** and check the box for "AWSVPC Trunking" resource.

![awsvpc-trunking](/ecs/awsvpc-trunking.png)

{{% notice note %}}
When you enable **awsvpcTrunking** in the account setting, additional ENIs are available on newly launched container instances. This configuration allows you to place more tasks using the awsvpc network mode on each container instance. Using this feature, an m5.large instance with awsvpcTrunking enabled has an increased ENI limit of twelve. The container instance will have the primary network interface and Amazon ECS creates and attaches a "trunk" network interface to the container instance. So this configuration allows you to launch ten tasks on the container instance instead of the current two tasks.
{{% /notice %}}

### Create Amazon ECS cluster

From **AWS console**, go to **Services**, select **ECS** and then click **Create Cluster** button.

Select **EC2 Linux + Networking** for cluster template and click **Next step**.

![create-cluster](/ecs/create-cluster.png)

In cluster configuration section, provide a name of the cluster (e.g. unicorns-cluster), select the EC2 instance type for the container instances (e.g. m5a.xlarge), and specify the number of instances (e.g. 2).

![configure-cluster](/ecs/configure-cluster.png)

In the **Networking** section select the VPC you use (e.g TargetVPC) and all private subnets you have in it. Then select the **ECS-SG** security group in the **Security group** field. In **Container instance IAM role** field, select **ecsInstanceRole**. 

![ecs-networking](/ecs/ecs-networking.png)

Then enable the **CloudWach container insights** for more in-depth metrics provided through **Amazon CloudWatch**.

![cloudwatch-insights](/ecs/cloudwatch-insights.png)

Finally press the **Create** button to create the Amazon ECS cluster.