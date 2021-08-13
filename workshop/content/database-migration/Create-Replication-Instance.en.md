+++
title = "Create Replication Instance"
weight = 20
+++

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

### Create AWS DMS Replication Instance

In this step you will create an <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migration Service</a> Replication Instance that initiates the connection between the source and target databases, transfers the data, and caches any changes that occur on the source database during the initial data load.


1. Inside **AWS Console**, go to **Services** and **Database Migration Service**.  

2. Click on **Replication instances** and then on the **Create replication instance** button.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. On the **Create replication instance** screen configure a new replication instance with the following parameter values:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Like on the screenshot below.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    In the **Advanced security and network configuration**, make sure to select the replication subnet group, Availability zone (us-west-2a) and the replication instance security group that you created earlier.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Click **Create** button.

{{% notice note %}}
If you get an error saying "SYSTEM ERROR MESSAGE:Cannot create a dms.t2.medium replication instance", create the DMS replication instance again but select **us-west-2b** **Availability Zone** and if this doesn't help - select larger **instance class**.
{{% /notice %}}  
