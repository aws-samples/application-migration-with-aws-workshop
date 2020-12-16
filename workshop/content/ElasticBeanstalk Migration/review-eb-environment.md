+++
title = "Review and Manage your environment"
weight = 40
+++
Your application is now running on ElasticBeanstalk. Navigate through ElasticBeanstalk Console and review application details.

1. Go to the AWS Console, from Services choose ElasticBeanstalk and select **Environments** from left-hand side menu.
2. Click **URL** under **URL** column to go to your application WEB Public URL. This will take you to your applications web interface.
![eb-environments](/beanstalk/eb-environments.png)


3. Click your environment link (MyEbApp-env-1) under **Environment Name** column. You will see the all details about your environment including ;
     - Your application health status,
     - Recent events, 
     - Platform details,
     - Public URL.
     - Current running version (You can upload and deploy your application code directly)
![eb-env-overview](/beanstalk/eb-env-overview.png)
4. ElasticBeansltalk creates and manages all underlying infrastructure for your applications. You can see the instance details of your instances from ElasticBeanstalk console.
    - Click **Health** from left-hand side menu.
    - Check your instance ID where your application is running on.
    - You can also reboot/terminate your instance directly.
![eb-env-heath](/beanstalk/eb-env-health.png)

5. You can monitoring your environment from ElasticBeanstalk console directly.
- Click **Mointoring** from left-hand side menu.
![eb-monitoring](/beanstalk/eb-monitoring.png)

6. Click **Application versions** under your environments from left-hand side menu.
- Notice that your application's source-code which you've uploaded to S3 bucket earlier is deployed to your environment.

![eb-app-version](/beanstalk/eb-app-version.png)

{{% notice note %}}
You can manage your application's versions through ElasticBeanstalk and deploy them into different environments easily without dealing with any underlying infrastructure provisioning. 
{{% /notice %}} 

### Next Steps

- Make changes in your application source code and deploy the new version into your environment.
- Perform Blue/Green deployments.
- Explore how to deploy your application into multiple availability zones with Elastic Loadbalancer.

### Sources

- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.CNAMESwap.html" target="_blank">Blue/Green deployments</a>.
- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/troubleshooting.html" target="_blank">ElasticBeanstalk Troubleshooting</a>.
- <a href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_PHP_eb.html" target="_blank">Working with PHP on Elastic Beanstalk</a>.
