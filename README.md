master branch: ![Build Status](https://codebuild.us-west-2.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiWDdPMHZ6TWUxUTZ5YnoyOVJmblJmdEZ1UDAvMEF0MG0vK2ozMTQvNXFlcDkvWVA1WUFISG9mZWxLeWl6bStJcTY3Z3JRMjlxdDJWT3k1OXBpMUFRVnNZPSIsIml2UGFyYW1ldGVyU3BlYyI6IlVzUVRXSXZvS0NRM2MrMEUiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)

**Application Migration Workshop** - https://application-migration-with-aws.workshop.aws/

Self-paced activity that allows you to learn how to migrate applications to AWS cloud:  
  - Re-hosting of webserver with [AWS Application Migration Service](https://aws.amazon.com/application-migration-service/) or [AWS CloudEndure Migration](https://aws.amazon.com/cloudendure-migration/)  
  - Re-platforming of webserver with [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/) 
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
   - Users and roles required to run the workshop

**Contributions**

Make sure you include the following text in your pull request "By submitting this pull request, I confirm that you can use, modify, copy, and redistribute this contribution, under the terms of your choice."
