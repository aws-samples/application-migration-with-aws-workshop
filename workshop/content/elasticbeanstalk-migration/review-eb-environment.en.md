+++
title = "Review and manage environment"
weight = 40
+++
Your application is now running on **AWS Elastic Beanstalk**. Navigate through **Elastic Beanstalk** console and review application details.

1. Go to **AWS Console**, from **Services** choose **Elastic Beanstalk** and click on **Environments** from left menu.
2. Click **URL** under **URL** column to go to your application public URL. This will take you to your applications web interface.
![eb-environments](/beanstalk/eb-environments.png)


3. Back in the **Elastic Beanstalk** console, click on your environment name under **Environment Name** column. You will see detailed information about your environment, including:
     - Health status,
     - Recent events, 
     - Platform details,
     - Public URL.
     - Currently running version (you can upload and deploy your application code from here)
  
    ![eb-env-overview](/beanstalk/eb-env-overview.png)
4. Elastic Beanstalk creates and manages all underlying infrastructure for your applications. You can see the instance details from the **Elastic Beanstalk** console.
    - Click **Health** from left menu.
    - Check your instance ID where your application is running on.
    - You can also reboot/terminate your instance directly.
![eb-env-heath](/beanstalk/eb-env-health.png)

5. You can monitoring your environment from **Elastic Beanstalk** console directly.

Click **Mointoring** from left menu.
![eb-monitoring](/beanstalk/eb-monitoring.png)

1. Click **Application versions** under your environments from the left menu.

Notice that your application's source code which you've uploaded to S3 bucket earlier is deployed to your environment.

![eb-app-version](/beanstalk/eb-app-version.png)

{{% notice note %}}
You can manage your application's versions through Elastic Beanstalk and deploy them into different environments easily without dealing with any underlying infrastructure provisioning. 
{{% /notice %}} 

### Recommended Next Steps (to try on your own)

- Make changes in your application source code and deploy the new version into your environment.
- Perform Blue/Green deployments.
- Explore how to deploy your application into multiple availability zones with Elastic Loadbalancer.

### Sources

- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.CNAMESwap.html" target="_blank" rel="noopener noreferrer">Blue/Green deployments</a>.
- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/troubleshooting.html" target="_blank" rel="noopener noreferrer">Elastic Beanstalk Troubleshooting</a>.
- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_PHP_eb.html" target="_blank" rel="noopener noreferrer">Working with PHP on Elastic Beanstalk</a>.
