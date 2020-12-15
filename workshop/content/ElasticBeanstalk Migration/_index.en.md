+++
title = "Re-platform - ElasticBeanstalk"
date = 2019-10-22T20:48:41+02:00
weight = 35
pre = "<b>- </b>"
+++

{{% notice info %}}
This section assumes that you have already completed [Database Migration]({{< ref "/database-migration/_index.en.md" >}}) section .
{{% /notice %}}


#### Amazon Elastic Beanstalk Overview
**AWS Elastic Beanstalk** is an easy-to-use service for deploying and scaling web applications and services developed with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar servers such as Apache, Nginx, Passenger, and IIS.

You can simply upload your code and Elastic Beanstalk automatically handles the deployment, from capacity provisioning, load balancing, auto-scaling to application health monitoring. 

At the same time, you retain full control over the AWS resources powering your application and can access the underlying resources at any time.
{{% notice info %}}
There is no additional charge for Elastic Beanstalk - you pay only for the AWS resources needed to store and run your applications.
{{% /notice %}}

To use Elastic Beanstalk, you create an application, upload an application version in the form of an application source bundle (for example, a Java .war file) to Elastic Beanstalk, and then provide some information about the application. Elastic Beanstalk automatically launches an environment and creates and configures the AWS resources needed to run your code. After your environment is launched, you can then manage your environment and deploy new application versions. The following diagram illustrates the workflow of Elastic Beanstalk.

![beanstalk-overview](/beanstalk/eb-process.png)
#### Migrating the Web application to ElasticBeanstalk:

In this module, you will perform the following actions:

1. [Prepare your Source Code for migration]({{< ref "/prepare-the-source-code.en.md" >}})
2. [Upload your source code version]({{< ref "/upload-source-code-to-s3.en.md" >}})
3. [Launch your environment]({{< ref "/create-eb-environment.en.md" >}})
4. [Review & manage your environment]({{< ref "/review-eb-environment.en.md" >}})

You can learn more about **ElasticBeanstalk** by watching the video below.
<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/NhsELnv28NU" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
