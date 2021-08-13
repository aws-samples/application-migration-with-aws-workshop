+++
title = "Creëer de database in de doelomgeving"
weight = 15
+++

### Database Migratie

Database migraties kunnen worden uitgevoerd op een aantal manieren. In deze workshop gebruiken wij **continuous data replication** migratie via <a href="https://aws.amazon.com/dms/" target="_blank" rel="noopener noreferrer">AWS Database Migrations Service (DMS)</a>.

### Creëer de subnet groep voor de database in de doelomgeving

1. Ga naar het **AWS Console**, onder **Services** kies **RDS**, selecteer **Subnet groups** van het menu aan de linkerkant en druk op **Create DB Subnet Group**

2. Onder **Create DB subnet group** voer de onderstaande informatie in:

    | Parameter           | Waarde                   |
    | ------------------- | ------------------------ |
    | Name                | database-subnet-group     |
    | Description         | Subnets where RDS will be deployed |
    | VPC      | TargetVPC            |

    Onder **Add subnets** voeg een subnet van iedere Availability Zone toe (us-west-2a and us-west-2b) met CIDRs 10.0.101.0/24 en 10.0.201.0/24, en druk dan op de **Create** knop.

    ![RDS Subnet group creation](/db-mig/db-subnet-group.en.png)    


### Creëer de database in de doelomgeving

Voordat je **AWS DMS** configureert, dien je eerst de database in de doelomgeving te creëren in je **AWS account**. Gebruik **AWS Relation Database Service (RDS)** om deze taak uit te voeren. Deze optie maakt het makkelijk om een database op te zetten, beheren en op te schalen in de AWS cloud.

1. Selecteer **Databases** uit het menu aan de linkerkant en druk op **Create database**

2. Onder **Engine options**, kies **MySQL** en versie **MySQL 5.7.33**

    ![1](/db-mig/1.png)


    {{% notice note %}}
Je kunt de informatie over de MySQL versie van de database in de bronomgeving vinden via deze SQL query: **SELECT@@version;**
{{% /notice %}}

    Onder **Template** secteer "Free Tier".

    ![Free tier template selection](/db-mig/create-db-select-template.en.png)

    {{% notice note %}}
Door het kiezen van **Free Tier** heb je minder configuratieopties beschikbaar in de volgende stappen.
{{% /notice %}}

    In de **Settings** sectie, configureer de **DB instance identifier** (b.v. database-1), Master username (b.v. admin) en het Master password voor jouw nieuwe database instance.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Onthoudt de **Master username** en het **Master password** goed, want deze heb je nodig in een latere stap.
{{% /notice %}}

    Selecteer **db.t3.medium** van de **standard DB instance class**, selecteer **General Purpose (SSD)** voor opslagtype en zet **Enable storage autoscaling** uit. (We hebben niet meer dan 20 GB opslagruimte nodig voor deze database).
    ![4_db](/db-mig/4_db.png)

3. Voor **Availability & durability**, laat de standaardwaarde voor **Do not create a standby instance** staan.

    {{% notice note %}}
Voor echte migraties, is altijd beter en veiliger om een <a href="https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html" target="_blank" rel="noopener noreferrer">multi-AZ database</a> te gebruiken.
{{% /notice %}}  
 
    ![5_db](/db-mig/5_db.png)

4. In de **Connectivity** sectie:

    * In **Virtual Private Cloud (VPC)**, selecteer **TargetVPC** (dit is een <a href="https://aws.amazon.com/vpc/" target="_blank" rel="noopener noreferrer">Amazon Virtual Private Cloud</a> die automatisch aangemaakt is voor deze workshop)
    * In **Additional connectivity configuration** -> **VPC Security Group**, selecteer **Create new VPC security group** en geef het een naam (b.v. "DB-SG").

    ![6_db](/db-mig/6_db.png)

    {{% notice note %}}
Let op: Later ga je deze **VPC security group** aanpassen zodat de **DMS Replication Instance** toegang heeft tot de database in de doelomgeving en om  toegang te geven voor jouw Webserver.
{{% /notice %}}

5. Voor de **Database authentication**, kies **Password authentication**.

6. (Aleen voor AWS Events) In de **Additional configuration**, deactiveer **Enable Enhanced monitoring** onder de **Monitoring** sectie zoals onderstaand is afgebeeld:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Zorg dat je **Enable Enhanced monitoring** deactiveert, anders kun ja een foutmelding krijgen omdat je geen IAM role kunt creëren in deze workshop.
{{% /notice %}}

6. Tot slot, observeer de **Estimated monthly costs** en klik op de **Create database** knop.

   ![8_2_db](/db-mig/8_2_db.png)
