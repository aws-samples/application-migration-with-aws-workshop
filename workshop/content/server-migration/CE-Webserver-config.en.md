+++
title = "Configure Application"
weight = 50

+++

### Configure the Webserver to access the target database

When the Cutover is finished and **CloudEndure Migration** has created a running instance of the Webserver in your AWS account, it's time to update the web application configuration to use your replicated AWS RDS database (created in the **Database Migration** step).


1. Update the **Webserver security group**

    a. Go to **AWS Console -> EC2** and select the Webserver on the list  
    b. Make a note of its **Public DNS (IPv4)** address and **Private IP**  
    c. Click on the security group that it has assigned  

    ![Webserver details](/ce/webserver_details.png)

    d. Modify inbound rules for that security group to allow traffic from Anywhere on port **80** and from your laptop on port **22**     

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Login to the **Webserver** created by the CloudEndure  

    Use the same username (ubuntu) and SSH .ppk key as for the Source Environment.

    If you're not sure how to use SSH to access servers, check the following:
    - For Microsoft Windows users view <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>.  
    - For Mac OS users view <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>.

3. Modify the **wordpress configuration**

    Edit the **/var/www/html/wp-config.php** file, modifying
    - DB_HOST - Endpoint of the created RDS instance
    - DB_USER - the username configured in the **Database Migration** step
    - DB_PASSWORD - the password configured in the **Database Migration** step
    
    Also add the following two lines, replacing **TARGET_WEBSERVER_PUBLIC_DNS** with your Target Webserver EC2 **Public DNS (IPv4)**, to make sure links in your wordpress site point to the new webserver.
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    for example
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

    {{% notice tip %}}
To edit this file, you can use for example <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> or <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Update the RDS instance **VPC security group** to allow inbound traffic from Webserver

    a. Go to  **AWS Console > Services > EC2 > Security Groups** and select your **RDS VPC security group** (DB-SG)  
    b. Go to the **Inbound** tab and click the **Edit** button  
    c. Add inbound rule that allows traffic from the **Webserver** (using its **Private IP** or the **security group** it belongs to) on port **3306** (MySQL port)
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

    {{% notice tip %}}
If you used a different security group name for your RDS instance, you can find it in details of your RDS instance, **Connectivity & security**, **Security** section.
{{% /notice %}}     
    

1. **Validate** the migration

    Open the Webserver Public DNS (IPv4) name in your web browser, you should see a unicorn store.

If everything works fine - proceed to the next phase, so [Move to Containers]({{< ref "../container-migration/_index.en.md" >}})!

## Troubleshooting

1. Make sure that RDS database related information configured on the Webserver in **/var/www/html/wp-config.php** is correct
2. Make sure that the RDS database is using the **DB-SG** security group
3. Make sure that the Webserver CloudEndure Blueprint points at a **TargetVPC public-subnet-a**
