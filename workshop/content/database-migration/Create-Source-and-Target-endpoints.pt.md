+++
title = "Crie Endpoints para Origem e Destino"
weight = 30
+++


### Crie endpoints para origem e destino

Ainda na tela do **AWS DMS**, vá para **Endpoints** e clique em **Create endpoint**.

1. Crie o source endpoint (origem)

    Use os seguintes parâmetros:

    | Parameter           | Value                                          |
    | ------------------- | ---------------------------------------------- |
    | Endpoint type       | Source endpoint                                |
    | Endpoint identifier | source-endpoint                                |
    | Source engine       | mysql                                          |
    | Server name         | Source Environment - para **quem está rodando o lab por conta própria** use a informação da seção **Output** do **ApplicationMigrationWorkshop** <a href="https://us-west-2.console.aws.amazon.com/cloudformation/home?region=us-west-2#/" target="_blank" rel="noopener noreferrer">CloudFormation Template</a>, <br>para **Eventos AWS** - use **Database Server IP** presente no Event Engine - Team Dashboard   |
    | Port                | 3306                                           |
    | SSL mode            | none                                           |
    | User name           | wordpress-user                                 |
    | Password            | AWSRocksSince2006                                   |

    ![source-endpoint](/db-mig/source-endpoint.png)

    Abra a seção **Test endpoint connection (optional)**, na lista **VPC** selecione **TargetVPC** e clique em **Run test** para verificar a configuração do endpoint.

    ![test-source-endpoint](/db-mig/test-source-endpoint.png)

    O teste rodará por um minuto e você deve ver a mensagem **successful** na coluna **Status**. Clique em **Create endpoint** para criar o endpoint.
    
    No caso de erros - verifique se os parâmetros do endpoint estão corretos e se a Replication Instance foi criada com a opção **Publicly Accessible** selecionada.

2. Crie o target endpoint (destino)

    Repita os passos para criar o target endpoint com os seguintes parâmetros:

    | Parameter           | Value                                                 |
    | ------------------- | ----------------------------------------------------- |
    | Endpoint type       | Target endpoint                                       |
    | Select RDS DB instance | marcado                                            |
    | RDS Instance        | Selecione sua RDS instance da lista (if it's not visible enter values manually)          |
    | Endpoint Identifier | target-endpoint                                       |
    | Target Engine       | mysql (será pré-preenchido)                                                |
    | Server Name         | Nome DNS da sua RDS database (deixe o valor pré-preenchido)                             |
    | Port                | 3306     (será pré-preenchido)                                             |
    | SSL mode            | none                                                  |
    | User name           | (deixe o valor pré-preenchido)                                                 |
    | Password            | Entre a senha usada por você durante a criação da RDS database|


3. Em **Endpoint-specific settings -> Extra connection attributes** copie e cole os seguintes parâmetros:

    ```
    parallelLoadThreads=1; initstmt=SET FOREIGN_KEY_CHECKS=0
    ```

4. Em **Test endpoint connection (optional)** selecione **TargetVPC** no menu **VPC** e clique o botão **Run test** para verificar o endpoint.

    O teste rodará por um minuto e você deverá ver a mensagem **successful** na coluna **Status**. Clique no botão **Create endpoint** para criar o endpoint.

Em caso de erros, verifique que o **VPC security group** da sua RDS database permite tráfego de entrada na porta 3306 a partir do security group **AWS DMS Replication Instance** (ou a partir de toda a **TargetVPC** - 10.0.0.0/16).

{{% notice note %}}
Testes de conexão com endpoint adicionais podem ser executados em **Endpoints**, clicando em **Actions** e então **Test connection**.
{{% /notice %}}
