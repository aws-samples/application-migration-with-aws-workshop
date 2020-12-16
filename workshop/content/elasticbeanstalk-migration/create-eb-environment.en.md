+++
title = "Launch environment"
weight = 30
+++

### 1. Create Elastic Beanstalk Environment
1. Go to the **AWS Console**, from Services choose **Elastic Beanstalk** and click **Create Application**.
![create-s3-sourcecodebucket](/beanstalk/eb-create-app.png)

2. Update Application information and Platform settings to match the values below:

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Application Name                           | my-eb-app                                        |
    | Platform                           | PHP                                         |
    | Platform branch          | PHP 7.2 running on 64bit Amazon Linux 2                                                      |
    | Platform version                    | Choose Recommended Option  -- e.g. : 3.1.2 (Recommended)                                               |
    
    {{% notice note %}}
PHP version running on your web-server is 7.2.24. You can verify it on your source machine with **php --v** command.
    {{% /notice %}} 

    ![eb-app-settings](/beanstalk/eb-app-settings.png)

3. Choose **Upload your code** and update the parameters as below:

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Upload your code                           | Click                                       |
    | Version label                           | my-eb-app-source (will be populated automatically. Leave it as is)                                         |
    | Public S3 URl          | Click                                                     |
    | S3 URL link                    | S3 object link for your source-code bundle **wordpress-beanstalk.zip**.                                                   |
       

4. Click **Configure more options**.

![eb-s3-settings](/beanstalk/eb-s3-settings.png)

Once you click **Configure more options**, you will see complete application related configurations. In this workshop, you will only update **Network** and **Software** settings. **Leave all the remaining parameters as defaults**

### 2. Configure Network Settings
1. Scroll down the screen and click **Edit** under **Network**.

    ![eb-settings-network](/beanstalk/eb-settings-network.png)

2. Choose **TargetVPC** from the drop down menu.

3. **Click** Public IP address

4. Choose **TargetVPC-public-a** in **us-west-2a** availability zone.

5. Click **Save**

![eb-settings-network-details](/beanstalk/eb-settings-network-details.png)

### 3. Configure Software Settings
In this section, you will configure your software to connect to the RDS database created in the [Database Migration]({{< ref "/database-migration/_index.en.md" >}}) section.

1. Click **Edit** under **Software**.
![eb-settings-software](/beanstalk/eb-settings-software.png)
1. Scroll down to the **Environment properties** section. Leave all other fields without changes. Update the environment properties section with details of the RDS database you have created earlier.

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | RDS_DB_NAME                           | wordpress-db                                       |
    | RDS_HOSTNAME                           | Your RDS Endpoint. Can be found in **RDS Services** -> **Databases** -> **Connectivity & Security** tab -> **Endpoint** field                                        |
    | RDS_USERNAME                    | admin    
    | RDS_PASSWORD                          | Your RDS database Password                                         |
    | RDS_PORT          | 3306                                                      |
                                                |

2. Click **Apply**

3. Click **Create Application**

    Elastic Beanstalk will now automatically start creating your environment and later deploy and run your application.


    {{% notice note %}}
Creating environment may take few minutes. Use them to review other configuration options of Elastic Beanstalk in AWS Console or checking [Elastic Beanstalk documentation](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers.html) describing this topic.
{{% /notice %}} 


    ![eb-create-env-console](/beanstalk/eb-create-env-console.png)

5. Once your environment is ready, you should see its heatlh status OK
![eb-app-health](/beanstalk/eb-app-health.png)

### 3. Update RDS Security Groups
In order to provide connectivity between your application and RDS, you will need to update RDS Security Group to allow MySQL traffic from Elastic Beanstalk automatically created Security Group.

1. In **AWS Console** go to Services  and choose **RDS**
2. Click **Databases** from the left menu and choose the DB you created earlier.
3. Under the **Connectivity & Security** tab, click the name of security group under **VPC security groups**
![eb-rds-connectivity](/beanstalk/eb-rds-connectivity.png)
4. Click **Security group ID**
![eb-rds-sg](/beanstalk/eb-rds-sg.png)
5. Click **Edit Inbound rules**
   
    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Type                           | MYSQL/Aurora                                       |
    | Source                           | Choose the **Security Group** that Elastic Beanstalk created during the application creation process.                                |
                                               |
    | Description                           | Allow MySQL traffic from the Elastic Beanstalk app instance                                       |

    ![eb-rds-sg-rules](/beanstalk/eb-rds-sg-rules.png)
6. Click **Save rules**



***Congratulations!***  You have launched your Elastic Beanstalk environment and deployed your application. Go to the next section to review and manage it.
