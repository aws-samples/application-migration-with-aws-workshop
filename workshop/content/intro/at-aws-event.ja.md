+++
title = "Running the workshop at an AWS Event"
date = 2019-10-24T10:02:15+02:00
weight = 30
+++

{{% notice warning %}}
Only complete this section if you are at an AWS hosted event (such as re:Invent, Gameday, Workshop, or any other event hosted by an AWS employee). If you are running the workshop on your own, go to: [Start the workshop on your own]({{< ref "/on-your-own.ja.md" >}})
{{% /notice %}}

### Access the Dashboard

Section below describes how to access information about your source environment, when the workshop is run on an AWS Event.

- Go to <a href="https://dashboard.eventengine.run/" target="_blank">https://dashboard.eventengine.run/</a>

- Enter the 12 digit team hash that was given to you


  ![dashboard-hash](/intro/dashboard-hash.png)



### Access the Source Environment

In the **Migration GameDay** module, under the **Outputs** section, the dashboard will show details about the **Source environment** as below:

  ![dashboard-output](/intro/src-env-output.png)


### Access AWS Account

To access your AWS account, click on the **AWS Console** button as indicated below:


![dashboard-AWS-console](/intro/dashboard-aws-console.png)



A pop up window will ask you to choose either **Open Console** (to open the AWS Console in the current browser) or **Copy Login Link** (to paste it into another browser).  
{{% notice note %}}
Open AWS Console _before_ proceeding to the next step.
{{% /notice %}}

![dashboard-console-login](/intro/dashboard-console-login.png)


{{% notice note %}}
The credentials in the pop-up window can be utilized if you want to use the AWS CLI (<a href="https://aws.amazon.com/cli/" target="_blank">Command Line Interface</a> instead of the AWS console. **Don't** enter those credentials into CloudEndure AWS Credentials tab (as they will NOT work there).
{{% /notice %}}

Now you can enable [AWS Migration Hub]({{< ref "/migration-hub.ja.md" >}})
