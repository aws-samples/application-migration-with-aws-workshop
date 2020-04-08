+++
title = "Create Replication Instance"
weight = 20
+++

### Create AWS DMS Replication Instance

In this step you will create an <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migration Service</a> Replication Instance that initiates the connection between the source and target databases, transfers the data, and caches any changes that occur on the source database during the initial data load.


1. Inside **AWS Console**, go to **Services** and **Database Migration Service**.  

2. Click on **Replication instances** and then on the **Create replication instance** button.

    ![Replication-instance-create](/db-mig/Replication-instance-create.png)

3. On the **Create replication instance** screen configure a new replication instance with the following parameter values:

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | replication-instance     |
    | Description         | DMS replication instance |
    | Instance Class      | dms.t2.medium            |
    | Engine version      | 3.3.1                    |
    |Allocated storage (GB)| 50                      |
    | VPC                 | TargetVPC            |
    | Multi-AZ            | Unchecked                |
    | Publicly accessible | Checked                  |

    Like on the screenshot below.


    ![replication-instance-conf](/db-mig/replication-instance-conf.png)


    In the **Advanced security and network configuration**, make sure to select the replication subnet group & the replication instance security group that you created earlier.

    ![Replication-instance-conf](/db-mig/advanced-security.png)



4. Click **Create** button.

    {{% notice note %}}
Creation of replication instance takes few minutes, please wait until the **Status** changes to **Available** before going to the next steps. In the meantime you can check different use cases for AWS DMS described at the <a href="https://aws.amazon.com/dms/" target="_blank">AWS DMS Webpage</a>
{{% /notice %}}
