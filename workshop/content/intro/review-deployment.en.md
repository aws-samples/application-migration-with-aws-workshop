
+++
title = "Review deployed environment"
weight = 40
+++
## Source Environment

The following source environment is deployed during the environment preparation.

![source-env](/intro/source-env.png)

The Source Environment consist of a three tier e-commerce application; a webserver running Ubuntu with Apache, PHP, Wordpress, WooCommerce and a database server running Ubuntu with MySQL version 5.7.


## Target Environment

The following target **Amazon Virtual Private Cloud (VPC)** is deployed during the environment preparation.

![target-env](/intro/target-vpc.png)

The VPC consist of 6 subnets (2 public, 2 private for webservers and 2 private for database) across two availability zones.

Now you can enable [AWS Migration Hub]({{< ref "/migration-hub.en.md" >}})  
