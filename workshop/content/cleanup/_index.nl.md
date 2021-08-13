+++
title = "Opruimen van resources"
weight = 50
pre = "<b>5. </b>"
+++

Indien je deze workshop zelfstandig hebt gedaan, verzeker jezelf ervan achteraf **alle** resoursces die zijn aangemaakt ook weer op te ruimen om verdere kosten te voorkomen, inclusief:

1. In het <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure Console</a>       
   - Selecteer machines van de migratie (markeren via de checkbox) en klik op **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Selecteer machines in de doelomgeving (markeren via de checkbox) en klik op **Machine Actions** -> **Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. In het <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS Console</a>         
   - Wijzig de gecreëerde **database** en zet **Deletion Protection** uit (activeer de wijziging direct)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - Verwijder gecreëerde **databases** (zonder **final snapshot** en zonder backups te bewaren)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. In het <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS Console</a>            
   - Stop en (nadat het gestopt is) - verwijder de gecreëerde **tasks**. *Wacht totdat de taak daadwerkelijk verwijderd is*.
   - Verwijder de **endpoints**. *Wacht totdat de endpoints daadwerkelijk verwijderd zijn*.
   - Verwijder de **replication instances**. *Wacht totdat de replication instance daadwerkelijk verwijderd is*.
   - Verwijder de **subnet group**

     Ga naar <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> en verzeker je ervan dat alles verwijderd is. Indien je DMS niet eerder hebt gebruikt dan voordat je aan deze workshop begon, dan zou alles op nul (0) moeten staan zoals hieronder afgebeeld:
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

4. In het <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS Console</a>        
   - Verwijder het aangemaakte **Elastic File Systems**

5. In <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Verwijder de **services**
   - Verwijder de **task definitions**
   - Verwijder de **clusters**  

6. In het <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 Console</a>      
   - Verwijder (**Terminate**) de aangemaakte **EC2 machines** (inclusief die met 'CloudEndure' in de naam)
   - Verwijder de **Load balancers**

7. In <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Verwijder de **ApplicationMigrationWorkshop** stack

Zodra de **ApplicationMigrationWorkshop** stack is verwijderd, bekijk nogmaals je AWS Account in detail en **verwijder alle overgebleven resources die tijdens dit lab zijn aangemaakt**.

Tot slot vragen wij jou graag om on anoniem feedback te geven over deze workshop via <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">deze link</a>.