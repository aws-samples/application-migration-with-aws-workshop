+++
title = "Cleanup"
weight = 50
pre = "<b>5. </b>"
+++

Per il laboratorio distribuito autonomamente, alla fine assicurati di eliminare tutte le risorse che hai creato, tra cui:

1. Nella <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">Console CloudEndure </a>       
   - Seleziona le macchine che sono state migrate (con la casella di controllo) e fai clic su **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Seleziona le macchine che sono state migrate (con la casella di controllo) e fai clic su **Machine Actions** -> **Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. Nella Console <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS </a>         
   - Modifica il  **database** creat per rimuovere la funzione  Deletion Protection (aapplica immediatamente le modifiche)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - elimina i **databases** creati (senza snapshot finali e senza conservsare i backups automatici)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. Nella console <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS </a>            
   - Arresta e  (quando è nello stato Stopped ) - elimina le  **tasks** create. *Attendere l'eliminazione dell'attività*.
   - Elimina gli  **endpoints** creati. *Attendere l'eliminazione degli endpoint*.
   - Elimina le  **replication instances** create . *Attendere l'eliminazione delle instanze replicate*.
   - Elimina i  **subnet group** creati.

     Vai sulla  <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> per confermare che tutto è stato eliminato (supponendo che non avessi mai usato DMS prima, dovresti vedere 0 ovunque, come nello screenshot qui sotto).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

4. Nella console <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS </a>        
   - Eliminare l' **Elastic File Systems** creato

5. Nella console <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Elimina i  **services** creati
   - Elimina i  **task definitions** creati
   - Elimina i  **clusters** creati

6. Nella console <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 </a>      
   - Termina le  **EC2 machines** create (comprese quelle con il prefisso 'CloudEndure' nel loro nome)
   - Elimina i  **Load balancers** creati

7. Nella console <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Elimina lo stack **ApplicationMigrationWorkshop** 

Quando lo stack è stato cancellato **ApplicationMigrationWorkshop** , rivedi il tua Account Aws e **elimina tutte le risorse che sono state create durante questo laboratorio**.

Inoltre ti saremo grati se fornissi a  <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">un feedback anonimo per questo workshop</a>.
