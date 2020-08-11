+++
title = "Create an Amazon EFS file system"
weight = 20
+++

From **AWS Console**, go to **Services** and select **EFS**, then click **Create file system**.

Name the file system (e.g. 'webserver-filesystem') and select the TargetVPC, where the EFS will be deployed.

![Create file system](/ecs/create-efs-name.en.png)

Click on the **Create** button, then click on the **webserver-filesystem** name of the EFS on the list, to open the details.

![Select EFS from the list](/ecs/create-efs-select.en.png)

In the details of the **webserver-filesystem** file system, go to **Network** tab and click on the **Create mount target** button.

![Go to Network mount targets](/ecs/create-efs-mount-target.en.png)

Select the **Target VPC** in the Virtual Private Cloud (VPC) drop down and add two mount targets.

| Availability zone    | Subnet ID      								   | Security groups            |
| ---------------------- | ---------------- |----------------|
| us-west-2a                | TargetVPC-private-a-web            | EFS-SG  |
| us-west-2b                | TargetVPC-private-b-web    | EFS-SG  |


![Configure Network mount targets](/ecs/create-efs-configure-mount-targets.en.png)

Click **Save** button.

Make a note of the **File system ID**, you will need it later to mount the file system and to define the DNS name of the created file system. The DNS name follows format of **file-system-id**.efs.**aws-region**.amazonaws.com, so in my case it's **fs-f30ba7f6**.efs.**us-west-2**.amazonaws.com (note that it will be different for you!).

![EFS file system id](/ecs/create-efs-file-system-id.en.png)

Now, you can mount the file system temporarily into the Webserver instance to copy the source wordpress content.

### Mounting file system to webserver

SSH into your **Webserver** and run the following commands:
```
sudo apt-get update
sudo apt-get install nfs-common
sudo mkdir efs
```

Run the following command, replacing the **FILE_SYSTEM_ID** with **File system ID** of Elastic File System you have just created.

```
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport FILE_SYSTEM_ID.efs.us-west-2.amazonaws.com:/ efs
```


Once you mounted the filesystem, copy the whole **/var/www/html/wp-content** folder from the web server to the mounted file system with the following command.

```
sudo cp -r /var/www/html/wp-content/* efs/
```

### Troubleshooting

If you have any challenges in mounting the EFS, please check https://docs.aws.amazon.com/efs/latest/ug/mounting-fs-mount-cmd-dns-name.html for more details