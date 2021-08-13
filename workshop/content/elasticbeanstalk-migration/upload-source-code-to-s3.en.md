+++
title = "Upload source code"
weight = 20
+++

### 1. Create S3 Bucket for your source code bundle
1. Go to the AWS Console, from Services choose S3 and select **Create bucket**.
2. Enter **Bucket** name **mysourcecodebucket-xxxx**   (S3 bucket names are unique globally, please update the -xxxx part with a random number)
3. Make sure the **Region** is set to **Us West (Oregon) us-west-2**.
4. Keep default values in the remaining input fields.
5. Scroll-down and click **Create**.

![create-s3-sourcecodebucket](/beanstalk/s3-create-sourcecodebucket.png)
{{% notice note %}}
Make note of your S3 bucket name. You will use it in the next step.
{{% /notice %}}

### 2. Upload your source code to S3 bucket
Connect to the *Source Webserver* using SSH terminal (for Microsoft Windows see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>, for Mac OS see <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>).

1. Go into ***tmp*** folder where your source code bundle **wordpress-beanstalk.zip** is located and copy it to the S3 bucket you've created in the previous step.

      {{% notice note %}}
  Make sure to use your bucket name in the command below!
      {{% /notice %}}

   ```
   cd /tmp/
   aws s3 cp wordpress-beanstalk.zip s3://NAME_OF_YOUR_S3_BUCKET
   ```

2. Go to the **AWS Console**, from Services choose **S3** and select your bucket (e.g. mysourcecodebucket-0123)

3. You should see **wordpress-beanstalk.zip** file in the bucket. Click on **wordpress-beanstalk.zip** object link.
![source-bundle-in-s3](/beanstalk/source-bundle-in-s3.png)


4. Copy and Save the object URL link into your local notepad. You will use this link when setting up application source code location in the next section.

![s3-object-url](/beanstalk/s3-object-url.png)

At this stage, you have created your source code bundle and uploaded it into S3 bucket. In the next section, you will launch your Elastic Beanstalk environment and deploy your code directly on it.
