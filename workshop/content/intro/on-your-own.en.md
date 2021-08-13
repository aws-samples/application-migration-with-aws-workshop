+++
title = "Running the workshop on your own"
weight = 20
+++

{{% notice warning %}}
Complete this section ONLY if you are running the workshop on your own. If you are at an AWS hosted event (such as re:Invent, GameDay, Workshop, or any other event hosted by an AWS employee), go to [Start the workshop at an AWS event]({{< ref "/migration-hub.en.md" >}}).
{{% /notice %}}


### Self-paced learning environment

This lab assumes you have access to an **AWS Account** with <a href="https://docs.aws.amazon.com/IAM/latest/UserGuide/getting-started_create-admin-group.html" target="_blank" rel="noopener noreferrer">Administrator privileges</a>. To create a new AWS Accounts please follow <a href="https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/" target="_blank" rel="noopener noreferrer">How do I create and activate a new Amazon Web Services account?</a> article.

Instructions below will deploy the source environment in your AWS account. The deployed resources consists of two t3.micro EC2 machines (one for webserver, one for database), a NAT Gateway, an API Gateway and two AWS Lambda functions (for easy retrieval of EC2 Access Key). Total cost of resources deployed throughout the lab should be less than $1 (assuming 4 hours of work), some of them are covered by <a href="https://aws.amazon.com/free/" target="_blank" rel="noopener noreferrer">AWS Free tier</a>.

Remember to [cleanup]({{< ref "/cleanup/_index.en.md" >}}) your AWS account after running the lab, to avoid unnecessary charges!

#### Option 1: Simple Deployment

1. Click on the button below <a href="https://console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks/new?stackName=ApplicationMigrationWorkshop&templateURL=https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml" target="_blank" rel="noopener noreferrer"><img src="https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/static/cloudformation-launch-stack.png"></a>


2. On the **Step 1 - Specify template** confirm that the URL https://application-migration-with-aws-workshop.s3-us-west-2.amazonaws.com/template/migration_workshop_source_template.yml is entered in the **Amazon S3 URL** field and press **Next**
  ![CloudFormation Step 1](/intro/cloudformation-step1.en.png)

4. On the **Step 2 - Specify stack details** screen make sure ApplicationMigrationWorkshop is entered in the **Stack name** field and press **Next**
   ![CloudFormation Step 2](/intro/cloudformation-step2.en.png)

5. On the **Step 3 - Configure stack options** screen don't make any changes, just press **Next**  

6. On the **Step 4 - Review** screen, scroll to the bottom of the page and check all checkboxes, as on the screenshot below, then press **Next** for the template to be deployed.  
  ![CloudFormation Step 4](/intro/cloudformation-step4.en.png)

When the template is in the **CREATE_COMPLETE** you can find information about created source environment by going to **AWS Console -> CloudFormation**, selecting  **ApplicationMigrationWorkshop** stack and going to the **Outputs** tab. You will see information like on the screenshot below.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Copy - paste this information, as you will use it during the lab.

Now you can enable [AWS Migration Hub]({{< ref "/migration-hub.en.md" >}})  

{{% notice note %}}
If the deployment fails, go to deployment stack **Events** tab and confirm the root cause. A common root cause is **ecsExecutionRole** or **ecsAutoscaleRole** IAM roles already exist in the AWS account. Delete them and re-run deployment of the source environment CloudFormation template. If you have a need for those roles, we recommend checking option 2 and building everything from the source code.
{{% /notice %}}

#### Option 2: Building everything from the source code

{{% notice note %}}
You don't need to continue with option 2 if you already deployed the environment using option 1
{{% /notice %}}

Section below describes how to build the CloudFormation template and deploy it using AWS Command Line Interface (CLI).

1. Install  <a href="https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html" target="_blank" rel="noopener noreferrer">AWS SAM</a>

2. Install <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html" target="_blank" rel="noopener noreferrer">AWS CLI</a> and <a href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html" target="_blank" rel="noopener noreferrer">configure it</a>

3. Download or clone the project from <a href="https://github.com/aws-samples/application-migration-with-aws-workshop" target="_blank" rel="noopener noreferrer">https://github.com/aws-samples/application-migration-with-aws-workshop</a>


4. Create a unique S3 bucket in the *us-west-2 (Oregon)* region, by running the following (replace **application-migration-workshop** with a custom S3 bucket name)

   ```
   aws s3 mb application-migration-workshop --region us-west-2
   ```  

5. Build the template and deploy it (replace **application-migration-workshop** with the custom S3 bucket name created in previous step)  

   ```
   sam build -t cloudformation.yml  
   sam package --s3-bucket application-migration-workshop --template-file .aws-sam\build\template.yaml --output-template-file ./migration_workshop_source_template.yml  
   sam deploy --template-file ./migration_workshop_source_template.yml --stack-name ApplicationMigrationWorkshop --region us-west-2 --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND  
   ```

6. As soon as the deployment is finalized, you will see information about the source environment in the console, like on the screenshot below.

![Source Environment in CLI Console](/intro/self-service-env-cli-info.en.png)

You can always find it later by going to **AWS Console -> CloudFormation**, select created **ApplicationMigrationWorkshop** stack and go to the **Outputs** tab, like on the screenshot below.

![Source Environment Information in AWS Console](/intro/self-service-env-awsconsole-info.en.png)

Now you can [review the deployed environment]({{< ref "/review-deployment.en.md" >}})  
