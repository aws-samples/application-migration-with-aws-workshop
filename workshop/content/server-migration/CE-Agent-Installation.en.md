+++
title = "Install Agents on Source Machines"
weight = 20
+++


From <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure console</a>, navigate to the **Machines** screen which will show you **How to Add Machines** and provide instructions to install the agent on the source machine. 

![CE-Agent-install](/ce/CE-Agent-install.png)


#### Install Agent on the Webserver

1. Get the source Webserver information

    For **self-paced lab** - it's described on the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    For **AWS Event** - it's described at **Webserver IP**, **Webserver Username** and **Webserver SSH Key** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

1. Download and save locally (for example as **webserver.pem** file) the **Webserver SSH key** (.pem) 

    If you're using Microsoft Windows OS, please convert the SSH key .pem file to .ppk using PuttyGen and then use Putty to connect (more details <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">can be found here</a>.  

2. Connect to the **Source Webserver** using SSH terminal

    For Microsoft Windows users review <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>.  
    For Mac OS users review <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>.

3. Run the commands copied from the **How to Add Machines** to download and install the agent:

    ![CloudEndure Agent installation example output](/ce/CE-Agent-install-detailed.png)

    When done properly, you will receive a message stating that the **Installation finished successfully**.
    
    {{% notice tip %}}
Commands for installing agent can also be obtained from the **CloudEndure** console **Machines -> MACHINE ACTIONS -> Add Machines**
{{% /notice %}}

5. Once agent is installed, Machine will show up in the **CloudEndure console** -> **Machines** tab.

    ![CE-server-progress](/ce/CE-server-progress.png)

