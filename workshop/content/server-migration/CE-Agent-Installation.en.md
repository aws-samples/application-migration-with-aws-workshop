+++
title = "Install Agents on Source Machines"
weight = 20
+++


From <a href="https://console.cloudendure.com">CloudEndure console</a>, navigate to the **Machines** screen which will show you **How to Add Machines** and provide instructions to install the agent on the source machine. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Install Agent on the Webserver

1. Get the source Webserver information

    For **self-paced lab** - it's described on the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank">CloudFormation Template</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    For **AWS Event** - it's described at **Webserver IP**, **Webserver Username** and **Webserver SSH Key** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Download and save locally (for example as **webserver.pem** file) the **Webserver SSH key** (.pem) 

    If you're using Microsoft Windows OS, please convert the SSH key .pem file to .ppk using PuttyGen and then use Putty to connect (more details <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank">can be found here</a>.  

2. Connect to the **Source Webserver** using SSH terminal

    For Microsoft Windows users review <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank">this article</a>.  
    For Mac OS users review <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank">this article</a>.

3. Run the commands copied from the **How to Add Machines** to download and install the agent:

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    When done properly, you will receive a message stating that the **Installation finished successfully**.
    
    {{% notice tip %}}
Commands for installing agent can also be obtained from the **CloudEndure** console **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Once agent is installed, Machine will show up in the **CloudEndure console** -> **Machines** tab.

    ![CE-server-progress](/ce/CE-server-progress.png)


#### Install Agent on the Windows Server (optional)

This section describes how to replicate a Windows Server with CloudEndure Migration. Skip it if your event scenario doesn't include Windows Server replication.

1. Get the source Windows Server information

    For **self-paced lab** - it's described on the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank">CloudFormation Template</a>.

    For **AWS Event** - it's described at **Windows Server IP**, **Username** and **Password** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank">Team Dashboard</a>.

3. Connect to the **Windows Server** using Remote Desktop Protocol (RDP) application.

    For more information on how to use RDP, see <a href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html" target="_blank">this article</a>.

4. Run the commands copied from **How to Add Machines** (Windows section) to download and install the agent.

    {{% notice tip %}}
Commands for installing the agent can also be obtained from the **CloudEndure** console **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Once the agent is installed, a MGMT-Host machine will show up in the **CloudEndure console** -> **Machines** tab.
