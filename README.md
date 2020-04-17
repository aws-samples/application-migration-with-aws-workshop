**Application Migration Workshop**

Step-by-step instructions are available at https://application-migration-with-aws.workshop.aws/

Self-paced activity that allows you to learn how to migrate applications to AWS cloud:  
  - Re-hosting of webserver with [AWS CloudEndure Migration](https://aws.amazon.com/cloudendure-migration/)  
  - Re-platforming of database with [AWS Database Migration Service](https://aws.amazon.com/dms/)  
  - Modernization of webserver to containers running on [Amazon Elastic Container Service](https://aws.amazon.com/ecs/)   

This repository includes:
 - **Application Migration Workshop** instructions deployed to https://application-migration-with-aws.workshop.aws/
 - **Application Migration Workshop** resources (in **./resources** folder) used to deploy the source environment (for the self-paced mode)   
 
   - An Amazon VPC (Virtual Private Cloud) with a NAT Gateway
   - An Amazon EC2 machine with Apache HTTPD (ubuntu)  
   - An Amazon EC2 machine with MySQL database (ubuntu)   
   - Two AWS Lambda Functions (one generating EC2 Key Pair, one retrieving the EC2 Key Pair)   
   - Amazon API Gateway as the entry point for lambdas   

**Contributions**

Make sure you include the following text in your pull request "By submitting this pull request, I confirm that you can use, modify, copy, and redistribute this contribution, under the terms of your choice."
