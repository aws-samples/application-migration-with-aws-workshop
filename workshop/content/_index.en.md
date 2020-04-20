+++
title = "Overview"
date = 2019-10-21T09:54:54+02:00
weight = 5
pre = "<b>0. </b>"
+++

In this lab you will learn how to migrate a fictional three-tier application to AWS cloud. You will practice:
   
  - **Re-hosting** of webserver with [AWS CloudEndure Migration](https://aws.amazon.com/cloudendure-migration/)  
  - **Re-platforming** of database with [AWS Database Migration Service](https://aws.amazon.com/dms/)  
  - **Modernization** of webserver to containers running on [Amazon Elastic Container Service](https://aws.amazon.com/ecs/)
  - (optional) Improvement of **Operation Excellence**, **Security**, **Performance Efficiency** and **Cost Optimization** of the deployed architecture   

## Source Environment

The following source environment is deployed during the environment preparation.

![source-env](/intro/source-env.png)

The Source Environment consist of a three tier e-commerce application; a webserver running Ubuntu with Apache, PHP, Wordpress, WooCommerce and a database server running Ubuntu with MySQL version 5.7.


## Target Environment

The following target **Amazon Virtual Private Cloud (VPC)** is deployed during the environment preparation.

![target-env](/intro/target-vpc.png)

The VPC consist of 6 subnets (2 public, 2 private for webservers and 2 private for database) across two availability zones.
