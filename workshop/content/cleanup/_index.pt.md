+++
title = "Limpeza"
weight = 50
pre = "<b>5. </b>"
+++

Para quem está executando o lab sozinho, certifique-se de apagar _todos_ os recursos criados, incluindo:

1. Na <a href="https://console.cloudendure.com" target="_blank" rel="noopener noreferrer">CloudEndure Console</a>       
   - Selecione as máquinas que foram migradas (com checkbox) e clique em **Machine Actions** -> **Stop Data Replication For 1 Machine**
   - Selecione as máquinas que foram migradas (pelo checkbox) e clique em **Machine Actions** -> **Remove 1 Machine from This Console**

    ![CloudEndure Migration Remove Servers](/cleanup/ce-stop-remove-from-console.eng.png)

2. Na <a href="https://us-west-2.console.aws.amazon.com/rds/home?region=us-west-2#databases:" target="_blank" rel="noopener noreferrer">AWS RDS Console</a>         
   - Modifique a **database** criada para remover o Deletion Protection (apply changes immediately)
    ![RDS Remove Deletion Protection](/cleanup/db-remove-deletion-protection.en.png)

   - Delete as **databases** criadas (sem snapshot final e sem reter backups)
    ![RDS Confirm Deletion](/cleanup/db-delete-confirm.en.png)

3. Na <A href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#replicationInstances" target="_blank" rel="noopener noreferrer">AWS DMS Console</a>            
   - Pare e (quando estiver em estado Stopped) apague as **tasks**. *Espere a task ser apagada*.
   - Delete os **endpoints** criados. *Espere os endpoints serem apagados*.
   - Delete as **replication instances**. *Espere as replication instances serem apagadas*.
   - Delete os **subnet group**

     Vá para <a href="https://us-west-2.console.aws.amazon.com/dms/v2/home?region=us-west-2#dashboard" target="_blank" rel="noopener noreferrer">AWS DMS Dashboard</a> e confirme que tudo foi apagado (assumindo que você não usou o  DMS antes, você deve ver 0s em tudo, como na imagem abaixo).
     ![DMS Dashboard confirmation](/cleanup/dms-dashboard-final.en.png)

4. Na <a href="https://us-west-2.console.aws.amazon.com/efs/home?region=us-west-2" target="_blank" rel="noopener noreferrer">Amazon EFS Console</a>        
   - Delete o **Elastic File Systems** criado

5. No <a href="https://us-west-2.console.aws.amazon.com/ecs/home?region=us-west-2#/getStarted" target="_blank" rel="noopener noreferrer">AWS ECS</a>      
   - Delete os **services** criados
   - Delete os **task definitions** criados
   - Delete os **clusters**  criados

6. Na <a href="https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Home:" target="_blank" rel="noopener noreferrer">AWS EC2 Console</a>      
   - Termine as **EC2 machines** criadas (incluindo as com prefixo 'CloudEndure' no nome)
   - Delete os **Load balancers** criados

7. No <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/stacks" target="_blank" rel="noopener noreferrer">AWS CloudFormation</a>            
   - Delete a stack **ApplicationMigrationWorkshop**

Quando a stack **ApplicationMigrationWorkshop** for apagada, revise sua conta AWS e **apague todos os recursos adicionais criados durante este lab**.

Agradecemos se você puder dar a <a href="https://amazonmr.au1.qualtrics.com/jfe/form/SV_0dfrnubGKXavgR7" target="_blank" rel="noopener noreferrer">sua opinião anônima sobre este workshop</a>.
