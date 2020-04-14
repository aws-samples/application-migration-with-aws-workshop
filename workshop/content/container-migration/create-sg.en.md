+++
title = "Create additional security groups"
weight = 10
+++


### Create security groups for your VPC

From **AWS Console**, go to **Services** and select **VPC**. In the left panel, click on the **Security Groups** under Security section and then **Create security group**.

Enter the following parameters for the **Security group** (repeat steps to create all 4 security groups, as per the below table).


| Security group name    | Description      								   | VPC            |
| ---------------------- | ---------------- |----------------------------------|
| LB-SG                  | Load balancer security group            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-SG                 | Allow SSH communication to the ECS nodes            | Your VPC that you created earlier (e.g. TargetVPC)  |
| ECS-Tasks-SG           | Allow communication between the LB and the ECS Tasks| Your VPC that you created earlier (e.g. TargetVPC)  |
| EFS-SG                 | Allow communication between ECS tasks and EFS       | Your VPC that you created earlier (e.g. TargetVPC)  |

![create-lb-sg](/ecs/create-lb-sg.png)





### Edit and configure the security groups

Once you created security groups, select one by one and click **Inbound Rules** and then **Edit rules**. You will add rules for each of the security groups as following:

#### 1. LB-SG Inbound rules

Add HTTP, and HTTPS access from anywhere to allow users to access the website.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| HTTP                | TCP            | Anywhere   |
| HTTPS               | TCP            | Anywhere   |

![edit-lb-sg](/ecs/edit-lb-sg.png)


#### 2. ECS-Tasks-SG Inbound rules

Allow communication between the Load Balancer and ECS Tasks.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| All TCP                | TCP            | Custom > LB-SG   |


![edit-task-sg](/ecs/edit-task-sg.png)

#### 3. EFS-SG Inbound rules

Allow communication between ECS Tasks and Amazon EFS. Webserver access to the EFS is enabled temporarily only, to be able to mount the EFS volume and copy web application static files (you will remove it later).

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| NFS                | TCP            | Custom > ECS-Tasks-SG  |
| NFS                | TCP    | Custom > WebServer SG  |

![edit-efs-sg](/ecs/edit-efs-sg.png)

### Modify the database security groups

Modify the database security group (DB-SG) to allow inbound TCP port 3306 (MySQL port) from ECS-Tasks-SG and ECS-SG – to allow communication between ECS Tasks and the target database.

| Type    | Protocol      								   | Source            |
| ---------------------- | ---------------- |----------------|
| MySQL                | TCP            | Custom > ECS-Tasks-SG   |


![update-db-sg](/ecs/update-db-sg.png)
