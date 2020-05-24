+++
title = "サーバーの移行"
date = 2019-10-22T20:48:41+02:00
weight = 15
pre = "<b>2. </b>"
+++

#### CloudEndure Migration Overview

<a href="https://aws.amazon.com/cloudendure-migration/" target="_blank">CloudEndure Migration</a> enables organizations to migrate even the most complex workloads to Amazon Web Services (AWS) without disruption, or data loss. Through continuous block-level replication, automated machine conversion, and application stack orchestration, **CloudEndure Migration** simplifies the migration process and reduces the potential for human error.

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
Go to <a href="https://console.cloudendure.com/#/register/register">CloudEndure Migration Registration page</a> to create an account and start migrating to AWS in minutes!
{{% /notice %}}  

In this lab you will perform re-hosting (also known as Lift and shift migration) of the webserver using **CloudEndure Migration**, following the steps below:

1. [CloudEndure Configuration]({{< ref "/CE-Configuration.ja.md" >}})  
2. [Install Agent on Source Machine(s)]({{< ref "/CE-Agent-Installation.ja.md" >}})  
3. [Prepare Blueprint]({{< ref "/CE-Blueprints.ja.md" >}})  
4. [Do the Cutover]({{< ref "/CE-Cutover.ja.md" >}})  
5. [Configure Application]({{< ref "/CE-Webserver-config.ja.md" >}})  