+++
title = "Launch test instance"
weight = 50
+++

Before we can finalize migration, we need to test it. 

1. Go to server details and click on the **Test and Cutover** button, then from the menu select **Launch test instance**.

    ![Launch test instance](/app_mig_serv/launch_test_instance.en.png)

    Confirm the launch on the popup and wait for the test machine to be launched. Testing process allows to validate the conversion of the boot volume and target server network configuration (as defined in **EC2 Launch Template**).

    To see progress of the test launch click on the **Job ID** in the **Lifecycle** section.

    ![Job id](/app_mig_serv/testing_job_id.en.png)

    Wait for the **Completed** Status (it should take ~10-15 minutes).

    ![Job progress](/app_mig_serv/testing_job_details.en.png)

2. Go back to <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Source Servers</a>, click on your server **Hostname**, then **Test and Cutover** -> **Mark as "ready for cutover"** and  **Continue** on the popup to confirm that the testing went succesful and testing instance can be terminated.

    ![Ready for cutover](/app_mig_serv/ready_for_cutover.en.png)

    Now you are ready to [launch the cutover instance]({{<ref "/launch.en.md">}}).