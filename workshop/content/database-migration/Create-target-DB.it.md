+++
title = "Creare il DB Destinazione"
weight = 15
+++

### Database Migration

Le migrazioni del database possono essere eseguite in vari modi e ai fini di questo workshop eseguiremo una migrazione **continuous data replication** usando <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

Prima di configurare **AWS DMS**, dovrai creare il database di destinazione nell’account AWS fornito. Utilizza **AWS Relation Database Service (RDS)** per eseguire questa attività che semplifica la configurazione, il funzionamento e il ridimensionamento di un database relazionale nel cloud.

### Creare il subnet group per il database di destinazione

1. Andare sulla **AWS Console**, da **Services** scegliere **RDS**, selezionare **Subnet groups** dal menu sulla sinistra e seleziona **Create DB Subnet Group**

2. Su **Create DB subnet group** inserire le seguenti informazioni.

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets dove RDS sarà distribuito |
    | VPC      | TargetVPC            |

    Nel pannello **Add subnets** aggiungere una sottorete per ciascuna Availability Zone (us-west-2a and us-west-2b) con CIDRs 10.0.101.0/24 e 10.0.201.0/24, quindi premere il pulsante **Create**.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Creare il database di destinazione

1. Ora selezionare **Databases** dal menu a sinistra e selezionare **Create database**

2. Dal menu **Engine options**, selezionare MySQL con Version MySQL 5.7.33

    ![1](/db-mig/1.png)


    {{% notice note %}}
Puoi confermare la versione MySQL dal database di source usando SQL query - **SELECT@@version;**
{{% /notice %}}


    Nella sezione **Template** selezionare "Free Tier".

    ![Free tier template selection](/db-mig/create-db-select-template.en.png)

    {{% notice note %}}
La scelta del modello "Free Tier" limita le opzioni nei passaggi successivi della procedura guidata, in modo da rimanere entro i limiti del piano gratuito di AWS.
{{% /notice %}}


    Nella sezione **Settings** , configurare l'identificativo dell'istanza Db (e.g. database-1), Master username (e.g. admin) e Master password della nuova istanza di database.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Assicurati di annotare **Master username** e **Master password**, poiché verranno utilizzati in seguito.
{{% /notice %}}

    Selezionare **db.t2.micro** dalla classe di istanze Burstable DB,  **General Purpose (SSD)** per Storage Type e deselezionare "Enable storage autoscaling" (non abbiamo bisogno di più di 20 GB di spazio di archiviazione per questo database).
    ![4_db](/db-mig/4_db.png)



1. Per **Availability & durability**, mantieni l'opzione selezionata **Do not create a standby instance**.

    ![5_db](/db-mig/5_db.png)

    {{% notice note %}}
Per workloads di produzione, si consiglia di abilitare l'istanza di standby per abilitare <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">Multi-AZ Deployment</a> un Alta Affidabilità.
{{% /notice %}}  

4. Nella sezione **Connectivity** :

    * In **Virtual Private Cloud (VPC)**, selezionare **TargetVPC** (questa è <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> creata automaticamente per questo lab)
    * In **Additional connectivity configuration -> VPC Security Group**, selezionare **Create new** VPC security group e dargli un nome (e.g. "DB-SG").
    * Tieni presente che il gruppo di sottoreti database creato in precedenza verrà selezionato automaticamente.

    ![6_db](/db-mig/6_db.png)


    {{% notice note %}}
Nota: Successivamente, modificherai il gruppo di sicurezza DB-SG VPC per assicurarti che l'istanza di replica DMS sia in grado di accedere al database di destinazione e per consentire l'accesso dal tuo server web.
{{% /notice %}}

5. Per **Database authentication**, scegliere **Password authentication**.
6. (Solo per evento ospitato da AWS) In **Additional configuration**, assicurarsi di deselezionare **Enable Enhanced monitoring** sotto la sezione **Monitoring** come indicato di seguito:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
l'utilizzo di <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">Enhanced monitoring</a> è una buona idea per workloads produttivi, durante gli eventi ospitati da AWS, la deselezioniamo a causa delle limitazioni del ruolo IAM fornito per i partecipanti.
{{% /notice %}}

6. Infine, esamina i **Estimated monthly costs** e seleziona il pulsante **Create database** .

   ![8_2_db](/db-mig/8_2_db.png)
