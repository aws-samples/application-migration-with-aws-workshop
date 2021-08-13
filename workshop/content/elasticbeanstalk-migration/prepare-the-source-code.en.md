+++
title = "Prepare source code"
weight = 10
+++

As Elastic Beanstalk is a managed service, you don’t need to deal with launching and managing servers or any underlying infrastructure. 
As a developer, you can directly push your codes into Elastic Beanstalk.

In below steps, you will:

- Install necessary toolset into your source machine, 
- Prepare your source code to be uploaded into Elastic Beanstalk


### 1. Install necessary toolset into your source machine
In order to prepare the source environment for Elastic Beanstalk migration, you will need to install some tools into your source machine. Please follow below steps.

Connect to the *Source Webserver* using SSH terminal (for Microsoft Windows see <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>, for Mac OS see <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>).

1. Install zip
   ```
   sudo apt install zip
   ```
2. Install awscli
   ```
   sudo apt install awscli
   ```
   
   {{% notice info %}}
   awscli is required to communicate with S3 and upload the source bundle.
   {{% /notice %}}

### 2. Create a development environment for your source code    
1. As, you will need to make updates on your source code, it is a best practice to separate your development environment from your production.
Thus, you will need to create a new dev environment in your source machine. 

   Create a new folder called **myapp_beanstalk** under /tmp and copy all your application data into that folder.

   ```
    mkdir /tmp/myapp_beanstalk
    cp -r /var/www/html/* /tmp/myapp_beanstalk/
   ```
   
  {{% notice info %}}
You may have separate systems for your dev/test/prod environments. In this workshop, you will simulate it by creating a separate folder in the same machine.
{{% /notice %}}

### 3. Update application configuration and create source code bundle
You will need to update application configuration with RDS DB details which you've created in the previous module, see [Database migration]({{< ref "database-migration/_index.en.md" >}}) for more details.

1. Go into the **myapp_beanstalk** application folder you've just created and open **the wp-config.php** file.

   ```
    cd /tmp/myapp_beanstalk
    sudo vi wp-config.php
   ```

2. Once you open the **the wp-config.php** file, you will see below parameters already set-up for existing DB settings.
   ```
    define( 'DB_NAME', 'wordpress-db' );

    /** MySQL database username */
    define( 'DB_USER', 'wordpress-user' );

    /** MySQL database password */
    define( 'DB_PASSWORD', 'AWSRocksSince2006' );

    /** MySQL hostname */
    define( 'DB_HOST', '10.0.0.68' );
   ```
   
3. Update the above lines in the **the wp-config.php** file as below. Notice that, there are no hard-coded details like db-username, password in your configuration file anymore. You will configure those parameters when creating the application on Elastic Beanstalk console later. Following this approach is a best practice and allows for application changes without modifying application source code.

   ```
    define('DB_NAME', $_SERVER['RDS_DB_NAME']);
    define('DB_USER', $_SERVER['RDS_USERNAME']);
    define('DB_PASSWORD', $_SERVER['RDS_PASSWORD']);
    define('DB_HOST', $_SERVER['RDS_HOSTNAME'] . ':' . $_SERVER['RDS_PORT']);
   ```

4. Save and quit **the wp-config.php** with **:wq**

5. Create a source code bundle (**wordpress-beanstalk.zip**) with zip.
   ```
    cd /tmp/myapp_beanstalk
    zip ../wordpress-beanstalk.zip -r * .[^.]*
   ```
6. Confirm your **wordpress-beanstalk.zip** file is created under **tmp** folder.
   ```
    cd /tmp/
    ls
   ```

You've prepared your source code bundle. In the next step, you will create a S3 bucket and upload the source code bundle into S3.

