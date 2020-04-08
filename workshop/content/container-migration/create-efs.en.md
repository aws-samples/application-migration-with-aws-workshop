+++
title = "Create an Amazon EFS file system"
weight = 20
+++

From **AWS Console**, go to **Services** and select **EFS**, then click **Create file system**.

![create-efs](/ecs/create-efs.png)

Select the VPC that you have created at the beginning of the workshop (e.g TargetVPC), private subnets per availability zone for the mount targets and EFS-SG security group for each mount target, then click **Next Step**.

In the **Step 2: Configure optional settings**, you can enable lifecycle policy, change the throughput mode and enable encryption. For this exercise, enable encryption and leave  default values for the other options.

![efs-enc](/ecs/efs-enc.png)

![efs-review](/ecs/efs-review.png)
Finally, review your setting and click **Create File System**

Copy the **DNS name** of the created file system as you will need it later, in the **Create a Task Definition** step.
![efs-details](/ecs/efs-details.png)

Now, you can mount this file system temporarily into the webserver instance to copy the source wordpress content to it.

### Mounting file system to webserver

Click on the **Amazon EC2 mount instructions (from local VPC)** link in the Amazon EFS file system details and follow them.

You can skip the nfs client installation step, since the nfs client is installed already on your EC2 instance.

![efs-mount](/ecs/efs-mount.png)

Once you mounted the filesystem, copy the whole **/var/www/html/wp-content** folder from the web server to the mounted file system.

Example:
```
sudo cp -r /var/www/html/wp-content/* efs/
```
