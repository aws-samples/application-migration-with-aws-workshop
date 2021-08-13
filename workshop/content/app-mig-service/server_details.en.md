+++
title = "Update server details"
weight = 40
+++

Go to <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Source servers</a> list and click on the **Hostname** of your server.

On this page, by moving between tabs, you can:

1. Monitor progress of replication

    Initially the progress bar will show 0%,  but this will grow as the data is copied from your source server into target AWS environment. It will take ~30 mins for complete replication of this webserver.

    ![Migration dashboard](/app_mig_serv/migration_dashboard.en.png)

2. Review retrieved information about the source server

    ![Server information](/app_mig_serv/server_info.en.png)

    Including recommended machine type when its started on AWS

    ![Recommendation](/app_mig_serv/server_info_recommendation.en.png)

    You can always override this recommendation in **Launch settings**.

3. Manage tags

    Manage tags applied to given replication (note that these are NOT tags applied to target server after the migration).

    ![List tags](/app_mig_serv/manage_tags_1.en.png)

4. Manage staging disk settings

    As per default replication settings, to save cost, **Application Migration Service** uses Standard HDD disks for data replication for volumes smaller than 500 GiB. You can change staging disk type on this tab.

    ![Disk settings](/app_mig_serv/disk_settings.en.png)

5. Manage replication settings 

    On this tab you can configure custom replication settings for specific system. It may be useful especially for servers that experience significant amount of changes on their disks. In such case you may want to change the **Replication Server instance type** to one with more bandwidth and assign a **dedicated Replication Server**.

    ![Change replication settings](/app_mig_serv/replication_settings.en.png)

6. Launch settings

    On this tab you can configure details of how EC2 instance of replicated system should be configured in AWS. We will disable automated right sizing and define expected configuration of the target EC2 machine. 
    
7. Disable rightsizing

    Click **Edit** button in the **General launch settings** section.

    ![Disable automated rightsizing](/app_mig_serv/launch_settings_general.en.png)

    On the **Launch Settings** page, change **Instance type right sizing** to **None**, then click **Save settings**. While rightsizing is a good idea since it allows to optimize cost, we will do it manually in **EC2 Launch Template**.

    ![Disable automated rightsizing](/app_mig_serv/launch_settings_general_disable_rightsizing.en.png)

8. Modify **EC2 Launch Template**

    Click on the **Modify** buton in the **EC2 Launch Template** section and confirm you want to **Modify** the launch template.

    ![Launch settings](/app_mig_serv/launch_settings_select.en.png)

    Review various options available at the **Modify template (Create new version)** page, by clicking on the **Info** link next to each section title. 

    When you're done - scroll to the **Instance type** section and change selection to **t3.micro** machine instance type.

    ![Launch template - modify network](/app_mig_serv/launch_template_select_instance.en.png)

    Then in the **Resource tags** section change the **Name** tag value to **Webserver**, like on the screenshot below.

    ![Launch template - modify network](/app_mig_serv/launch_template_tags.en.png)

    Finally in the **Network interfaces** section, for the first **Network interface**, set **Auto-assign public IP** to **Enable** to make sure webserver will be accessible over public IP and select **TargetVPC-public-a** as the **Subnet** - this is where we want our webserver to run after the migration. 

    ![Launch template - modify network](/app_mig_serv/launch_template_select_subnet.en.png)

    Scroll down and click **Create template version** button.

9.  Update default **EC2 Launch Template**

    - Click on the name of the **EC2 Launch Template**

    ![Click on EC2 Launch Template name](/app_mig_serv/launch_template_new_version.en.png)

    - In the **Launch Templates** screen go to the **Versions** tab and select the latest version by clicking on the radio box on the left.

    - From the **Actions** menu select **Set default version**

    ![Set default version](/app_mig_serv/launch_template_update_version.en.png)

    - Confirm changing of the default version in the popup

    ![Confirm action](/app_mig_serv/launch_template_update_version_popup.en.png)


10. Go back to the <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Application Migration Service</a> screen, click on **Hostname** of migrated server.

    While waiting for the **Data replication status** to become **Healthy** (it should take ~30 mins) review parameters <a href="https://docs.aws.amazon.com/mgn/latest/ug/linux-agent.html" target="_blank" rel="noopener noreferrer">you can use for the agent installation</a>, see how agent can be <a href="https://docs.aws.amazon.com/mgn/latest/ug/windows-agent.html" target="_blank" rel="noopener noreferrer">installed on Windows</a> (if you plan to do Windows migration in the future) and additional information for <a href="https://docs.aws.amazon.com/mgn/latest/ug/installing-agent-blocked.html" target="_blank" rel="noopener noreferrer">instalation of agent on a secured network</a>.

    ![Data replication healthy](/app_mig_serv/data_replication_healthy.en.png)

    When the **Data replication status** is **Healthy**, your next step [is to launch a test server]({{< ref "/test.en.md" >}}).