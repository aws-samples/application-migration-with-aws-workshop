+++
title = "Launch cutover instance"
weight = 60
+++

1. Launch cutover
 
    Click on **Test and Cutover** -> **Launch cutover instance** and confirm **Launch** in the popup.

    ![Launch cutover](/app_mig_serv/launch_cutover_popup.en.png)

    This will trigger the cutover job (it will take ~10-15 minutes), you can find its details after clicking on **Cutover Job ID** in the **Lifecycle section**.  

    ![Launch cutover](/app_mig_serv/launch_cutover.en.png)  

    {{% notice warning %}} If you see **Failed to launch cutover instances. One or more of the Source Servers included in API call are currently being processed by a Job** error, this means that the test instance is still getting terminated. Check progress of that activity at <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/launchHistory" target="_blank" rel="noopener noreferrer">Launch history</a> page. Wait for the **Terminate** job to finish and then **Launch cutover instance** again.  
{{% /notice %}}   

2. Cutover completed

    Wait for the **Launch status** to change from **Waiting** to **Launched** / **First boot: Started**. At this stage your Webserver will be visible and **Running** in the **EC2 Console**.

    ![Launch succesful](/app_mig_serv/launch_status_launched.en.png)

3. Finalize the cutover


    Click on **Test and Cutover** -> **Finalize cutover**, then confirm finalization of cutover to stop replication and cleanup resources used by **Application Migration Service**. Your migrated webserver of course will be still there in the **EC2 Console**!

    ![Finalize cutover](/app_mig_serv/finalize_cutover.en.png)
   
   
    The last step of migration is [configuration of the application]({{<ref "/webserver_config.en.md">}}) on migrated webserver.


