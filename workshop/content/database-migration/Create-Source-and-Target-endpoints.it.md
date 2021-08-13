+++
title = "Crea gli Endopoints di Source e Target"
weight = 30
+++


### Crea gli Endopoints di Source e Target

Sempre nella schermata **AWS DMS**, vai su **Endpoint** e fai clic sul pulsante **Create endpoint**.

1. Crea l'endpoint di origine

    Utilizzare i seguenti parametri per configurare l'endpoint:

    | Parameter           | Value                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - per **laboratorio self-paced** usa le informazioni dalla sezione **Output** del **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">Template CloudFormation</a>, <br>per l'**Evento AWS** - usa il **Database Server IP** dal Event Engine - Team Dashboard   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Apri la sezione **Test endpoint connection (optional)** , quindi nel menu a discesa **VPC** seleziona **TargetVPC** e clicca il bottone **Run test**  per verificare che la configurazione dell'endpoint sia valida.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    Il test verrà eseguito per un minuto e dovresti visualizzare il messaggio **successful** nella colonna **Status** . Fare clic sul pulsante **Create endpoint** per creare l'endpoint.
    
    In caso di errori, assicurarsi di aver configurato correttamente i parametri dell'endpoint e che l'istanza di replica sia stata creata con il parametro **Publicly Accessible** selezionato.

2. Crea l'endpoint di destinazione

    Ripetere tutti i passaggi per creare l'endpoint di destinazione con i seguenti valori di parametro:

    | Parameter           | Value                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | checked                                            |
    | RDS Instance        | Seleziona la tua istanza RDS dal menu a discesa (ise non è visibile inserire i valori manualmente)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (will be pre-populated)                                                |
    | Server Name         | nome DNS della tua database RDS (lascia il valore precompilato)                             |
    | Port                | 3306     (will be pre-populated)                                             |
    | SSL mode            | none                                                  |
    | User name           | (lascia il valore precompilato)                                                 |
    | Password            | Immettere la password utilizzata durante la creazione del database RDS|


3. Nella sezione **Endpoint-specific settings -> Extra connection attributes** copia e incolla i seguenti parametri di connessione:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Sotto **Test endpoint connection (optional)** seleziona **TargetVPC** nel menu a discesda **VPC** e clicca il pulsante **Run test** per verificare che l'endpoint sia valido.

    Il test verrà eseguito per un minuto e alla fine dovresti visualizzare il messaggio **successfull** nella colonna **Status**. Fare clic sul pulsante **Create endpoint** per creare l'endpoint.

In caso di errori, assicurarsi che il **VPC security group** del database RDS consenta il traffico in entrata sulla porta 3306 dal gruppo di sicurezza **AWS DMS Replication Instance** (o ad esempio dall'intero **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Ulteriori test di connessione endpoint possono essere eseguiti dall'elenco **Endpoints** facendo clic sul pulsante **Actions** e quindi **Test connection**.
{{% /notice %}}
