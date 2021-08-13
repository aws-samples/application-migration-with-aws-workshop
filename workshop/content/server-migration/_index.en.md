+++
title = "Re-host with CloudEndure"
date = 2019-10-22T20:48:41+02:00
weight = 25
pre = "<b>- </b>"
+++

#### CloudEndure Migration Overview

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank" rel="noopener noreferrer">CloudEndure Migration</a> enables organizations to migrate even the most complex workloads to Amazon Web Services (AWS) without disruption, or data loss. Through continuous block-level replication, automated machine conversion, and application stack orchestration, **CloudEndure Migration** simplifies the migration process and reduces the potential for human error.

Whether you are migrating to AWS or across regions within AWS, **CloudEndure Migration** gives you the flexibility you need and delivers the security controls you require to succeed in today’s fast-paced digital ecosystem.

![cloudendure-intro](/ce/ce-home.png)

**Benefits of CloudEndure Live Migration include:**

- Cutover windows of minutes and no data loss
- 100% data integrity for all applications (including databases and legacy applications)
- Large-scale migrations with no performance impact
- Wide platform and source Operating Systems support
- Automated migration to minimize IT resources and project length

{{% notice note %}}
**CloudEndure Migration** is now available **at no charge**  for all migrations to AWS.  
Go to <a href="https://console.cloudendure.com/#/register/register" target="_blank" rel="noopener noreferrer">CloudEndure Migration Registration page</a> to create an account and start migrating to AWS in minutes!
{{% /notice %}}  

You can learn more about **CloudEndure Migration** by watching the video below.
<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/kIJ29q-Jsyo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In this lab you will perform re-hosting (also known as Lift and shift migration) of the webserver following the steps below:

1. [CloudEndure Configuration]({{< ref "/CE-Configuration.en.md" >}})  
2. [Install Agent on Source Machine(s)]({{< ref "/CE-Agent-Installation.en.md" >}})  
3. [Prepare Blueprint]({{< ref "/CE-Blueprints.en.md" >}})  
4. [Do the Cutover]({{< ref "/CE-Cutover.en.md" >}})  
5. [Configure Application]({{< ref "/CE-Webserver-config.en.md" >}})  
