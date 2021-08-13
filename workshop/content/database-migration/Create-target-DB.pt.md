+++
title = "Criar banco de dados destino"
weight = 10
+++

### Migração de Banco de Dados

Migração de bancos de dados podem ser executadas de diversas maneiras, para o propósito deste workshop iremos realizar uma migração com  **replicação contínua de dados** usando o <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

Antes de configurar o **AWS DMS**, você precisará criar um banco de dados de destino na conta AWS. Use o **AWS Relational Database Service (RDS)** para executar esta atividade, já que ele torna fácil configurar, operar e escalar um banco de dados relacional na nuvem.

### Crie o Subnet Group para o banco de dados de destino

1. Vá para a **AWS Console**, a partir de **Services** escolha **RDS**, selecione **Subnet groups** a partir do menu à esquerda e clique **Create DB Subnet Group**

2. No **Create DB subnet group** entre a seguinte informação

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets where RDS will be deployed |
    | VPC      | TargetVPC            |
    
    No painel **Add subnets** adicione uma subnet para cada Availability Zone (us-west-2a and us-west-2b) com CIDRs 10.0.101.0/24 e 10.0.201.0/24, então pressione o botão **Create**.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Crie o banco de dados de destino    
    
1. Agora selecione **Databases** no menu à esquerda e clique **Create database** 

2. A partir de **Engine options**, selecione MySQL e Version MySQL 5.7.33

    ![1](/db-mig/1.png)


    {{% notice note %}}
Você pode confirmar a versão do MySQL origem usando SQL a query - **SELECT@@version;**
{{% /notice %}}

    In the **Settings** section, configure the DB instance identifier (e.g. database-1), Master username (e.g. admin) and Master password for your new database instance.


    ![3_db](/db-mig/3_db.png)

    {{% notice %}}
Anote o **Master username** e o **Master password**, você os usará daqui a pouco.
{{% /notice %}}

    Selecione **db.t3.medium** como instância e selecione **General Purpose (SSD)** como tipo de Storage.
    ![4_db](/db-mig/4_db.png)

3. Em **Availability & durability**, escolha **Do not create a standby instance** para economizar custos. 

    {{% notice note %}}
Para cargas em produção, recomendamos habilitar a instância standby usando<a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">Multi-AZ Deployment</a> para uma alta disponibilidade.
{{% /notice %}}  

    ![5_db](/db-mig/5_db.png)

4. Na seção **Connectivity**:

    * Em **Virtual Private Cloud (VPC)**, selecione **TargetVPC** (esta é a <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> criada automaticamente para este lab)
    * Em **Additional connectivity configuration -> VPC Security Group**, selecione **Create new** VPC security group e dê nome a ele (ex. "DB-SG").
    * Note que o DB Subnet group criado anteriormente estará automaticamente selecionado

    ![6_db](/db-mig/6_db.png)


    {{% notice note %}}
Nota: Você editará o DB-SG VPC security group mais tarde para garantir que o DMS Replication Instance possa acessar o banco de dados destino e para permitir acesso do seu Webserver.
{{% /notice %}}

5. Em **Database authentication**, escolha **Password authentication**.
6. (Somente se você estiver num evento organizado pela AWS) Em **Additional configuration**, desmarque **Enable Enhanced monitoring** na seção **Monitoring** como indicado abaixo:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Usar o <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">Enhanced monitoring</a> é uma boa ideia para ambientes de produção, durante um evento organizado pela AWS nós desmarcamos esta opção por conta de limitação na role IAM provisionada.
{{% /notice %}}

6. Finalmente, cheque o **Estimated monthly costs** e clique no botão **Create database**.

   ![8_2_db](/db-mig/8_2_db.png)
