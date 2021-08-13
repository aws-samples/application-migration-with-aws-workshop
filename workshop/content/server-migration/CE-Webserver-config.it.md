+++
title = "Configura applicazione"
weight = 50

+++

### Configurare il server Web per accedere al database di destinazione



Quando Cutover è terminato e **CloudEndure Migration** ha creato un'istanza in esecuzione del Webserver nel tuo account AWS, è tempo di aggiornare la configurazione dell'applicazione Web per utilizzare il database RDS AWS replicato (creato nello step  **Database Migration** ).


1. Aggiorna il  **security group del Webserver**

    a. Vai su  **AWS Console -> EC2** e selezione il WebServer dalla lista.  
    b. Prendi nota del suo indirizzo  **Public DNS (IPv4)** e  **Private IP**  
    c. Clicca su Security Group assegnato

    ![Webserver details](/ce/webserver_details.png)

    d. Modifica le regole in entrata per quel gruppo di sicurezza per consentire il traffico da qualsiasi punto della porta **80** e dal tuo laptop sulla porta **22** 

    ![Inbound rules modification](/ce/edit_webserver_inbound_rules.png)

2. Accedi al **Webserver** creato da CloudEndure

    Utilizzare lo stesso nome utente (ubuntu) e chiave SSH .ppk come per l'ambiente di origine.

    Se non sei sicuro di come utilizzare SSH per accedere ai server, controlla quanto segue:
    - Per gli utenti di Microsoft Windows visualizzare <a href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/putty.html" target="_blank" rel="noopener noreferrer">questo articolo</a>.  
    - Per gli utenti di MacOS visualizzare <a href="https://docs.aws.amazon.com/quickstarts/latest/vmlaunch/step-2-connect-to-instance.html#sshclient" target="_blank" rel="noopener noreferrer">questo articolo</a>.

3. Modifica la  **configurazione di wordpress**

    Modifica il file **/var/www/html/wp-config.php** , cambiando
    - DB_HOST - Endpoint dell'istanza RDS creata
    - DB_USER - la username configurata nel passaggio **Database Migration** 
    - DB_PASSWORD - la password configurata nel passaggio **Database Migration** 
    
    Aggiungi anche le seguenti due righe, sostituendo **TARGET_WEBSERVER_PUBLIC_DNS** con Target Webserver EC2 **Public DNS (IPv4)**, per assicurarti che i collegamenti nel tuo sito wordpress puntino al nuovo server web.
              
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
Per modificare il file,  potete usare ad esempio <a href="https://www.howtoforge.com/linux-nano-command/" target="_blank" rel="noopener noreferrer">nano</a> oppure <a href="https://www.washington.edu/computing/unix/vi.html" target="_blank" rel="noopener noreferrer">vi</a>.
{{% /notice %}}     

4. Aggiornare il **VPC security group** dell'istanza RDS per consentire il traffico in entrata da Webserver

    a. Andare su  **AWS Console > Services > EC2 > Security Groups** e selezionare il vostro **RDS VPC security group** (DB-SG)  
    b. Andare sul tab **Inbound** e cliccare il bottone **Edit**  
    c. Aggiungere una regola di inbound che abilita il traffico dal **Webserver** (usando il suo **Private IP** oppure il  **security group** a cui appartiene) sulla porta **3306** (porta MySQL)
    
    ![Inbound rules modification](/ce/database_update_security_group.png)

    {{% notice tip %}}
Se hai utilizzato un nome di gruppo di sicurezza diverso per l'istanza RDS, puoi trovarlo nei dettagli dell'istanza RDS, sezione **Connectivity & security**, **Security** .
{{% /notice %}}     
    

1. **Validare** la migrazione

    Apri il nome DNS pubblico Webserver (IPv4) nel tuo browser web, dovresti vedere un negozio di unicorni.

Se tutto funziona correttamente, passa alla fase successiva, quindi [Optimization]({{< ref "../optimization/_index.it.md" >}})!

## Troubleshooting

1. Assicurarsi che le informazioni relative al database RDS configurate sul server Web in **/ var / www / html / wp-config.php** siano corrette
2. Assicurarsi che il database RDS stia utilizzando il gruppo di sicurezza **DB-SG**
3. Assicurati che il Webserver CloudEndure Blueprint punti su un **TargetVPC public-subnet-a**
