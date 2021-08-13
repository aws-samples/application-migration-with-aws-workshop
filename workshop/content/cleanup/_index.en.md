+++
title = "Cleanup"
weight = 50
pre = "<b>4. </b>"
+++

For the self-paced lab, at the end make sure to delete _all_ resources that you've created, including:

1. In <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure Console</a>       
   - Select machines that were migrated (with checkbox) and click on **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Select machines that were migrated (with checkbox) and click on **Machine Actions** -> **Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

9. In <a href="https://us-west-2.console.aws.amazon.com/mgn/home?region=us-west-2#/sourceServers" target="_blank" rel="noopener noreferrer">AWS Application Migration Service</a>
   - Select server and click on **Actions** -> **Mark as archived**, confirming archiving

10. In <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS Console</a>         
   - Modify created **database** to remove Deletion Protection (apply changes immediately)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - Delete created **databases** (without final snapshot and without retaining automated backups)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

11. In <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS Console</a>            
   - Stop and (when it's in Stopped state) - delete created **tasks**. *Wait for the task to be deleted*.
   - Delete created **endpoints**. *Wait for endpoints to be deleted*.
   - Delete created **replication instances**. *Wait for the replication instance to be deleted*.
   - Delete created **subnet group**

     Go to <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> to confirm that everything was deleted (assuming you didn't use DMS before, you should see 0's everywhere, like on the screenshot below).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

12. In <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS Console</a>        
   - Delete created **Elastic File Systems**

13. In <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Delete created **services**
   - Delete created **task definitions**
   - Delete created **clusters**  

14. In <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 Console</a>      
   - Terminate created **EC2 machines** (including those with 'CloudEndure' prefix in their name)
   - Delete created **Load balancers**

15. In <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Delete the **ApplicationMigrationWorkshop** stack

16. In <a href="https://us-west-2.console.aws.amazon.com/elasticbeanstalk/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">AWS Elastic Beanstalk</a>            
   - Delete the created **Application** 
   

When the **ApplicationMigrationWorkshop** stack is deleted, review your AWS Account and **delete all remaining resources that were created during this lab**.

Additionally we would appreciate if you would provide <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">anonymous feedback for this workshop</a>.
