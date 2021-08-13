+++
title = "Bereinigen Ihrer Ressourcen"
weight = 50
pre = "<b>5. </b>"
+++

Für die selbst ausgeführte Workshops, stellen Sie bitte am Ende sicher, 
dass Sie alle von Ihnen erstellten Ressourcen gelöscht haben, einschließlich:

1. Bei <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure Console</a>       
   - Wählen Sie migrierte Server aus und klicken Sie bitte **Machine Actions > Stop Data Replication For 1 Machine**
   - Wählen Sie migrierte Server aus und klicken Sie bitte **Machine Actions > Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. Bei <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS Console</a>         
   - Ändern Sie die erstellte Datenbank und nehmen Sie die **Deletion Protection (apply changes immediately)** aus.
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - Löschen Sie den erstellten Datenbank **databases** (ohne den letzten Snapshot und ohne Beibehaltung von automatisierter Sicherungen)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. Bei <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS Console</a>            
   - Stoppen Sie und (wenn es gestoppt wurde) - löschen Sie erstellte **tasks**. *Wait for the task to be deleted*.
   - Löschen Sie die **endpoints**. *Wait for endpoints to be deleted*.
   - Löschen Sie die **replication instances**. *Wait for the replication instance to be deleted*.
   - Löschen Sie die **subnet group**

     Besuchen Sie <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> 
     um zu bestätigen, dass alles gelöscht wurde (vorausgesetzt, Sie haben DMS zuvor nicht verwendet, sollten Sie überall 
     Nullen sehen, wie im folgenden Screenshot).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

4. Bei <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS Console</a>        
   - Löschen Sie die **Elastic File Systems**

5. Bei <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Löschen Sie die erstellten **services**
   - Löschen Sie die erstellten **task definitions**
   - Löschen Sie die erstellten **clusters**  

6. Bei <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 Console</a>      
   - Löschen Sie die erstellten **EC2 machines** (including those with 'CloudEndure' prefix in their name)
   - Löschen Sie den erstellten **Load balancers**

7. Bei <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Löschen Sie **ApplicationMigrationWorkshop** CloudFormation Stack

Wenn Sie den **ApplicationMigrationWorkshop** CloudFormation-Stack gelöscht haben, überprüfen Sie bitte Ihr AWS Account 
und **löschen Sie alle verbleibenden Ressourcen, die während dieser Übung erstellt wurden**.

Darüber hinaus würden wir uns freuen, wenn Sie ein <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">anonymes Feedback zu diesem Workshop</a> 
abgeben würden.

