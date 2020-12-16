+++
title = "Server Migration"
date = 2019-10-22T20:48:41+02:00
weight = 20
pre = "<b>2. </b>"
+++

#### Server Migration Patterns

In this section, you will migrate your web server in different migration patterns. Each migration pattern requires different set of activities, approach and tools. Most common server migration patterns are listed as below.

1. **REHOST**: Move applications without changes. (aka lift-and-shift). Benefit from AWS migration tools like <a href="https://aws.amazon.com/cloudendure-migration/" target="_blank">CloudEndure</a>, <a href="https://aws.amazon.com/server-migration-service/" target="_blank">SMS</a>
2. **REPLATFORM**: Make a few cloud optimizations to achieve a tangible benefit. You will not change the core architecture of the application.
3. **REPURCHASE**: Move from perpetual licenses to a software-as-a-service model. <a href="https://aws.amazon.com/mp/migration/" target="_blank">AWS Marketplace</a> offers a curated digital catalog of software solutions that support each phase of migration.
4. **REFACTOR**: Re-imagine how the application is architected and developed using cloud-native features.


![migration_strategies](/server_migration_overview/migration_options.png)


#### Choose your Migration Pattern 

At this point, decide your preferred migration pattern and continue with the related section; 


1. [Rehost with CloudEndure]({{< ref "/server-migration/_index.en.md" >}})

2. [Replatform - Containers]({{< ref "/container-migration/_index.en.md" >}})

3. [Replatform - ElasticBeanstalk]({{< ref "/ElasticBeanstalk Migration/_index.en.md" >}})
