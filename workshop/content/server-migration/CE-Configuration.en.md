+++
title = "CloudEndure Configuration"
weight = 10
+++


To begin, you will need to configure CloudEndure with **AWS credentials** to access your AWS account and **replication destination** location (subnet) within target AWS account for the CloudEndure Replication Server.

### Configure AWS Credentials.

1. Login to CloudEndure Console at [https://console.cloudendure.com](https://console.cloudendure.com/)

    ![CE-login](/ce/CE-login.png)

    For **self-paced lab** - use your existing CloudEndure Migration Account or create a new [CloudEndure Migration Account](https://console.cloudendure.com/#/register/register) and a new <a href="https://docs.cloudendure.com/#Getting_Started_with_CloudEndure/Working_with_Projects/Working_with_Projects.htm#Creating_a_New_Project%3FTocPath%3DNavigation%7CGetting%2520Started%2520with%2520CloudEndure%7CWorking%2520with%2520Projects%7C_____2" target="_blank" rel="noopener noreferrer">CloudEndure Project</a>

    For **AWS Events** - use **CloudEndure Username** and **Password** listed in the <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>.

    ![CloudEndure Credentials](/ce/CE-console-credentials.png)

    If they are not shown on the <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a>, please contact the presenter to provide you with the credentials.

2. Navigate to **Setup & Info** > **AWS Credentials** tab.

    ![CE-configure-AWS-Cred.png](/ce/CE-configure-AWS-Cred.png.png)

3. Click the **EDIT** button and enter **AWS Access Key ID** and **AWS Secret Access Key** 
   
    For **self-paced lab** - copy this information from the **Output** section of the **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>, it will look like on the screenshot below.

    ![CloudEndure IAM Access and Secret Access Key](/ce/ce-self-service-accesskeys.png)

    For **AWS Event** - copy this information from your <A href="https://dashboard.eventengine.run/dashboard" target="_blank" rel="noopener noreferrer">Event Engine - Team Dashboard</a> - **CloudEndure AWS Credentials** section, it will look like on the screenshot below.  

    ![CloudEndure IAM Access and Secret Access Key](/ce/CE-credentials.png)

    Overwrite any values that are already present in **AWS Access Key ID** and **AWS Secret Access Key** fields.

4. Once you entered the **AWS Access Key ID** and **AWS Secret Access Key**, click the **SAVE** button.

### Configure Replication Settings.

Once you save your **AWS Credentials**, you will be automatically redirected to the **Setup & Info** > **REPLICATION SETTINGS** tab, this is where you configure details of the **CloudEndure Replication Server**.

{{% notice note %}}
Before proceeding **refresh the browser** to retrieve the latest information from your AWS account (you can do this by pressing the **F5** button or manually refreshing your browser by clicking on the refresh button).
{{% /notice %}}

![CE-Replication-setting](/ce/CE-Replication-setting.png)

1. Update the configuration of the **REPLICATION SETTINGS** screen to match the values below:

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Migration Source                           | Other Infrastructure                                         |
    | Migration Target                           | AWS US West (Oregon)                                         |
    | Replication Server instance type           | Default                                                      |
    | Converter instance type                    | m5.large                                                     |
    | Dedicated replication servers              | Unchecked                                                    |
    | Subnet for the replication servers         | TargetVPC-public-a |
    | Security Group for the replication servers | Default CloudEndure Security Group                                                     |
    | Use VPN or DirectConnect (using a private IP) | Unchecked                                                |
    | Enable volume encryption                   | Checked                                                     |    
    | Choose the Volume Encryption Key you wish to apply to the Replication Servers' volumes | Default volume encryption key  |
    
    ![CE-BluePrints](/ce/ce-blueprint-details.png)

2. Scroll to the bottom of the screen and click **SAVE REPLICATION SETTINGS** button.

    {{% notice tip %}}
If on top of the screen you see a notice saying that AWS credentials must be refreshed, please refresh the browser (F5).
{{% /notice %}}
