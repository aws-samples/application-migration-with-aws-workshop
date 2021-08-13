+++
title = "Anwendung konfigurieren"
weight = 50

+++

### Konfigurieren Sie den Webserver für den Zugriff auf die Zieldatenbank

Wenn die Umstellung abgeschlossen ist und **CloudEndure Migration** eine laufende Instanz 
des Webservers in Ihrem AWS-Konto erstellt hat, ist es Zeit, die Webanwendungskonfiguration 
zu aktualisieren, um Ihre replizierte AWS RDS-Datenbank (erstellt in der **Datenbankmigration**) 
verwenden zu können.

1. Aktualisieren Sie die **Webserver security group**

    a. Besuchen Sie **AWS Console -> EC2** und wählen Sie den Webserver aus der Liste  
    b. Notieren Sie die **Public DNS (IPv4)** IP-Adresse und die **Private IP**-Adresse.  
    c. Klicken Sie auf die zugewiesene Sicherheitsgruppe  

    ![Webserver details](/ce/webserver_details.png)

    d. Ändern Sie die eingehenden Regeln für diese Sicherheitsgruppe, um Datenverkehr von überall 
    auf Port **80** und von Ihrem Rechner auf Port **22** zuzulassen. 

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Melden Sie sich bei dem von CloudEndure erstellten **Webserver** an 

    Verwenden Sie denselben Benutzernamen (ubuntu) 
    und denselben SSH-PPK-Schlüssel wie für die Quellumgebung.

    Wenn Sie nicht sicher sind, wie Sie mit SSH auf Server zugreifen können, überprüfen Sie Folgendes:
    - Eine Anleitung für die Microsoft Windows Benutzer <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">finden Sie hier</a>.  
    - Eine Anleitung für die Mac OS/Linux Benutzer <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">finden Sie hier</a>.    

3. Ändern Sie die **Wordpress Konfiguration**

    Bearbeiten Sie die **/var/www/html/wp-config.php** Datei und ändern Sie folgende Parameter:
    - DB_HOST - die erstellte RDS Instanz
    - DB_USER - Der im Schritt **Datenbankmigration** konfigurierte Benutzername
    - DB_PASSWORD - Das im Schritt **Datenbankmigration** konfigurierte Kennwort
    
    Fügen Sie außerdem die folgenden zwei Zeilen hinzu und ersetzen Sie 
    **TARGET_WEBSERVER_PUBLIC_DNS** durch Ihren Ziel-Webserver EC2 **Public DNS (IPv4)**, 
    um sicherzustellen, dass Links auf Ihrer WordPress-Site auf den neuen Webserver verweisen.
              
    ```
    define('WP_SITEURL', 'http://TARGET_WEBSERVER_PUBLIC_DNS');        
    define('WP_HOME',    'http://TARGET_WEBSERVER_PUBLIC_DNS');
    ```
    
    zum Beispiel
    ```
    define('WP_SITEURL', 'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
    define('WP_HOME',    'http://ec2-34-208-233-184.us-west-2.compute.amazonaws.com');
   ```

{{% notice tip %}}
Zum Bearbeiten dieser Datei können Sie beispielsweise 
<a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> 
oder <a href="https://www.washington.edu/computing/unix/vi.html" target ="_blank">vi</a> verwenden.
{{% /notice %}}     

4. Aktualisieren Sie die RDS-Instanz **VPC security group**, um eingehenden Datenverkehr 
vom Webserver zuzulassen. 

    a. Besuchen Sie  **AWS Console > Services > EC2 > Security Groups** und wählen Sie die 
    **RDS VPC security group** (DB-SG) aus.  
    b. Wählen Sie **Inbound**-Tab und klicken Sie auf die **Edit** Schaltfläche darauf.  
    c. Fügen Sie eine eingehende Regel hinzu, die Datenverkehr vom **Webserver** 
    (unter Verwendung seiner **privaten IP** oder der **Sicherheitsgruppe**, zu der er gehört) 
    auf Port **3306** (MySQL-Port) zulässt.
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

{{% notice tip %}}
Wenn Sie für Ihre RDS-Instanz einen anderen Sicherheitsgruppennamen verwendet haben, 
finden Sie diesen in den Details Ihrer RDS-Instanz, bei **Konnektivität und Sicherheit**, 
**Sicherheit**.
{{% /notice %}}     
    
5. **Überprüfen** Sie die Migration.

    Öffnen Sie den Webserver Public DNS, oder die externe IP-Adresse in Ihrem Webbrowser. 
    Es sollte ein Einhorn-Webshop angezeigt werden.

Wenn alles gut funktioniert hat - fahren Sie mit der nächsten Phase fort, also [Optimierung] ({{<ref "../optimization/_index.de.md">}})!

## Troubleshooting - wenn es noch nicht alles funktioniert

1. Stellen Sie sicher, dass die auf dem Webserver in **/var/www/html/wp-config.php** konfigurierten Informationen zur RDS-Datenbank korrekt sind 
2. Stellen Sie sicher, dass die RDS-Datenbank die Sicherheitsgruppe **DB-SG** verwendet wird. 
3. Stellen Sie sicher, dass der Webserver **CloudEndure Blueprint** auf ein **TargetVPC public-subnet-a** zeigt.
