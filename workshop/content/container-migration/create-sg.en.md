+++
title = "Create additional security groups"
weight = 10
+++


### Create security groups for your VPC

From **AWS Console**, go to **Services** and select **VPC**. In the left panel, click on the **Security Groups** under Security section and then **Create security group**.

### 1. Create Load balancer security group

Enter the following parameters for the **Security group** 


| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | TargetVPC  |

![create-lb-sg](/ecs/create-lb-sg.png)

Scroll down and in the **Inbound rules** section add HTTP, and HTTPS access from **Anywhere** to allow users to access the website.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)

Click on the **Create security group** button to create the security group.

#### 2. Create Elastic Container Service Task security group

Go to **Security Groups** screen, click on **Create security group** and enter the following values.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| TargetVPC  |

Scroll down to **Inbound rules** and allow communication between the Load Balancer and ECS Tasks (select the LB-SG security group from the **Source** drop-down).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |

![edit-task-sg](/ecs/edit-task-sg.png)

Click on the **Create security group** button to create the security group.

#### 3. Create Elastic File System security group

Go to **Security Groups** screen, click on **Create security group** and enter the following values.

| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| EFS-SG                 | Allow communication between ECS Tasks and EFS       | TargetVPC  |

Scroll down to **Inbound rules** section and allow communication between ECS Tasks and Amazon EFS. Webserver access to the EFS is enabled temporarily, to be able to mount the EFS volume and copy web application static files (you will revoke it later).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

Click on the **Create security group** button to create the security group.

### 4. Modify the existing database security groups

Go to the **Security Groups** screen and modify the database security group (DB-SG) to allow inbound TCP traffic on port 3306 (MySQL port) from ECS-Tasks-SG to the target database (you should have already inboud rules for Webserver and Replication instance there),

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)