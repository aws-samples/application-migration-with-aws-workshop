+++
title = "Install agent"
weight = 30
+++

**AWS Application Migration Service** replicates data to AWS using agent that must be installed on the source server.

1. Retrieve AWS credentials for the agent

    For the **Application Migration Service** agent to replicate data, you need to have an AWS IAM User with proper privileges created in your target AWS account (see more information <a href="https://docs.aws.amazon.com/mgn/latest/ug/credentials.html">here</a>). We've created a user for you, what you need to do is retrieve its Access Key ID and Secret Access Key to use it during agent installation.

    For **self-paced lab** - it's described on the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![AWS Credentials](/app_mig_serv/install_agent_credentials.en.png)    

    For **AWS Event** - it's described at **Application Migration Service - IAM Access Key ID** and **IAM Secret Access Key** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.    

    ![AWS Credetentials EE](/app_mig_serv/ee_credentials.en.png)

2. Retrieve the source Webserver connection  information

    For **self-paced lab** - it's described on the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>.

    ![Centos-pem](/ce/webserver-self-paced-info.png)    

    For **AWS Event** - it's described at **Webserver IP**, **Webserver Username** and **Webserver SSH Key** on the <a href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Team Dashboard</a>.

    ![Centos-pem](/ce/Centos-pem.png)

3. Download and save locally (for example as **webserver.pem** file) the **Webserver SSH key** (.pem) 

    If you're using Microsoft Windows OS, convert the SSH key .pem file to .ppk using PuttyGen and then use Putty to connect (more details <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">can be found here</a>).  

4. Connect to the **Source Webserver** using SSH terminal

    For Microsoft Windows users review <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">this article</a>.  
    For Mac OS users review <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">this article</a>.

5. Run the following commands

```shell
wget -O ./aws-replication-installer-init.py https://aws-application-migration-service-us-west-2.s3.amazonaws.com/latest/linux/aws-replication-installer-init.py
sudo python3 aws-replication-installer-init.py
```

6. Provide AWS region and AWS credentials

    When prompted provide **AWS Region** (us-west-2), then **AWS Access Key ID** and **AWS Secret Access Key** retrieved in step 1.

    {{% notice note %}}  When copying-pasting **AWS Secret Access Key**, its content is not displayed for security reasons. Just press **Enter** after paste.
{{% /notice %}}   

7. Confirm volumes to be replicated

    Once you've entered AWS credentials, installer will identify volumes attached to the system and prompt you to choose which disks you want to replicate. Press **Enter** since we want to replicate all volumes.

    ![Application Migration Service - agent installation](/app_mig_serv/install_agent.en.png)

8. Replication start

    Once the agent is installed, you will see information about it in the <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">Application Migration Service Source Servers</a> list.

    ![Application Migration Service - Source Servers list](/app_mig_serv/source_servers.en.png)

    The replication starts right away. While it's taking place, let's review and update [server details]({{< ref "/server_details.en.md" >}}).

