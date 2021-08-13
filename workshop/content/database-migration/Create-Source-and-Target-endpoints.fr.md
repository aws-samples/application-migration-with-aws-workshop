+++
title = "Création des endpoints source et destination"
weight = 30
+++


### Création des endpoints source et destination

Retournez dans la console AWS, sur l'écran **AWS Database Migration Sercice**, cliquez sur les boutons  **Endpoints** et **Create endpoint**.

1. Créez le **source endpoint**

    Utilisez les paramètres suivants pour créer le "endpoint":

    | Parameter           | Value                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - Pour **le lab effectué de manière indépendante** utilisez les informations dans la section **Output** du "template' **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation</a>, <br>pour **le lab effectué dans le cadre d'un évènement AWS** - utilisez les informations **Database Server IP** de Event Engine - Team Dashboard   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Ouvrez la section **Test endpoint connection (optional)** , puis dans la liste déroulante **VPC** sélectionnez **TargetVPC** et cliquez sur le bouton **Run test** pour vérifier que votre configuration "endpoint" est valide. 

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    Le test va s'exécuter pendant une minute et à la fin, vous devriez voir le message **successful** dans la colonne **Status**. Cliquez sur le bouton **Create endpoint** pour créer le "endpoint".
    
    En cas d'erreurs - assurez-vous d'avoir correctement configuré le "endpoint" et que l'instance de réplication a été créée avec les paramètre **Publicly Accessible** coché.

2. Créer le **target endpoint**

    Répétez toutes les étapes pour créer le "endpoint" cible avec les paramètres suivants :

    | Parameter           | Value                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | checked                                            |
    | RDS Instance        | Select your RDS instance from the drop-down (if it's not visible enter values manually)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (will be pre-populated)                                                |
    | Server Name         | DNS name of your RDS database (leave the the pre-populated value)                             |
    | Port                | 3306     (will be pre-populated)                                             |
    | SSL mode            | none                                                  |
    | User name           | (leave the pre-populated value)                                                 |
    | Password            | Enter password you used when you creating the RDS database|


3. Dans **Endpoint-specific settings -> Extra connection attributes** copiez-collez les paramètres de connexion suivants :

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Dans **Test endpoint connection (optional)** sélectionnez **TargetVPC** dans la liste déroulante **VPC** et cliquez sur le bouton **Run test** pour vérifier que votre "endpoint" est valide.

    Le test va s'exécuter durant une minute et à la fin, vous devriez voir le message **successful** dans la colonne **Status**. Cliquez sur le bouton **Create endpoint** pour créer le "endpoint".

En cas d'erreur, assurez-vous que le **VPC security group** de votre base de données RDS accepte le traffic entrant sur le port 3306 à partir du "security group" de **L'instance de réplication DMS** (ou par exemple à partir de tout le **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Des tests additionnels de connexion des "endpoints" peuvent être réalisés à partir de la liste des **Endpoints** en cliquant sur le bouton **Actions** puis sur **Test connection**.
{{% /notice %}}
