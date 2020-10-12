+++
title = "Set Up Networking"
weight = 10
+++

Since we don't use a **VPN** or **AWS Direct Connect** in this workshop, **DMS Replication Instance** will need to connect to the source database over public internet, while to the target database over private network.

![Replication Instance Architecture](/db-mig/ri-network-conf.png)

### Configure the security group

**VPC security group** in this workshop must allow inbound traffic from the **DMS Replication Instance** to the target RDS database.

1. Create a security group for the **DMS Replication Instance**

    a. Go to **AWS Console > Services > EC2 > Security Groups** and click the **Create Security Group** button.

    b. Enter **Security group name** (for example RI-SG), give it a **Description**, select the **TargetVPC** for the VPC field and press **Create security group** button.

    ![Replication-instance-networ](/db-mig/ri-sg.png)

    {{% notice note %}}
  There is no need to add any inbound rules to the **DMS Replication Instance** security group **RI-SG**
  {{% /notice %}}

2. Create a security group for the **Target Database**

    a. Go to **AWS Console > Services > EC2 > Security Groups** and click the **Create Security Group** button.

    b. Enter **Security group name** (for example DB-SG), give it a **Description**, select the **TargetVPC** for the VPC field and press **Create security group** button.

    c. On the **inbound rules** section press the **Add rule** button and configure the rule to allow **inbound** traffic from the **DMS Replication Instance** security group (ex. RI-SG) on port 3306 and press **Save rules** button
    ![Adding inbound rule for reserved instance](/db-mig/security-group-inbound-rule.en.png)
