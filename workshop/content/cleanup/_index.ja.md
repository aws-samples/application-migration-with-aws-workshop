+++
title = "ハンズオン環境の削除"
weight = 40
pre = "<b>5. </b>"
+++

For the self-paced lab, at the end make sure to delete _all_ resources that you've created, including:

1. In <a href="https://console.cloudendure.com" target="_blank">CloudEndure Console</a>       
   - Select machines that were migrated (with checkbox) and click on **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Select machines that were migrated (with checkbox) and click on **Machine Actions** -> **Remove 1 Machine from This Console**
  
    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. In <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank">AWS RDS Console</a>         
   - Modify created **database** to remove Deletion Protection (apply changes immediately)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)
  
   - Delete created **databases** (without final snapshot and without retaining automated backups)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. In <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank">AWS DMS Console</a>            
   - Stop and (when it's in Stopped state) - delete created **tasks**. *Wait for the task to be deleted*.
   - Delete created **endpoints**. *Wait for endpoints to be deleted*.
   - Delete created **replication instances**. *Wait for the replication instance to be deleted*.
   - Delete created **subnet group** 
  
     Go to <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank">AWS DMS Dashboard</a> to confirm that everything was deleted (assuming you didn't use DMS before, you should see 0's everywhere, like on the screenshot below).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)
   
4. In <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank">Amazon EFS Console</a>        
   - Delete created **Elastic File Systems**
      
5. In <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank">AWS ECS</a>      
   - Delete created **services**
   - Delete created **task definitions**
   - Delete created **clusters**  

6. In <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank">AWS EC2 Console</a>      
   - Terminate created **EC2 machines** (including those with 'CloudEndure' prefix in their name)
   - Delete created **Load balancers**

7. In <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank">AWS CloudFormation</a>            
   - Delete the **ApplicationMigrationWorkshop** stack
  
When the **ApplicationMigrationWorkshop** stack is deleted, review your AWS Account and **delete all remaining resources that were created during this lab**.
