+++
title = "Create Target DB"
weight = 15
+++

### Database Migration

Database migrations can be performed in a number of ways, and for the purpose of this workshop we will perform a **continuous data replication** migration using <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

Before you configure **AWS DMS**, you will need to create your target database in the AWS account provided. Use **AWS Relation Database Service (RDS)** to perform this activity making it easy to set up, operate, and scale a relational database in the cloud.

### Create the subnet group for target database

1. Go to the **AWS Console**, from **Services** choose **RDS**, select **Subnet groups** from the menu on the left and click **Create DB Subnet Group**

2. On the **Create DB subnet group** enter the following information

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets where RDS will be deployed |
    | VPC      | TargetVPC            |

    In the **Add subnets** panel add one subnet from each Availability Zone (us-west-2a and us-west-2b) with CIDRs 10.0.101.0/24 and 10.0.201.0/24, then press **Create** button.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Create the target database    

1. Now select **Databases** from the menu on the left and click **Create database**

2. From the **Engine options**, select MySQL and Version MySQL 5.7.33

    ![1](/db-mig/1.png)


    {{% notice note %}}
You can confirm the source MySQL version from the source database using SQL query - **SELECT@@version;**
{{% /notice %}}


    In the **Template** section select "Free Tier".

    ![Free tier template selection](/db-mig/create-db-select-template.en.png)

    {{% notice note %}}
Chosing of "Free Tier" template limits your options in the next steps of the wizard, so that you stay within the limits of AWS Free Tier.
{{% /notice %}}


    In the **Settings** section, configure the DB instance identifier (e.g. database-1), Master username (e.g. admin) and Master password for your new database instance.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Make sure to write down **Master username** and **Master password**, as you will use it later.
{{% /notice %}}

    Select **db.t2.micro** from the Burstable DB instance class,  **General Purpose (SSD)** for Storage Type and uncheck "Enable storage autoscaling" (we dont need more than 20 GB of storage for this database).
    ![4_db](/db-mig/4_db.png)



1. For the **Availability & durability**, keep the **Do not create a standby instance** option selected.

    ![5_db](/db-mig/5_db.png)

    {{% notice note %}}
For production workloads, we recommend enabling the standby instance to enable <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">Multi-AZ Deployment</a> for higher availability.
{{% /notice %}}  

4. In the **Connectivity** section:

    * In **Virtual Private Cloud (VPC)**, select **TargetVPC** (this is the <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> that was automatically created for this lab)
    * In **Additional connectivity configuration -> VPC Security Group**, select **Existing VPC Security Groups** (use "DB-SG").
    * Note that the DB Subnet group you have created earlier will be automatically selected

    ![6_db](/db-mig/6_db.png)

5. For the **Database authentication**, choose **Password authentication**.

6. (AWS hosted events only) In the **Additional configuration**, make sure to uncheck **Enable Enhanced monitoring** under the **Monitoring** section as indicated below:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Using <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">Enhanced monitoring</a> is a very good idea for production workloads, during AWS hosted events we uncheck it because of limitations of IAM Role that was provisioned for attendees.
{{% /notice %}}

6. Finally, review the **Estimated monthly costs** and click the **Create database** button.

   ![8_2_db](/db-mig/8_2_db.png)
