+++
title = "Database Migration"
weight = 10
pre = "<b>1. </b>"
+++

In this section, you will perform a database migration using the source MySQL database to a target Amazon RDS for MySQL database with **AWS Database Migration Service**. Since this is a homogeneous database migrations (the source and target database engines are the same) - the schema structure, data types, and database code are compatible between the source and target databases, which means that this kind of migration doesn't require any schema conversion.

![1](/db-mig/DMS-overview.png)

You can learn more details about this service by watching the video below.

<center><iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/zb4GcjEdl8U" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></center>

In this lab, you will perform the following steps:


1. [Set Up Networking]({{< ref "/setup_network.en.md" >}})

2. [Create Target DB]({{< ref "/Create-target-DB.en.md" >}})

2. [Create Replication Instance]({{< ref "Create-Replication-instance.en.md" >}})

3. [Create Source and Target Endpoints]({{< ref "Create-Source-and-Target-endpoints.en.md" >}})

4. [Configure Source Database]({{< ref "configure_source_database.en.md" >}})

4. [Create and Run Replication Task]({{< ref "Create-and-run-Replication-task.en.md" >}})

5. [Summary]({{< ref "Summary.en.md" >}})
