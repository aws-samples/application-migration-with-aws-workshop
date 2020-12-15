+++
title = "Launch your environment"
weight = 30
+++

### 1. Create Elastic Beanstalk Environment
1. Go to the AWS Console, from Services choose ElasticBeanstalk and select **Create Application**.
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

Once you click **Configure more options**, you will see all application related configurations. In this workshop, you will only update **Network** and **Software** settings. **Leave all the remaining configurations as is.**
### 2. Configure Network Settings
1. Scroll down the screen and click **Edit** under Network.

![eb-settings-network](/beanstalk/eb-settings-network.png)

2. Choose **TargetVPC** from the drop down menu.

3. **Click** Public IP address

4. Choose **TargetVPC-public-a** in **us-west-2a** availability zone.
{{% notice note %}}
Ensure you have selected **--Public Subnet--** and  **--TargetVPC--** as seen in below screen.
{{% /notice %}} 

5. Click **Save**

![eb-settings-network-details](/beanstalk/eb-settings-network-details.png)

### 3. Configure Software Settings
In this section, you will configure your software with the RDS DB details you've configured in previous section. Please refer to [Database Migration]({{< ref "/database-migration/_index.en.md" >}}) for details.
1. Click **Edit** under Software.
![eb-settings-software](/beanstalk/eb-settings-software.png)
2. Scroll down to the **Environment** Properties section. Leave all other fields as is.
- Update the environment properties section with the below RDS DB details you have created earlier.

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | RDS_DB_NAME                           | wordpress-db                                       |
    | RDS_HOSTNAME                           | Your RDS Endpoint. Can be found in RDS Services/ Databases/ Connectivity & Security tab/  Endpoint                                        |
    | RDS_PASSWORD                          | Your RDS DB Password                                         |
    | RDS_PORT          | 3306                                                      |
    | RDS_USERNAME                    | admin                                                    |

3- Click **Apply**

![eb-settings-software-details](/beanstalk/eb-settings-software-details.png)

4- Click **Create Application**
- Once you click, ElasticBeanstalk will automatically start crating your environment and will start running your source-code.
{{% notice note %}}
Creating environment may take few minutes.
{{% /notice %}} 

![eb-create-env-console](/beanstalk/eb-create-env-console.png)

5- Once your environment is ready, you should see its heatlh status OK
![eb-app-health](/beanstalk/eb-app-health.png)

### 3. Update RDS Security Groups
In order to provide connectivity between your application and RDS, you will need to update RDS Security Group to allow MySQL traffic from Elastic Beanstalk automatically created Security Group.
1. On the Services Menu, Choose **RDS**
2. Click **Databases** from the left menu and choose the DB you created earlier.
3. Under the **Connectivity & Security** tab, Click the **VPC Security Group**
![eb-rds-connectivity](/beanstalk/eb-rds-connectivity.png)
4. Click Security Group ID
![eb-rds-sg](/beanstalk/eb-rds-sg.png)
5. Click **Edit Inbound rules**
 | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Type                           | MYSQL/Aurora                                       |
    | Source                           | Choose the Security Group Elastic Beanstalk automatically created during the application creation process. (MyEbapp-env)                                        |
                                               |
    | Description                           | Allow MySQL traffic from EB app instance                                       |

![eb-rds-sg-rules](/beanstalk/eb-rds-sg-rules.png)
6. Click **Save rules**



***Congratulations!*** 
You have launched your environment and deployed your source-code. Go to next section to review and manage your environment.
