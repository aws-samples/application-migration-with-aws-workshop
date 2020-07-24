+++
title = "Creëer de database in de doelomgeving"
weight = 10
+++

### Database Migratie

Database migraties kunnen worden uitgevoerd op een aantal manieren. In deze workshop gebruiken wij **continuous data replication** migratie via <a href="https://aws.amazon.com/dms/" target="_blank">AWS Database Migrations Service (DMS)</a>.

### Creëer de database in de doelomgeving

Voordat je **AWS DMS** configureert, dien je eerst de database in de doelomgeving te creëren in je **AWS account**. Gebruik **AWS Relation Database Service (RDS)** om deze taak uit te voeren. Deze optie maakt het makkelijk om een database op te zetten, beheren en op te schalen in de AWS cloud.

1. Ga naar het **AWS Console**, en onder **Services** kies **RDS** en druk op **Create database**

2. Onder **Engine options**, kies **MySQL** en versie **MySQL 5.7.22**

    ![1](/db-mig/1.png)


    {{% notice note %}}
Je kunt de informatie over de MySQL versie van de database in de bronomgeving vinden via deze SQL query: **SELECT@@version;**
{{% /notice %}}

    In de **Settings** sectie, configureer de **DB instance identifier** (b.v. database-1), Master username (b.v. admin) en het Master password voor jouw nieuwe database instance.


    ![3_db](/db-mig/3_db.png)

    {{% notice note %}}
Onthoudt de **Master username** en het **Master password** goed, want deze heb je nodig in een latere stap.
{{% /notice %}}

    Selecteer **db.t3.medium** van de **standard DB instance class** en laat de standaardwaarden staan voor de database opslag.
    ![4_db](/db-mig/4_db.png)

3. Voor **Availability & durability**, laat de standaardwaarde staan om een stand-by instance aan te maken (het is altijd beter en veiliger om een multi-AZ database te gebruiken).

    ![5_db](/db-mig/5_db.png)

4. In de **Connectivity** sectie:

    * In **Virtual Private Cloud (VPC)**, selecteer **TargetVPC** (dit is een <a href="https://aws.amazon.com/vpc/" target="_blank">Amazon Virtual Private Cloud</a> die automatisch aangemaakt is voor deze workshop)
    * In **Additional connectivity configuration** -> **VPC Security Group**, selecteer **Create new VPC security group** en geef het een naam (b.v. "DB-SG").


    ![6_db](/db-mig/6_db.png)



    {{% notice note %}}
Let op: Later ga je deze **VPC security group** aanpassen zodat de **DMS Replication Instance** toegang heeft tot de database in de doelomgeving en om  toegang te geven voor jouw Webserver.
{{% /notice %}}

5. Voor de **Database authentication**, kies **Password authentication**.
6. In de **Additional configuration**, deactiveer **Enable Enhanced monitoring** onder de **Monitoring** sectie zoals onderstaand is afgebeeld:

    ![6_2_db](/db-mig/6_2_db.png)


    ![8_db](/db-mig/8_db.png)

    {{% notice note %}}
Zorg dat je **Enable Enhanced monitoring** deactiveert, anders kun ja een foutmelding krijgen omdat je geen IAM role kunt creëren in deze workshop.
{{% /notice %}}

6. Tot slot, observeer de **Estimated monthly costs** en klik op de **Create database** knop.

   ![8_2_db](/db-mig/8_2_db.png)
