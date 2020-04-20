+++
title = "アプリケーション移行ハンズオン"
date = 2019-10-21T09:54:54+02:00
weight = 5
pre = "<b>0. </b>"
+++

We are thrilled that you're taking on this challenge to migrate our eCommerce system to the cloud. Below you will find some notes from the former BuyMyUnicorns IT team. We hope you'll find them useful!

## Source Environment

![source-env](/intro/source-env.png)

The Source Environment consist of a two tier e-commerce application; a webserver running Ubuntu with Apache, PHP, Wordpress, WooCommerce and a Database server running Ubuntu with MySQL version 5.7.


## Target Environment

![target-env](/intro/target-vpc.png)

The above diagram shows the target VPC on AWS which consist of 6 subnets across two availability zone.
