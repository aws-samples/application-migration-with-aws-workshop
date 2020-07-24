+++
title = "Creare il DB Destinazione"
weight = 10
+++

### Database Migration

Le migrazioni del database possono essere eseguite in vari modi e ai fini di questo workshop eseguiremo una migrazione **continuous data replication** usando <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migrations Service (DMS)</a>.

Prima di configurare **AWS DMS**, dovrai creare il database di destinazione nell'account AWS fornito. Utilizza **AWS Relation Database Service (RDS)** per eseguire questa attività che semplifica la configurazione, il funzionamento e il ridimensionamento di un database relazionale nel cloud.

### Creare il subnet group per il database di destinazione

1. Vai sulla **AWS Console**, da **Services** scegli **RDS**, seleziona **Subnet groups** dal menu sulla sinistra e clicca **Create DB Subnet Group**

2. Sul campo **Create DB subnet group** inserisci le seguenti informazioni

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets dove RDS sarà distribuito |
    | VPC      | TargetVPC            |
    
    Nel pannello **Add subnets** aggiungere una sottorete da ciascuna zona di disponibilità (us-west-2a e us-west-2b) con i CIDR 10.0.101.0/24 e 10.0.201.0/24, quindi premere il pulsante **Create**.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Creare il database di destinazione   
    
1. Ora seleziona **Databases** dal menu a sinistra e fai clic su **Create database**

2. Del menu **Engine options**, selezionare MySQL con Version MySQL 5.7.22

    ![1](/db-mig/1.png)


    {{% notice note %}}
È possibile confermare la versione di MySQL di origine dal database di origine utilizzando la query SQL - **SELECT@@version;**
{{% /notice %}}

    Nella sezione **Settings** , configura l'identificatore dell'istanza DB (ad es. Database-1), il nome utente principale (ad es. Admin) e la password principale per la nuova istanza del database.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Assicurati di annotare **Master username** e **Master password**, poiché verranno utilizzati in seguito.
{{% /notice %}}

    Selezionare **db.t3.medium** dalla classe dell'istanza DB Burstable e selezionare **General Purpose (SSD)** per Tipo di archiviazione.
    ![4_db](/db-mig/4_db.png)

3. Per **Availability & durability**, passa a **Do not create a standby instance** per risparmiare sui costi.

    {{% notice note %}}
Per i carichi di lavoro di produzione, si consiglia di abilitare l'istanza di standby <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank">Multi-AZ Deployment</a> per una maggiore disponibilità.
{{% /notice %}}  

    ![5_db](/db-mig/5_db.png)

4. Nella sezione **Connectivity** :

    * In **Virtual Private Cloud (VPC)**, selezionare **TargetVPC** (questa è la <a href="https://aws.amazon.com/vpc/" target="_blank">Amazon Virtual Private Cloud</a> che è stato creato automaticamente per questo laboratorio)
    * In **Additional connectivity configuration -> VPC Security Group**, selezionare **Create new** VPC security group e dargli un nome (e.g. "DB-SG").
    * Si noti che il DB Subnet Group creato in precedenza verrà automaticamente selezionato

    ![6_db](/db-mig/6_db.png)


    {{% notice note %}}
Nota: il gruppo di sicurezza VPC DB-SG verrà modificato in un secondo momento per assicurarsi che l'istanza di replica DMS sia in grado di accedere al database di destinazione e consentire l'accesso dal proprio server Web.
{{% /notice %}}

5. Per **Database authentication**, scegliere **Password authentication**.
6. (Solo eventi ospitati da AWS) Nella sezione **Additional configuration**, assicurati di deselezionare **Enable Enhanced monitoring** sotto la sezione **Monitoring** come indicato di seguito:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
L'utilizzo di <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank">Enhanced monitoring</a> è un'ottima idea per i carichi di lavoro di produzione, durante gli eventi ospitati da AWS lo deselezioniamo a causa delle limitazioni del ruolo IAM che è stato fornito ai partecipanti.
{{% /notice %}}

6. Infine, rivedi i **Costi mensili stimati** e fai clic sul pulsante **Create database**.

   ![8_2_db](/db-mig/8_2_db.png)
