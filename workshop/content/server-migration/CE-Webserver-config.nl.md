+++
title = "Configureer de applicatie"
weight = 50

+++

### Configureer de Webserver voor toegang tot de database in de doelomgeving

Zodra de omschakeling (Cutover) is afgerond en **CloudEndure Migration** de EC2 machine voor de Webserver in je doelomgeving heeft aangemaakt, dien je nog de configuratie van de webserver bij te werken zodat deze de AWS RDS database (opgezet in de **Database Migratie** stap) gaat gebruiken.


1. Pas de **Webserver security group** aan

    a. Ga naar de **AWS Console -> EC2** en selecteer de Webserver in de lijst  
    b. Noteer het **Public DNS (IPv4)** adres en het **Private IP** adres van de machine  
    c. Druk op de link van de toegewezen **security group**  

    ![Webserver details](/ce/webserver_details.png)

    d. Pas de configuratie (**inbound rules**) aan voor deze **security group** om toegang toe te staan van buitenaf op poort **80 (HTTP)** en van je laptop op poort **22 (SSH)**     

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Log in op de **Webserver** die door CloudEndure is aangemaakt.

    Gebruik hiervoor dezelfde **username (ubuntu)** en **SSH .ppk key** als voor de bronomgeving.

    Indien je hulp nodig hebt met het inloggen op de servers via SSH, kijk dan naar de onderstaande documentatie:
    - Voor Microsoft Windows gebruikers, kijk naar <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">dit artikel</a>.  
    - Voor Mac OS gebruikers, kijk naar <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">dit artikel</a>.

3. Pas de **wordpress configuratie** aan

    Bewerk het bestand **/var/www/html/wp-config.php** alsvolgt: 
    - DB_HOST - **Endpoint** van de aangemaakte RDS database
    - DB_USER - de gebruikersnaam die was geconfigureerd in de **Database Migratie** stap
    - DB_PASSWORD - het wachtwoord dat was geconfigureerd in de **Database Migration** stap

    Voeg ook de onderstaande 2 regels toe aan de configuratie. Vervang **TARGET_WEBSERVER_PUBLIC_DNS** met jouw Webserver EC2 **Public DNS (IPv4)** in de doelomgeving, zodat jouw Wordpress pagina naar de nieuwe webserver wijst.
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    for example
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```
   
    {{% notice tip %}}
Voor het bewerken van dit bestand, kun je bijvoorbeeld gebruik maken van <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> of <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Pas de configuratie van de RDS database **VPC security group** aan om toegang toe te staan voor dataverkeer van de Webserver

    a. Ga naar **AWS Console > Services > EC2 > Security Groups** en selecteer de **RDS VPC security group** (DB-SG)  
    b. Ga naar het **Inbound** werkblad en druk op **Edit**  
    c. Voeg een **Inbound rule** toe om toegang toe te staan voor data verkeer van de **Webserver** (gebruik het **Private IP** adres of de **security group** van de server) op poort **3306 (MySQL port)**
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

    {{% notice tip %}}
Als je een andere *security group* naam gebruikt voor de RDS database, dan kun je deze vinden in de configuratiedetails van de RDS database in de **Connectivity & security**, **Security** sectie.
{{% /notice %}}     
    

1. **Verifiëer** de migratie

    Open in je web browser het publieke DNS adres (IPv4) van de webserver.Je zou nu de unicorn store web pagina moeten zien.

Indien alles in orde lijkt, ga dan naar de volgende stap [Optimalisatie]({{< ref "../optimization/_index.nl.md" >}})!

## Troubleshooting

1. Verifiëer dat de RDS databasegegevens correct zijn in het bestand **/var/www/html/wp-config.php** in de webserver in de doelomgeving
2. Verifiëer dat de RDS databse de **DB-SG** security group gebruikt
3. Verifiëer dat de Webserver CloudEndure Blueprint verwijst naar het juitse subnet in de VPC van de doelomgeving (**TargetVPC public-subnet-a**)
