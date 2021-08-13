+++
title = "Re-host with Application Migration Service"
weight = 22
pre = "<b>- </b>"
+++

#### Application Migration Service Overview

<a href="https://aws.amazon.com/application-migration-service/" target="_blank" rel="noopener noreferrer">Application Migration Service</a> allows you to quickly realize the benefits of migrating applications to the cloud without changes and with minimal downtime.

**AWS Application Migration Service** minimizes time-intensive, error-prone manual processes by automatically converting your source servers from physical, virtual, or cloud infrastructure to run natively on AWS. It further simplifies your migration by enabling you to use the same automated process for a wide range of applications.

![Application Migration Service - How it Works](/app_mig_serv/how-it-works.en.jpg)

**Benefits of Application Migration Service include:**

- Cutover windows of minutes and no data loss
- Large-scale migrations with no performance impact
- Wide platform and source Operating Systems support
- Automated migration to minimize IT resources and project length

{{% notice note %}}
**Application Migration Serice** is available **at no charge**  for all migrations to AWS for 90 days (2,160 hours). If you do not complete specific server migration within this period, you will be charged per hour you continue replicating that server.
{{% /notice %}}  

You can learn more about **Application Migration Service** by watching the video below.
<center><iframe width="560" height="315" src="https://www.youtube.com/embed/ao8geVzmmRo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In this lab you will perform re-hosting (also known as Lift and shift migration) of the webserver following the steps below:

1. [Setup of Application Migration Service]({{< ref "/setup.en.md" >}})  
2. [Install Agent on Source Machine]({{< ref "/install_agent.en.md" >}})  
3. [Review and configure server details]({{< ref "/server_details.en.md" >}})  
4. [Launch test instance]({{< ref "/test.en.md" >}})  
5. [Launch cutover instance]({{< ref "/launch.en.md" >}})  
6. [Configure application]({{< ref "/webserver_config.en.md">}})
