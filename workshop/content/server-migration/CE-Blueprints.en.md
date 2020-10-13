+++
title = "Prepare Blueprint(s)"
weight = 30
+++

While the instances are being replicated, let's configure a **CloudEndure Target Machine Blueprint**, which is the specification of your Target machine (replicated instance) that will be launched in AWS. It includes parameters such as machine type (for example t3.medium), **subnet** where the machine should be running, **private IP** address and disk types.

To configure the Blueprint, go to the **Machines** tab and click on the name of the machine that you want to configure. Then navigate to the **BLUEPRINT** section.

![CE-BluePrints](/ce/CE-BluePrints.png)

Provide the following information:

| Parameter                                  | Value                                                        |
| ------------------------------------------ | ------------------------------------------------------------ |
| Machine Type                           | t3.small                                    |
| Launch Type                            | On demand 
| Target subnet                          | TargetVPC-public-subnet-b                                       |
| Security group                         | Create new |
| Private IP                             | Create new |
| Tags                                    | Add a 'Name' Tag with value 'Webserver' |


Everything else will be left as default, but review it to understand the available configuration options available for your target instance.

{{% notice warning %}}
If you're going through this workshop on an AWS Event, you must select **Machine type** not larger than *.large, otherwise your IAM privileges will prevent you from operating on created instances later in the workshop.
{{% /notice %}}



{{% notice tip %}}
If you don't see input fields on the BLUEPRINT page or it's hard to scroll through them, scale down your screen (Control -).
{{% /notice %}}

When done, click the **SAVE BLUEPRINT** button at the bottom of the page.