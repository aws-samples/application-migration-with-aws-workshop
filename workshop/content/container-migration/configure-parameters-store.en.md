+++
title = "Configure the Parameter Store"
weight = 30
+++

As we will use the official wordpress docker image with RDS database, we will need to provide database credentials, database name and server details for the wordpress configuration. 

The best way to achieve that is to manage those parameters in **AWS Systems Manager** Parameter Store instead of storing them inside the docker image or ECS Task Definition.

From **AWS Console**, select **Services**, then **Systems Manager** and go to **Parameter Store**.

Click on **Create parameter** button and enter **Parameter Details** (Name, Description, Type and Value) for parameters as per the table below.

![parameter-details](/ecs/parameter-details.png)

You will need to repeat the above for all the following parameters:


| Parameter              | Type             | Value                          |
| ---------------------- | ---------------- |--------------------------------|
| DB_HOST                | String           | RDS endpoint                   |
| DB_NAME                | String           | name of the target database  (wordpress-db)  |
| DB_USERNAME            | String           | RDS database username          |
| DB_PASSWORD            | SecureString     | RDS database password          |
