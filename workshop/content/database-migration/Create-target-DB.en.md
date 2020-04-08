+++
title = "Create Target DB"
weight = 10
+++

### Database Migration

Database migrations can be performed in a number of ways, and for the purpose of this workshop we will perform a **continuous data replication** migration using <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migrations Service (DMS)</a>.

### Create the target database

Before you configure **AWS DMS**, you will need to create your target database in the AWS account provided. Use **AWS Relation Database Service (RDS)** to perform this activity making it easy to set up, operate, and scale a relational database in the cloud.

1. Go to the **AWS Console**, from **Services** choose **RDS** and then click **Create database**

2. From the **Engine options**, select MySQL and Version MySQL 5.7.22

    ![1](/db-mig/1.png)


    {{% notice note %}}
You can retrieve the information about the source MySQL version from the source database using SQL query - **SELECT@@version;**
{{% /notice %}}

    In the **Settings** section, configure the DB instance identifier (e.g. database-1), Master username (e.g. admin) and Master password for your new database instance.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Make sure to write down **Master username** and **Master password**, as you will use it later.
{{% /notice %}}

    Select **db.t3.medium** from the standard DB instance class and leave the default values for Storage parameters.
    ![4_db](/db-mig/4_db.png)

3. For the **Availability & durability**, leave the default value to create a standby instance (it's always safer to have a multi-AZ deployment).

    ![5_db](/db-mig/5_db.png)

4. In the **Connectivity** section:

    * In **Virtual Private Cloud (VPC)**, select **TargetVPC** (this is the <a href="https://aws.amazon.com/vpc/" target="_blank">Amazon Virtual Private Cloud</a> that was automatically created for this lab)
    * In **Additional connectivity configuration -> VPC Security Group**, select **Create new** VPC security group and give it a name (e.g. "DB-SG").


    ![6_db](/db-mig/6_db.png)



    {{% notice note %}}
Note: You will edit this VPC security group later to make sure that the DMS Replication Instance is able to access the target database and to allow access from your Webserver.
{{% /notice %}}

5. For the **Database authentication**, choose **Password authentication**.
6. In the **Additional configuration**, make sure to uncheck **Enable Enhanced monitoring** under the **Monitoring** section as indicated below:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Make sure to **Uncheck** the **Enable Enhanced monitoring**, otherwise you might get an error due to the role creation is not permitted in this Workshop.
{{% /notice %}}

6. Finally, review the **Estimated monthly costs** and click the **Create database** button.

   ![8_2_db](/db-mig/8_2_db.png)
