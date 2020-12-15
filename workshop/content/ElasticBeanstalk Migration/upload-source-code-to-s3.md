+++
title = "Upload your source code"
weight = 20
+++

### 1. Create S3 Bucket for your source-code bundle
1. Go to the AWS Console, from Services choose S3 and select **Create bucket**.
2. Enter Bucket name **mysourcecodebucket-xxxx**  
 (S3 bucket names should be unique, Please update the last-xxxx part with your numbers)
3. Check the Region is set to **US WEST (Oregon) us-west-2**.
4. Keep all the remaining options as it is.
5. Scroll-down and click **create**.
{{% notice note %}}

{{% /notice %}}
![create-s3-sourcecodebucket](/beanstalk/s3-create-sourcecodebucket.png)
{{% notice note %}}
Note your S3 bucket name. You will use it in the next step.
{{% /notice %}}

### 2. Upload your source-code to S3 bucket
Connect to the *Source Webserver* using SSH terminal.

1. Go into ***tmp*** folder where your source-code bundle **wordpress-beanstalk.zip** file is located and copy it to the S3 bucket you've created in previous step.

{{% notice note %}}
Confirm that you've updated the below command with your own S3 bucket name.
{{% /notice %}}

   ```
   cd /tmp/
   aws s3 cp wordpress-beanstalk.zip s3://mysourcecodebucket-0123
   ```

2. Once you run the command,  Go to the AWS Console, from Services choose S3 and select your bucket **mysourcecodebucket-0123**

3. You should see wordpress-beanstalk.zip file is uploaded into the bucket. Click on **wordpress-beanstalk.zip** object link.
![source-bundle-in-s3](/beanstalk/source-bundle-in-s3.png)


4. Copy and Save the object URL link into your local notepad. You will use this link when setting up application source-code location in the next section.

![s3-object-url](/beanstalk/s3-object-url.png)

At this stage, you have created your source-code bundle and uploaded it into S3 bucket. in the next section, you will launch your ElasticBeanstalk environment and deploy your code directly on it.*
