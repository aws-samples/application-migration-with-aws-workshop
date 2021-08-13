+++
title = "Création de la base de données cible"
weight = 10
+++

### Migration de base de données

Les migrations de bases de données peuvent être réalisées de différentes manières. Dans le cadre de ce workshop, nous allons effectuer une migration avec **réplication continue des données** en utilisant <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

Avant de configurer **AWS DMS**, vous allez devoir créer votre base de données cible dans votre compte AWS ou le compte AWS fourni. Vous Utiliserez **AWS Relation Database Service (RDS)** pour réaliser cette tâche. AWS RDS permet de simplifer l'installation, la gestion et l'évolution des bases de données relationnelles dans le cloud.

### Création du "subnet group" pour la base de données cible

1. Aller dans **AWS Console**, depuis **Services** choisissez **RDS**, sélectionnez **Subnet groups** à partir du menu sur la gauche et cliquez **Create DB Subnet Group**

2. Sur **Create DB subnet group** entrez les informations suivantes

    | Parameter           | Value                    |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets where RDS will be deployed |
    | VPC      | TargetVPC            |
    
    Dans le panneau **Add subnets** ajoutez un "subnet" pour chaque "availability zone" (us-west-2a et us-west-2b) avec les CIDRs 10.0.101.0/24 and 10.0.201.0/24, puis pressez sur le bouton **Create**.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    

### Création de la base e données cible   
    
1. Maintenant sélectionnez **Databases** à partir du menu de gauche et cliquez sur **Create database** 

2. Dans **Engine options**, sélectionnez MySQL et Version MySQL 5.7.33

    ![1](/db-mig/1.png)


    {{% notice note %}}
Vous pouvez confirmer la version source MySQL à partir de la base de données source en exécutant la requête SQL - **SELECT@@version;**
{{% /notice %}}


    Dans la section **Template** sélectionnez "Free Tier".

    ![Free tier template selection](/db-mig/create-db-select-template.en.png)

    {{% notice note %}}
Choisir le modèle "Free Tier" limite les options dans les étapes suivantes du "wizard" et vous permettra de rester dans les limites du "Free Tier" AWS.
{{% /notice %}}


    Dans la section **Settings**, configurez l'identifiant de la base de données (e.g. database-1), Master username (ex : admin) et le Master password pour votre instance de base de données.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Assurez vous de noter les **Master username** et **Master password**, vous en aurez besoin plus tard.
{{% /notice %}}

    Sélectionnez **db.t2.micro** dans la classe des instances DB "Burstable",  **General Purpose (SSD)** pour le type de stockage et décochez "Enable storage autoscaling" (nous n'avons pas besoin de plus de 20GB de stockage pour cette base de données).
    ![4_db](/db-mig/4_db.png)

    

1. Pour **Availability & durability**, gardez l'option **Do not create a standby instance** sélectionnée.

    ![5_db](/db-mig/5_db.png)

    {{% notice note %}}
Pour les environnements de production, nous recommandons d'activer l'instance de "standby" afin d'assurer avec le <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">Multi-AZ Deployment</a> une disponibilité plus élevée.
{{% /notice %}}  

4. dans la section **Connectivity** :

    * Dans **Virtual Private Cloud (VPC)**, sélectionnez **TargetVPC** (c'est le <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> qui a été automatiquement créé pour ce lab)
    * Dans **Additional connectivity configuration -> VPC Security Group**, sélectionnez **Create new** "VPC security group" et donner lui un nom (ex : "DB-SG").
    * Notez que le "DB Subnet group" que vous avez créé précédemment est sélectionné automatiquement.

    ![6_db](/db-mig/6_db.png)


    {{% notice note %}}
Note: Vous devrez éditer le DB-SG "VPC security group" plus tard afin de vous assurer que l'instance de réplication DMS peut accéder à la base de données cible et pour autoriser l'accès à partir de votre serveur web.
{{% /notice %}}

5. Pour **Database authentication**, choisissez **Password authentication**.
6. (Pour le lab réalisé dans le cadre d'un évènement AWS seulement) Dans **Additional configuration**, assurez-vous de décocher **Enable Enhanced monitoring** sous la section **Monitoring** comme indiqué ci-dessous :

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Utiliser <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Monitoring.OS.html" target="_blank" rel="noopener noreferrer">"Enhanced monitoring"</a> est une excellente pratique pour les environnements de production, dans le cadre des évènement AWS nous le déselectionnons à cause des limitations des rôles IAM provisionnés pour les participants. 
{{% /notice %}}

6. Finalement, vérifiez les **Estimated monthly costs** et cliquez sur le bouton **Create database**. 

   ![8_2_db](/db-mig/8_2_db.png)
