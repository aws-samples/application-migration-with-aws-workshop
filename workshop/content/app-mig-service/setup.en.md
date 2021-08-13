+++
title = "Initial setup"
weight = 20
+++

In order to use **AWS Application Migration Service**, you must create a Replication Server template. The template defines configuration of the server, that is responsible for receiving data sent by Application Migration Service agents and persisting the data on EBS volumes in your AWS account.

1. Go to <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2" target="_blank" rel="noopener noreferrer">AWS Application Migration Service console</a>
2. Click on **Get started** button
3. Populate **Set up Application Migration Service** screen with the following value

    | Parameter                                  | Value                                                        |
    | ------------------------------------------ | ------------------------------------------------------------ |
    | Staging area subnet                    | TargetVPC-public-a        |
    
    This is the subnet where AWS Application Migration Service will create Replication Servers.

    Use default values for other parameters (click on the **Info** link next to them to understand their purpose).

    ![Initial setup](/app_mig_serv/setup.en.png)

4. Click **Create template** button

{{% notice note %}}
You can always change **Replication Settings template** for given AWS region in the <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/settings" target="_blank" rel="noopener noreferrer">Settings</a> screen.
{{% /notice %}}   

Now we can go to the next step, so [installation of Application Migration Service agent]({{< ref "/install_agent.en.md" >}}) on the source webserver.