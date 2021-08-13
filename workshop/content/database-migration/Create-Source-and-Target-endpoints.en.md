+++
title = "Create Source and Target Endpoints"
weight = 30
+++


### Create source and target endpoints

Go back to AWS Console, **AWS Database Migration Service** screen, click on **Endpoints** and  **Create endpoint** button.

1. Create the **source endpoint**

    Use the following parameters to configure the endpoint:

    | Parameter           | Value                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - for **self-paced lab** use information (DBServerDNSName) from the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>, <br>for **AWS Events** - use **Database Server IP** from the Event Engine - Team Dashboard   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Open **Test endpoint connection (optional)** section, then in the **VPC** drop-down select **TargetVPC** and click the **Run test** button to verify that your endpoint configuration is valid.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    Test will run for a minute and you should see **successful** message in the **Status** column. Click on the **Create endpoint** button to create the endpoint.
    
    In case of any errors - make sure you've configured the endpoint parameters correctly and that the Replication Instance was created with **Publicly Accessible** parameter checked.

2. Create the **target endpoint**

    Repeat all steps to create the target endpoint with the following parameter values:

    | Parameter           | Value                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | checked                                            |
    | RDS Instance        | Select your RDS instance from the drop-down (if it's not visible enter values manually)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (will be pre-populated)                                                |
    | Server Name         | DNS name of your RDS database (leave the the pre-populated value)                             |
    | Port                | 3306     (will be pre-populated)                                             |
    | SSL mode            | none                                                  |
    | User name           | (leave the pre-populated value)                                                 |
    | Password            | Enter password you used when you creating the RDS database|


3. In the **Endpoint-specific settings -> Extra connection attributes** copy-paste the following connection parameters:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Under **Test endpoint connection (optional)** select **TargetVPC** in the **VPC** drop down and click the **Run test** button to verify that your endpoint is valid.

    Test will run for a minute and in the end you should see **successful** message in the **Status** column. Click on the **Create endpoint** button to create the endpoint.

In case of any errors, make sure that the **VPC security group** of your RDS database allows for inbound traffic on port 3306 from the **AWS DMS Replication Instance** security group (or for example from the whole **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Additional endpoint connection tests can be performed from **Endpoints** list by clicking the **Actions** button and then **Test connection**.
{{% /notice %}}
