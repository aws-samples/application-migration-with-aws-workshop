+++
title = "Do the Cutover"
weight = 40

+++
### CloudEndure Migration Test/Cutover

Once you have completed the replication of volumes (so the status next to machine name says **Continuous Data Replication**), you are then able to perform a **Test/Cutover**.

Every time you start the **Test/Cutover**, CloudEndure Migration deletes any previously created instances and creates a **new Target instance** that is up to date with the latest copy of the data from the Source Environment.

{{% notice note %}}
According to best practice, and in real life, you should perform a **Test** migration at least **one week** before the target migration date. This is to identify potential challenges with your Blueprint configuration or with replicated volume conversion and address them.  
In this lab, you will perform a **Cutover** (this instance conversion was performed almost 3,000 times, so we know it works!).
{{% /notice %}}


1. Confirm that the volumes are fully replicated
   
    Confirm that the instance is in a state of **Continuous Data Replication** under the **DATA REPLICATION PROGRESS** column.

    If it's still replicating, wait until it reaches the **Continuous Data Replication** state. While waiting you can review <a href="https://docs.cloudendure.com/" target="_blank" rel="noopener noreferrer">CloudEndure documentation</a>.

2. Trigger the Cutover
   
    From the **Machines** list select the server that you want to Cutover, click **LAUNCH 1 TARGET MACHINE** button in the top right corner of the screen, then **Cutover Mode** and **CONTINUE** in the confirmation popup.

    ![CE-Cutover](/ce/CE-Cutover.png)

    CloudEndure will now perform a final sync/snapshot on the volumes and begin the process of building new servers in the target infrastructure, all while maintaining data consistency. See the **Job Progress** screen for details.


    ![CE-job-progress](/ce/CE-job-progress.png)

    Monitor the **Job Progress** log until you see **Finished starting converters** message (it should take 3-5 minutes). In the meantime you can review <a href="https://docs.cloudendure.com/#Configuring_and_Running_Migration/Performing_a_Migration_Cutover/Performing_a_Migration_Cutover.htm" target="_blank" rel="noopener noreferrer">CloudEndure Documentation providing details on the cutover process</a>.

    {{% notice tip %}}
If you don't see your job in the **Job Progress** window, refresh the browser (F5) and make sure to scroll to the top of the drop-down list of CloudEndure jobs.
{{% /notice %}}

1. Review resources created by CloudEndure in your AWS account
   
    Switch back to the **AWS Console** and navigate to your target AWS region if needed (US-west-2/Oregon).
   
    You will see two additional instances managed by CloudEndure:
    - **CloudEndure Machine Converter** - used for conversion of the source boot volume, making AWS-specific bootloader changes, injecting hypervisor drivers and installing cloud tools. It's running for couple of minutes per each Test or cutover.
    - **CloudEndure Replication Server** - used to receive encrypted data from agents installed in the source environment. It's running when the replication of data is taking place.

    Both types of instances are fully managed by CloudEndure and are NOT accessible by users.

    As soon as the cutover is finished, you will see another EC2 instance on the list - this is your target Webserver created by CloudEndure. Make a note of its public and private IPs, as you will need them in the next step.

    {{% notice tip %}}
If you want to know more about those servers, their purpose and network requirements see <a href="https://docs.cloudendure.com/#Preparing_Your_Environments/Network_Requirements/Network_Requirements.htm" target="_blank" rel="noopener noreferrer">CloudEndure Documentation</a>.
{{% /notice %}}
