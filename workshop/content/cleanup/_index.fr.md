+++
title = "Nettoyage"
weight = 40
pre = "<b>5. </b>"
+++

Pour le lab effectué à son rythme, assurez-vous de bien avoir supprimé _Toutes_ les ressources que vous avez créé :

1. Dans la <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">Console CloudEndure</a>       
   - Sélectionnez les machines qui ont été migrées (avec case à cocher) et cliquez sur **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Sélectionnez les machines qui ont été migrées (avec case à cocher) et cliquez sur **Machine Actions** -> **Remove 1 Machine from This Console**
  
    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. Dans la <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">Console AWS RDS</a>         
   - Modifiez la **Database** créée pour enlever la protection contre la suppression (Appliquez le changement immédiatement)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)
  
   - Supprimez la **Database** créée (sans sanpshot final et sans conserver les sauvegardes automatiques)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. Dans la <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">Console AWS DMS</a>            
   - Stoppez et (lorqu'en état Stopped) - Supprimez la **tâche**. *Attendre que la tâche soit supprimée*.
   - Supprimez les **"endpoints"**. *attendre que les "endpoints" soient supprimés*.
   - Supprimez l'**instance de réplication**. *attendre que l'instance de réplication soit supprimée*.
   - Supprimez le **"subnet group"** 
  
     Allez sur <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> pour confirmer que tout a bien été supprimé (considérant que vous n'avez jamais utilisé DMS avant, vous devriez voir 0 partout comme sur la copie d'écran ci-dessous).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)
   
4. Dans la <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Console Amazon EFS</a>        
   - Supprimez le **Elastic File Systems**
      
5. Dans <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Supprimez le **service**
   - Supprimez la **"task definition"**
   - Supprimez le **cluster**  

6. Dans la <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">Console AWS EC2</a>      
   - Terminez les **instances EC2** (incluant celle avec un préfix 'CloudEndure' dans leur nom)
   - Supprimez le **Load balancer**

7. Dans <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Supprimer la "stack" **ApplicationMigrationWorkshop**
  
Lorsque la "stack" **ApplicationMigrationWorkshop** est supprimée, vérifiez votre compte AWS et **supprimez toutes les ressources restantes qui ont été créées pendant ce lab**.

Enfin, nous apprécierions que vous donniez <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">votre avis pour ce lab de manière anonyme</a>.