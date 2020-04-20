+++
title = "Set Up Networking"
weight = 15
+++

Since we don't use a **VPN** or **AWS Direct Connect** in this workshop, **DMS Replication Instance** will need to connect to the source database over public internet, while to the target database over private network.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Create replication subnet group

One of the pre-requisites for using of **AWS DMS** is having configured a **subnet group**, which is a collection of subnets that will be used by the **DMS Replication Instance**. 

1. Go to **AWS Console > Services > Database Migration Service > Subnet groups** and click on **Create subnet group** button.
2. In the **Create replication subnet group** enter the following parameter values:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | dms-subnet-group     |
    | Description         | Default VPC Subnet Group for DMS |
    | VPC                 | TargetVPC   |
    | Add subnets         | select **TargetVPC-public-a**, **TargetVPC-public-b** |

    ![Replication-instance-networ](/db-mig/subnet-group.png)

3. Click on the **Create subnet group** button

### Configure the security group

**VPC security group** in this workshop must allow inbound traffic from the **DMS Replication Instance** to the target RDS database.

1. Create a security group for the **DMS Replication Instance**

    a. Go to **AWS Console > Services > EC2 > Security Groups** and click the **Create Security Group** button.

    b. Enter **Security group name** (for example RI-SG), give it a **Description**, select the **TargetVPC** for the VPC field and press **Create security group** button.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  There is no need to add any inbound rules to the **DMS Replication Instance** security group **RI-SG**
  {{% /notice %}}

2. Add Inbound rule to **DB-SG** security group

    a. Go again to **AWS Console > Services > EC2 > Security Groups** screen click on the **Security Group ID** of Database Security Group **DB-SG** created earlier 
    
    b. On the details of the **DB-SG** security group screen, press the **Edit inbound rules** button
      
    c. On the **Edit inbound rules** screen press the **Add rule** button and configure the rule to allow **inbound** traffic from the **DMS Replication Instance** security group on port 3306 and press **Save rules** button
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
