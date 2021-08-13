+++
title = "Enable Migration Hub"
weight = 50
+++

#### AWS Migration Hub

<a href="https://aws.amazon.com/migration-hub/" target="_blank" rel="noopener noreferrer">AWS Migration Hub</a> provides a single location to track the progress of application migrations across multiple AWS and partner solutions.

To enable it, inside **AWS Console** go to **Services -> AWS Migration Hub**, then from the left menu click on **Migrate** and select **US West Oregon** as your home region.

![Migration Hub - choose home region](/intro/migration-hub-choose-home-region.png)

Then click on **Migrate -> Tools** to select tools that will provide updates to **AWS Migration Hub**. CloudEndure Migration is already working out of the box, but you need to configure integration with **AWS Database Migration Service**.

Scroll to the bottom of the page and click on the **Connect** button in the **AWS Database Migration Service card**.

![Migration Hub - connect DMS](/intro/migration-hub-connect-dms.png)

In a matter of seconds, the status of integration should change from **Not connected**, to **Connected**.

![Migration Hub - connected DMS](/intro/migration-hub-connect-dms-connected.png)

That's it, all your future activities in **CloudEndure Migration** and **AWS Database Migration Service** will be reported through the **AWS Migration Hub** dashboard.
